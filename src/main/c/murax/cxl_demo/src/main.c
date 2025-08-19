//#include "stddefs.h"
#include <stdint.h>

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

void main() {
	// Register address range: 0xF0000000 - 0xF0001000
	// CXL memory address range: 0xA0000000 - 0xA1FFFFFF
	volatile uint32_t * ptr_reg1;
	ptr_reg1 =0xF0000040;

	volatile uint32_t * ptr_cxl_mem;
	ptr_cxl_mem = 0xA0000000;


	int* accumulate; // CXL int array
	accumulate = (int*)ptr_cxl_mem; // CXL memory address

	int sum = 0;
	for(int i = 0; i < 10; i++){
		accumulate[i] = i; 
	}

	for(int i = 0; i < 10; i++){
		sum += accumulate[i];
	}

	int check = (sum == 45) ? 1 : -1;
	*ptr_reg1 = sum;
	*ptr_reg1 = check;
}

void irqCallback(){
}
