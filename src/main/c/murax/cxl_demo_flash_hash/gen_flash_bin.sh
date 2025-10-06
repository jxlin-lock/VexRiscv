make clean
make
python ./convert.py > ./build/cxl_flash_converted.bin
cp ./build/cxl_flash_converted.bin ../../../../../simulator