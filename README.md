# Customizing_RISC_V
## Implementing ORB Feature detection algorithm on RISC-V Core
This repository uses files from cliffordwolf's picoRV32 CPU Core (https://github.com/cliffordwolf/picorv32).
The aim is to be able to run the ORB Feature detection algorithm on the CPU core and later optimize the core for faster implementation of the algorithm.

## Folders/Files in this Repository
### picorv32.v
Verilog file for the CPU core.

### firmware
The necessary firmware files (Taken from the cliffordwolf's repository) to run the picoRV32 core and generate a .hex file.

### Test_Progs
Sample C programs tested on the core.

### Runs
The Makefile, testbench, linker script (sections.lds), sample C program and other standard C library files and syscalls. 

### Firmware_Trial (Not Finished)
An attempt to white a shell file to compile and run the C code and simulate the core using iverilog.

## Prerequisites to run the CPU core
* RISC-V GNU tool chain (https://github.com/GauravSingh789/picorv32#building-a-pure-rv32i-toolchain)
* GTKwave (https://iverilog.fandom.com/wiki/GTKWave) to view waveforms (.vcd output). 
  Steps to install -> 
  ```
  sudo apt-get update
  sudo apt-get install gtkwave
  ```
## Building the core and loading the hex file 
To Run the modified dhrystone example in Runs folder, Run the makefile from the terminal - 
  ```
  make dhry.hex
  make test
  ```
  #### Sample program's output
  ![Sample Output](../master/Output_2.png)
  
## TO-DO
 * Implementing Standalone C code for FAST (https://github.com/edrosten/fast-C-src) on the CPU core after reading an image in the required format (i.e., we need to performing this conversion using MATLAB) as required by the FAST C code.
 * Implemenitng rest of the parts of the ORB Algorithm on the CPU, taking the code by Ahmed Hisham (https://github.com/AhmedHisham1/ORB-feature-matching) as the reference for the standalone code.
  
  
