#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "shared_kv.h"

void kv_set(SharedKVStore* store, const char* key, const char* value); // Declaration

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <key> <value> OR %s --destroy\n", argv[0], argv[0]);
        return 1;
    }
    if (strcmp(argv[1], "--destroy") == 0) {
        unlink(HUGEPAGE_FILE_PATH);
        printf("Destroyed shared memory file.\n");
        return 0;
    }
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <key> <value>\n", argv[0]);
        return 1;
    }

    int fd = open(HUGEPAGE_FILE_PATH, O_CREAT | O_RDWR, 0666);
    if (fd == -1) { perror("open"); return 1; }

    // The size must be a multiple of the huge page size.
    if (ftruncate(fd, TOTAL_MEM_SIZE) == -1) { perror("ftruncate"); return 1; }

    SharedKVStore* store = mmap(0, TOTAL_MEM_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (store == MAP_FAILED) { perror("mmap"); return 1; }

    kv_set(store, argv[1], argv[2]);

    return 0;
}

// kv_set function is unchanged
void kv_set(SharedKVStore* store, const char* key, const char* value) {
    if (strlen(key) >= MAX_KEY_LEN) {
        fprintf(stderr, "Error: Key is too long (max %d chars).\n", MAX_KEY_LEN - 1);
        return;
    }
    if (strlen(value) >= MAX_VALUE_LEN) {
        fprintf(stderr, "Error: Value is too long (max %d chars).\n", MAX_VALUE_LEN - 1);
        return;
    }
    uint64_t key_hash = hash_key(key);
    uint32_t bucket_idx = key_hash % NUM_BUCKETS;
    Bucket* bucket = &store->index[bucket_idx];
    KVSlot* target_slot = NULL;
    KVSlot* empty_slot = NULL;
    for (int i = 0; i < SLOTS_PER_BUCKET; ++i) {
        if (bucket->slots[i].in_use) {
            if (strncmp(bucket->slots[i].key, key, MAX_KEY_LEN) == 0) {
                target_slot = &bucket->slots[i];
                break;
            }
        } else {
            if (!empty_slot) empty_slot = &bucket->slots[i];
        }
    }
    if (target_slot) {
        strncpy(target_slot->value, value, MAX_VALUE_LEN);
        printf("Updated key '%s'.\n", key);
    } else if (empty_slot) {
        empty_slot->in_use = true;
        strncpy(empty_slot->key, key, MAX_KEY_LEN);
        strncpy(empty_slot->value, value, MAX_VALUE_LEN);
        printf("Set new key '%s'.\n", key);
    } else {
        fprintf(stderr, "Error: Bucket is full for key '%s'.\n", key);
    }
}