all: run

compile:
	verilator --Wno-PINMISSING --binary -f files.f --top-module tb_briey -Wno-WIDTHTRUNC


run: compile
	./obj_dir/Vtb_briey

riscv_bench:
	verilator --Wno-PINMISSING --binary -f files.f --top-module riscv_bench -Wno-WIDTHTRUNC
