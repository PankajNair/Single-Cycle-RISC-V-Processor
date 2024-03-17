# Single Cycle RISC-V Processor
My implementation of the RV32IM processor based on the Textbook - Digital Design and Computer Architecture: RISC-V Edition by Sarah Harris and David Harris

Microarchitecture:
![processor](https://github.com/PankajNair/Single-Cycle-RISC-Processor/blob/main/processor.png)

The processor implements all base integer and multiply instructions except for ecall and ebreak. The 'riscvtest.mem' file contains the machine code for the processor to execute. Upon successful execution, the processor stores the value 25 in address 100 of data memory. The testbenches for each module in the design are also available.
