## x86 architecture

```txt
|-CPU 
|  |-ALU
|  |-ControlUnit
|  |-clock
|  |-register
|-MEMORY (RAM/SSD/HARD_DRIVE)
|-I/O devices (KEYBOARD/MOUSE)
```

#### BUSES: Allows to communicate with different pieces of Hardware
#### Control Bus
#### Data Bus
#### Address Bus

* ALU(Arithemetic Logic Unit)
    * Carries operation ADD,AND,OR,NOT,etc
* Memory Register(fastest way to access data)
* CPU clock
    * synchronized cpu and bus 
    * 1 ghx = 1billion times per second
* Control Unit
    * uses a binary decoder to convert coded instruction into timing and control signals
    * direct the operation of other units(ALU,memory,I/O)

* FDE procedure
    * cpu steps to execute an instruction
    * fetch an instruction
    * decode an instruction
    * if operand are involved fetch the operand from memory/register
    * execute the instruction and update status flags
    * store the result if required

# Reading from memory 
* Memory access is slower then register access
* STEPS required
    * places the address of the value in address bus
    * change the processor's RD pin (called assert)
    * wait one clock cycle for memory to respond
    * copy the data from the data bus to the destination
    * each step takes one clock cycle
    * register takes only one clock cycle

## Caching (sits middle of register and memory)

* used to reduce read/write time for memory
* in x86
    * Level-1 cache is stored on the CPU
    * Level-2 cache is stored outside and accessed by high-speed data bus
* constructed using static ram, which does not need to be refreshed constantly

## Modes of operation

* **Protected Mode**: Native processor mode 
    * Multiple processes can be run 
    * Each given their own section of memory
    * They cant interact with different processes
* **Real Address Mode**: access directly hardware 
* **System Management Mode**: build more specific to the processor

## Registers

* x86 is a 32bit processor each register is 32bits in size
* 32bit: eax,ebx,ecx,edx
* 16bit: ax,bx,cx,dx
* 8bit: ah,bh,ch,dh
* 8bit: al,bl,cl,dl

* eax: auto used by multiply, division
* ebx: general purpose
* ecx: used as a loop counter by the cpu
* edx: general purpose
* esi: high speed memory transfer
* edi: high speed memory transfer
* ebp: reference function parameters and local variables on the stack
* esp: pointer to the current stack address

* eip: pointer the next instruction
* eflags: denotes the status of an operation
 * CF (carry flag)
 * OF (overflow flag)
 * SF (sign flag)
 * ZF (zero flag)
 * AC (auxiliary carry)
 * PF (parity flag)

