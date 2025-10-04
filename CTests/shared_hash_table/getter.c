#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include "shared_kv.h"

// kv_get function is unchanged from the previous version
int kv_get(SharedKVStore* store, const char* key, char** value); // Declaration

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <key>\n", argv[0]);
        return 1;
    }

    // 1. Open the existing file on the hugetlbfs filesystem
    int fd = open(HUGEPAGE_FILE_PATH, O_RDWR, 0666);
    if (fd == -1) {
        perror("open failed. Has the setter program been run first?");
        return 1;
    }

    // 2. Map the file
    SharedKVStore* store = (SharedKVStore*)mmap(0, HUGE_PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (store == MAP_FAILED) {
        perror("mmap");
        close(fd);
        return 1;
    }
    
    // Lock, read, unlock
    char* retrieved_value = NULL;
    pthread_mutex_lock(&store->mutex);
    int result = kv_get(store, argv[1], &retrieved_value);
    pthread_mutex_unlock(&store->mutex);
    
    // Print result
    if (result == 0) {
        printf("Get: '%s' -> '%s'\n", argv[1], retrieved_value);
        free(retrieved_value);
    } else {
        printf("Get: Key '%s' not found.\n", argv[1]);
    }

    // Unmap and close
    munmap(store, HUGE_PAGE_SIZE);
    close(fd);
    
    return 0;
}

// The implementation of kv_get is exactly the same as before
int kv_get(SharedKVStore* store, const char* key, char** value) {
    uint64_t key_hash = hash_key(key);
    uint32_t bucket_idx = key_hash % NUM_BUCKETS;
    Bucket* bucket = &store->index_region[bucket_idx];
    for (int i = 0; i < ENTRIES_PER_BUCKET; ++i) {
        IndexEntry* entry = &bucket->entries[i];
        if (entry->data_offset != 0 && entry->key_hash == key_hash) {
            DataEntry* data_entry = (DataEntry*)&store->data_region[entry->data_offset];
            const char* entry_key = (const char*)data_entry + sizeof(DataEntry);
            if (data_entry->key_len == strlen(key) && strncmp(key, entry_key, data_entry->key_len) == 0) {
                const char* entry_data = entry_key + data_entry->key_len;
                *value = (char*)malloc(data_entry->data_len + 1);
                memcpy(*value, entry_data, data_entry->data_len);
                (*value)[data_entry->data_len] = '\0';
                return 0;
            }
        }
    }
    return -1;
}