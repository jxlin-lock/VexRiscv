# KV Hash

bash setup_hugepage.sh
sudo python3 runsetter.py # on one terminal
sudo python3 rungetter.py # on another terminal (If test use Linux)

If test use CXL FPGA, rungetter under src/main/c/murax/cxl_demo_flash_hash


## Problem

```c
volatile uint8_t * result_cxl_mem;
result_cxl_mem = (uint8_t *) 0xA0000000; // Start at 0


// while(result_cxl_mem[0] == 0);
result_cxl_mem[0] =  0xef;
result_cxl_mem[1] =  0x11;
result_cxl_mem[2] =  0x22;
result_cxl_mem[3] =  0x33;
```

```c
uint32_t *val = (uint32_t *) write_base_addr;
for(int  i = 0; i < 10; i++){
    fprintf(stderr, "i 0x%4x val[i] = %04x\n", i, val[i]);
}
```

```
i 0x   0 val[i] = 00ef
i 0x   1 val[i] = 0000
i 0x   2 val[i] = 0011
i 0x   3 val[i] = 0000
i 0x   4 val[i] = 0022
i 0x   5 val[i] = 0000
i 0x   6 val[i] = 0033
i 0x   7 val[i] = 0000
i 0x   8 val[i] = 0000
i 0x   9 val[i] = 0000
```

With `uint16_t`:

```
i 0x   0 val[i] = 00ef
i 0x   1 val[i] = 0000
i 0x   2 val[i] = 0000
i 0x   3 val[i] = 0000
i 0x   4 val[i] = 0022
i 0x   5 val[i] = 0000
i 0x   6 val[i] = 0000
i 0x   7 val[i] = 0000
i 0x   8 val[i] = 0033
i 0x   9 val[i] = 0000
```

With `uint32_t`:

```
i 0x   0 val[i] = ef
i 0x   1 val[i] = 00
i 0x   2 val[i] = 00
i 0x   3 val[i] = 00
i 0x   4 val[i] = 11
i 0x   5 val[i] = 00
i 0x   6 val[i] = 00
i 0x   7 val[i] = 00
i 0x   8 val[i] = 22
i 0x   9 val[i] = 00
i 0x   a val[i] = 00
i 0x   b val[i] = 00
i 0x   c val[i] = 33
i 0x   d val[i] = 00
i 0x   e val[i] = 00
i 0x   f val[i] = 00
```

With `uint64_t`:

```
i 0x   0 val[i] = ef
i 0x   1 val[i] = 00
i 0x   2 val[i] = 00
i 0x   3 val[i] = 00
i 0x   4 val[i] = 00
i 0x   5 val[i] = 00
i 0x   6 val[i] = 00
i 0x   7 val[i] = 00
i 0x   8 val[i] = 11
i 0x   9 val[i] = 00
i 0x   a val[i] = 00
i 0x   b val[i] = 00
i 0x   c val[i] = 00
i 0x   d val[i] = 00
i 0x   e val[i] = 00
i 0x   f val[i] = 00
i 0x  10 val[i] = 22
i 0x  11 val[i] = 00
i 0x  12 val[i] = 00
i 0x  13 val[i] = 00
i 0x  14 val[i] = 00
i 0x  15 val[i] = 00
i 0x  16 val[i] = 00
i 0x  17 val[i] = 00
i 0x  18 val[i] = 33
i 0x  19 val[i] = 00
i 0x  1a val[i] = 00
i 0x  1b val[i] = 00
i 0x  1c val[i] = 00
i 0x  1d val[i] = 00
i 0x  1e val[i] = 00
i 0x  1f val[i] = 00
i 0x  20 val[i] = 00
```