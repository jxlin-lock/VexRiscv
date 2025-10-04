#ifndef SHARED_KV_H
#define SHARED_KV_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <pthread.h>

// Path to the file on the Huge Page filesystem
#define HUGEPAGE_FILE_PATH "/dev/hugepages/kv_store_hp"
#define HUGE_PAGE_SIZE (2 * 1024 * 1024) // 2MB, must match system's Hugepagesize

// --- Configuration ---
#define NUM_BUCKETS 1024
#define ENTRIES_PER_BUCKET 4
#define DATA_REGION_SIZE (1024 * 1024)

// --- Shared Data Structures (no changes here) ---
typedef struct {
    uint16_t format;
    uint32_t key_len;
    uint32_t data_len;
    uint32_t checksum;
} DataEntry;

typedef struct {
    uint64_t key_hash;
    uint32_t version_number;
    size_t data_offset;
} IndexEntry;

typedef struct {
    IndexEntry entries[ENTRIES_PER_BUCKET];
} Bucket;

typedef struct {
    pthread_mutex_t mutex;
    size_t data_next_offset;
    Bucket index_region[NUM_BUCKETS];
    char data_region[DATA_REGION_SIZE];
} SharedKVStore;

// Static assertion to ensure our struct fits in one Huge Page
_Static_assert(sizeof(SharedKVStore) < HUGE_PAGE_SIZE, "SharedKVStore size exceeds HUGE_PAGE_SIZE");


// --- Helper Functions (no changes here) ---
static uint64_t hash_key(const char* key) {
    uint64_t hash = 5381;
    int c;
    while ((c = *key++)) { hash = ((hash << 5) + hash) + c; }
    return hash;
}

static uint32_t calculate_checksum(const void* data, size_t length) {
    uint32_t checksum = 0;
    const unsigned char* p = data;
    for (size_t i = 0; i < length; ++i) { checksum += p[i]; }
    return checksum;
}

#endif // SHARED_KV_H