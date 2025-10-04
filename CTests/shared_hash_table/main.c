#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// --- Configuration ---
#define NUM_BUCKETS 1024
#define ENTRIES_PER_BUCKET 4
#define DATA_REGION_SIZE (1024 * 1024)

// --- Data Structures ---
typedef struct {
    uint16_t format;
    uint32_t key_len;
    uint32_t data_len;
    uint32_t checksum;
} DataEntry;

typedef struct {
    uint64_t key_hash;
    uint32_t version_number;
    DataEntry* pointer;
} IndexEntry;

typedef struct {
    IndexEntry entries[ENTRIES_PER_BUCKET];
} Bucket;

typedef struct {
    Bucket* index_region;
    char* data_region;
    size_t data_capacity;
    size_t data_next_offset;
} KVStore;

// --- Helper Functions ---
static uint64_t hash_key(const char* key) {
    uint64_t hash = 5381;
    int c;
    while ((c = *key++)) {
        hash = ((hash << 5) + hash) + c;
    }
    return hash;
}

static uint32_t calculate_checksum(const void* data, size_t length) {
    uint32_t checksum = 0;
    const unsigned char* p = data;
    for (size_t i = 0; i < length; ++i) {
        checksum += p[i];
    }
    return checksum;
}

// --- Core KV Store API ---
KVStore* kv_store_create() {
    KVStore* store = (KVStore*)malloc(sizeof(KVStore));
    if (!store) {
        perror("Failed to allocate KVStore");
        return NULL;
    }
    store->index_region = (Bucket*)calloc(NUM_BUCKETS, sizeof(Bucket));
    if (!store->index_region) {
        perror("Failed to allocate index region");
        free(store);
        return NULL;
    }
    store->data_region = (char*)malloc(DATA_REGION_SIZE);
    if (!store->data_region) {
        perror("Failed to allocate data region");
        free(store->index_region);
        free(store);
        return NULL;
    }
    store->data_capacity = DATA_REGION_SIZE;
    store->data_next_offset = 0;
    printf("KVStore created successfully.\n");
    return store;
}

void kv_store_destroy(KVStore* store) {
    if (store) {
        free(store->index_region);
        free(store->data_region);
        free(store);
        printf("KVStore destroyed.\n");
    }
}

int kv_update(KVStore* store, const char* key, const char* value) {
    uint64_t key_hash = hash_key(key);
    uint32_t bucket_idx = key_hash % NUM_BUCKETS;
    Bucket* bucket = &store->index_region[bucket_idx];
    IndexEntry* target_entry = NULL;
    IndexEntry* empty_slot = NULL;
    for (int i = 0; i < ENTRIES_PER_BUCKET; ++i) {
        if (bucket->entries[i].pointer == NULL) {
            if (!empty_slot) empty_slot = &bucket->entries[i];
        } else if (bucket->entries[i].key_hash == key_hash) {
            DataEntry* data_entry = bucket->entries[i].pointer;
            const char* existing_key = (const char*)data_entry + sizeof(DataEntry);
            if (strncmp(key, existing_key, data_entry->key_len) == 0) {
                target_entry = &bucket->entries[i];
                break;
            }
        }
    }
    if (!target_entry && !empty_slot) {
        fprintf(stderr, "Error: Bucket full for key '%s'.\n", key);
        return -1;
    }
    size_t key_len = strlen(key);
    size_t data_len = strlen(value);
    size_t total_size = sizeof(DataEntry) + key_len + data_len;
    if (store->data_next_offset + total_size > store->data_capacity) {
        fprintf(stderr, "Error: Data region is full.\n");
        return -1;
    }
    char* data_ptr = store->data_region + store->data_next_offset;
    DataEntry* new_data_entry = (DataEntry*)data_ptr;
    new_data_entry->format = 1;
    new_data_entry->key_len = key_len;
    new_data_entry->data_len = data_len;
    char* key_dest = data_ptr + sizeof(DataEntry);
    char* data_dest = key_dest + key_len;
    memcpy(key_dest, key, key_len);
    memcpy(data_dest, value, data_len);
    new_data_entry->checksum = 0;
    uint32_t checksum_val = calculate_checksum(data_ptr, total_size);
    new_data_entry->checksum = checksum_val;
    store->data_next_offset += total_size;
    if (target_entry) {
        target_entry->pointer = new_data_entry;
        target_entry->version_number++;
    } else {
        empty_slot->key_hash = key_hash;
        empty_slot->pointer = new_data_entry;
        empty_slot->version_number = 1;
    }
    printf("Updated key '%s' with value '%s'. Checksum: %u\n", key, value, checksum_val);
    return 0;
}

int kv_get(KVStore* store, const char* key, char** value) {
    uint64_t key_hash = hash_key(key);
    uint32_t bucket_idx = key_hash % NUM_BUCKETS;
    Bucket* bucket = &store->index_region[bucket_idx];
    for (int i = 0; i < ENTRIES_PER_BUCKET; ++i) {
        IndexEntry* entry = &bucket->entries[i];
        if (entry->pointer != NULL && entry->key_hash == key_hash) {
            DataEntry* data_entry = entry->pointer;
            const char* entry_key = (const char*)data_entry + sizeof(DataEntry);
            if (data_entry->key_len == strlen(key) && strncmp(key, entry_key, data_entry->key_len) == 0) {
                size_t total_size = sizeof(DataEntry) + data_entry->key_len + data_entry->data_len;
                uint32_t stored_checksum = data_entry->checksum;
                data_entry->checksum = 0;
                uint32_t actual_checksum = calculate_checksum(data_entry, total_size);
                data_entry->checksum = stored_checksum;
                if (stored_checksum != actual_checksum) {
                    fprintf(stderr, "Error: Checksum mismatch for key '%s'. Stored: %u, Calculated: %u. Data may be corrupt.\n",
                            key, stored_checksum, actual_checksum);
                    return -2;
                }
                const char* entry_data = entry_key + data_entry->key_len;
                *value = (char*)malloc(data_entry->data_len + 1);
                if (!*value) {
                    perror("Failed to allocate memory for value");
                    return -1;
                }
                memcpy(*value, entry_data, data_entry->data_len);
                (*value)[data_entry->data_len] = '\0';
                return 0;
            }
        }
    }
    return -1;
}

// --- Main Function (Example Usage) ---
int main() {
    KVStore* store = kv_store_create();
    if (!store) {
        return 1;
    }
    printf("\n--- Updating keys ---\n");
    kv_update(store, "name", "CliqueMap");
    kv_update(store, "language", "C");
    kv_update(store, "feature", "Fast Lookups");
    char* retrieved_value = NULL;
    printf("\n--- Retrieving keys ---\n");
    if (kv_get(store, "name", &retrieved_value) == 0) {
        printf("GET name -> %s\n", retrieved_value);
        free(retrieved_value);
    }
    if (kv_get(store, "language", &retrieved_value) == 0) {
        printf("GET language -> %s\n", retrieved_value);
        free(retrieved_value);
    }
    printf("\n--- Updating an existing key ---\n");
    kv_update(store, "name", "CliqueMap v2");
    if (kv_get(store, "name", &retrieved_value) == 0) {
        printf("GET name (updated) -> %s\n", retrieved_value);
        free(retrieved_value);
    }
    printf("\n--- Retrieving a non-existent key ---\n");
    if (kv_get(store, "version", &retrieved_value) == -1) {
        printf("GET version -> Key not found (as expected).\n");
    }
    kv_store_destroy(store);
    return 0;
}