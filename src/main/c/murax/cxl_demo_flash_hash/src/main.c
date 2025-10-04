//#include "stddefs.h"
#include <stdint.h>

#include "shared_kv.h"
#include "murax.h"

void print(char*str){
	while(*str){
		uart_write(UART,*str);
		str++;
	}
}
void println(char*str){
	print(str);
	uart_write(UART,'\n');
}

void delay(uint32_t loops){
	for(int i=0;i<loops;i++){
		int tmp = GPIO_A->OUTPUT;
	}
}

char* kv_get(SharedKVStore* store, const char* key) {
    uint64_t key_hash = hash_key(key);
    uint32_t bucket_idx = key_hash % NUM_BUCKETS;
    Bucket* bucket = &store->index[bucket_idx];
    for (int i = 0; i < SLOTS_PER_BUCKET; ++i) {
        if (bucket->slots[i].in_use && my_strncmp(bucket->slots[i].key, key, MAX_KEY_LEN) == 0) {
            return bucket->slots[i].value;
        }
    }
    return -1;
}


void main() {
	// Register address range: 0xF0000000 - 0xF0001000
	// CXL memory address range: 0xA0000000 - 0xA1FFFFFF
	volatile char * ptr_reg1;
	ptr_reg1 =0xF0000040;

	volatile uint32_t * ptr_cxl_mem;
	ptr_cxl_mem = 0xA0000000;

	SharedKVStore* store = (SharedKVStore*)ptr_cxl_mem;
	char* value = kv_get(store, "key1"); //TODO: write a loop with pattern
	// verify the first 8 bytes of the value
	for(int i = 0; i < 8; i ++){
		ptr_reg1[i] = value[i];
	}
}

void irqCallback(){
}
