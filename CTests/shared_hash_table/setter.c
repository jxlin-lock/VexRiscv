#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include "shared_kv.h"

// kv_update function is unchanged from the previous version
void kv_update(SharedKVStore* store, const char* key, const char* value); // Declaration

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <key> <value>  OR  %s --destroy\n", argv[0], argv[0]);
        return 1;
    }

    // Handle cleanup command
    if (strcmp(argv[1], "--destroy") == 0) {
        printf("Destroying Huge Page file.\n");
        unlink(HUGEPAGE_FILE_PATH);
        return 0;
    }
    
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <key> <value>\n", argv[0]);
        return 1;
    }

    // 1. Create a file on the hugetlbfs filesystem
    int fd = open(HUGEPAGE_FILE_PATH, O_CREAT | O_RDWR, 0666);
    if (fd == -1) {
        perror("open (is /dev/hugepages mounted and do you have permissions?)");
        return 1;
    }

    // 2. Set the size to one full Huge Page
    if (ftruncate(fd, HUGE_PAGE_SIZE) == -1) {
        perror("ftruncate");
        close(fd);
        return 1;
    }

    // 3. Map the file
    SharedKVStore* store = (SharedKVStore*)mmap(0, HUGE_PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (store == MAP_FAILED) {
        perror("mmap");
        close(fd);
        return 1;
    }

    // Initialize mutex on first run
    if (store->data_next_offset == 0) {
        printf("Initializing Huge Page memory and mutex...\n");
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
        pthread_mutex_init(&store->mutex, &attr);
    }
    
    // Lock, update, unlock
    pthread_mutex_lock(&store->mutex);
    kv_update(store, argv[1], argv[2]);
    pthread_mutex_unlock(&store->mutex);

    // Unmap and close
    munmap(store, HUGE_PAGE_SIZE);
    close(fd);
    
    return 0;
}


// The implementation of kv_update is exactly the same as before
void kv_update(SharedKVStore* store, const char* key, const char* value) {
    uint64_t key_hash = hash_key(key);
    uint32_t bucket_idx = key_hash % NUM_BUCKETS;
    Bucket* bucket = &store->index_region[bucket_idx];
    IndexEntry* target_entry = NULL;
    IndexEntry* empty_slot = NULL;
    for (int i = 0; i < ENTRIES_PER_BUCKET; ++i) {
        if (bucket->entries[i].data_offset == 0) {
            if (!empty_slot) empty_slot = &bucket->entries[i];
        } else if (bucket->entries[i].key_hash == key_hash) {
            DataEntry* data_entry = (DataEntry*)&store->data_region[bucket->entries[i].data_offset];
            const char* existing_key = (const char*)data_entry + sizeof(DataEntry);
            if (strncmp(key, existing_key, data_entry->key_len) == 0) {
                target_entry = &bucket->entries[i];
                break;
            }
        }
    }
    if (!target_entry && !empty_slot) {
        fprintf(stderr, "Error: Bucket full for key '%s'.\n", key);
        return;
    }
    size_t key_len = strlen(key);
    size_t data_len = strlen(value);
    size_t total_size = sizeof(DataEntry) + key_len + data_len;
    if (store->data_next_offset + total_size > DATA_REGION_SIZE) {
        fprintf(stderr, "Error: Data region is full.\n");
        return;
    }
    size_t new_data_offset = store->data_next_offset;
    DataEntry* new_data_entry = (DataEntry*)&store->data_region[new_data_offset];
    new_data_entry->key_len = key_len;
    new_data_entry->data_len = data_len;
    memcpy((char*)new_data_entry + sizeof(DataEntry), key, key_len);
    memcpy((char*)new_data_entry + sizeof(DataEntry) + key_len, value, data_len);
    new_data_entry->checksum = 0;
    new_data_entry->checksum = calculate_checksum(new_data_entry, total_size);
    store->data_next_offset += total_size;
    if (target_entry) {
        target_entry->data_offset = new_data_offset;
        target_entry->version_number++;
    } else {
        empty_slot->key_hash = key_hash;
        empty_slot->data_offset = new_data_offset;
        empty_slot->version_number = 1;
    }
    printf("Set: '%s' -> '%s'\n", key, value);
}