## CXL RISCV Usage

To load and reload program in the Briey RISCV core:

## Base program

Base program will initially be load into the RISV core when FPGA compiles. This base program is in `src/main/c/murax/cxl_demo_base/main.c`.

## Flash program

This is the base program will runtime load into the RISV core. This flash program is in `src/main/c/murax/cxl_demo_flash/main.c`.

## How to compile CPU core, base program and flash program

Just run:
```console
~/VexRiscv$ bash build.sh
```
This will 
1. Compile and build the base/flash program
2. Generate the RISCV core that load base program at initial begin.

In ./simulator, you could find the generated files.
- `Briey.sv` -> the CPU core
- `Briey_wrap.sv` -> the wrapper for the CPU
- `Briey.v_toplevel_axi_ram_reset_area_ram_ram_symbolx.bin` -> the base program bin
- `cxl_flash_converted.bin` -> the runtime flash program under `src/main/c/murax/cxl_demo_flash`

## How to runtime flash the cxl_flash_converted.bin
In high level:
1. reset the CPU core (set axi4_mm_rst_n = 0 in Briey_wrap.sv)
2. keep the CPU core being reseted, set program_load_en = 1
3. use the program_load axi interface to write `cxl_flash_converted.bin` into the core.
4. set program_load_en = 0
5. dereset the core (set axi4_mm_rst_n = 1)

## Program load axi interface
To see how to use the program load axi interface, you could reference `./simulator/riscv_bench.sv` line 213, program_loader module.

You could reuse that module, change the initial begin and just load the cxl_flash_converted.bin into `program_file` register byte arrays, and set `program_load_en` to start flash.

## How to only compile the flash program
In some case, if you only want to compile the flash program:
```console
~/VexRiscv/src/main/c/murax/cxl_demo_flash$ bash gen_flash_bin.sh
```
This will generate and copy new bin to `~/VexRiscv/simulator/cxl_flash_converted.bin`.

## New register interface
Now the register arrays are in Briey_wrap.sv's register_ram module. You could add your own logic their.

