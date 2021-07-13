riscv32-unknown-elf-gcc -c -mabi=ilp32 -march=rv32im -o add_mul.o add_mul.cpp 
#riscv632-unknown-elf-gcc -c -mabi=ilp32 -march=rv32im -o load.o load.S

riscv32-unknown-elf-gcc -c -mabi=ilp32 -march=rv32im -o syscalls.o syscalls.c
riscv32-unknown-elf-gcc -mabi=ilp32 -march=rv32im -Wl,--gc-sections -o firmware.elf add_mul.o syscalls.o -T riscv.ld -lstdc++
chmod -x firmware.elf
riscv32-unknown-elf-gcc -mabi=ilp32 -march=rv32im -nostdlib -o start.elf start.S -T start.ld -lstdc++
chmod -x start.elf
riscv32-unknown-elf-objcopy -O verilog start.elf start.tmp
riscv32-unknown-elf-objcopy -O verilog firmware.elf firmware.tmp
cat start.tmp firmware.tmp > firmware.hex
python3 hex8tohex32.py firmware.hex > firmware32.hex
rm -f start.tmp firmware.tmp
iverilog -o testbench.vvp testbench.v picorv32.v
chmod -x testbench.vvp
vvp -N testbench.vvp

