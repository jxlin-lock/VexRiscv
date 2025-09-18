# build demo/main.c
cd ./src/main/c/murax/cxl_demo
bash copy_hex.sh

# run Briey build
cd ../../../../..
sbt -java-home "$JAVA_HOME" "runMain vexriscv.demo.BrieyWithMemoryInit"

# copy generated Briey.v to simulation
cp ./Briey.v* ./simulator
cp ./cxl_demo.bin ./simulator
cd simulator
python ./convert.py > cxl_demo_converted.bin
iverilog -g2012 -o sim.vvp ram_cache.sv riscv_bench.sv Briey_wrap.sv Briey.v
vvp sim.vvp
gtkwave wave.vcd

# /src/test/cpp/briey$ make clean run


