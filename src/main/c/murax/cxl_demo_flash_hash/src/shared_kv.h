#ifndef SHARED_KV_H
#define SHARED_KV_H

#define TOTAL_MEM_SIZE (NUM_PAGES * HUGE_PAGE_SIZE) // Total allocation is 4MB

#define NUM_BUCKETS 4096
#define SLOTS_PER_BUCKET 4

#define MAX_KEY_LEN 32
#define MAX_VALUE_LEN 128

typedef struct {
    char in_use;
    char key[MAX_KEY_LEN];
    char value[MAX_VALUE_LEN];
} KVSlot;

typedef struct {
    KVSlot slots[SLOTS_PER_BUCKET];
} Bucket;

typedef struct {
    Bucket index[NUM_BUCKETS];
} SharedKVStore;


int my_strncmp(const char *s1, const char *s2, int n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
        s1++; // Move to the next character in s1
        s2++; // Move to the next character in s2
        n--;  // Decrement the count of characters to compare
    }

    if (n == 0) {
        return 0;
    }
    return *(const unsigned char*)s1 - *(const unsigned char*)s2;
}

// --- Helper Function ---
static uint64_t hash_key(const char* key) {
    uint64_t hash = 5381;
    int c;
    while ((c = *key++)) { hash = ((hash << 5) + hash) + c; }
    return hash;
}

#endif // SHARED_KV_H