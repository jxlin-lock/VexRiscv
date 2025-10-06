#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "shared_kv.h"

char* kv_get(SharedKVStore* store, const char* key); // Declaration

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <key>\n", argv[0]);
        return 1;
    }

    int fd = open(HUGEPAGE_FILE_PATH, O_RDWR, 0666);
    if (fd == -1) {
        perror("open failed. Has the setter program been run first?");
        return 1;
    }

    // --- FIX IS HERE ---
    SharedKVStore* store = mmap(0, TOTAL_MEM_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (store == MAP_FAILED) {
        perror("mmap");
        return 1;
    }

    char* value = kv_get(store, argv[1]);
    if (value) {
        printf("Get: '%s' -> '%s'\n", argv[1], value);
    } else {
        printf("Get: Key '%s' not found.\n", argv[1]);
    }

    return 0;
}

// kv_get function is unchanged
char* kv_get(SharedKVStore* store, const char* key) {
    uint64_t key_hash = hash_key(key);
    uint32_t bucket_idx = key_hash % NUM_BUCKETS;
    Bucket* bucket = &store->index[bucket_idx];
    for (int i = 0; i < SLOTS_PER_BUCKET; ++i) {
        if (bucket->slots[i].in_use && my_strncmp(bucket->slots[i].key, key, MAX_KEY_LEN) == 0) {
            return bucket->slots[i].value;
        }
    }
    return NULL;
}