# Operating-System-1
The OS kernel has been made for specifically RISC-V architecture and is executed via QEMU emulator.
A small operating system kernel that consists of multiple system calls and does not use any external system call,
so it does not rely on external C libraries.
System calls include multithreading,memory allocation and semaphores.
The operating system also includes support for handling external interrupts via an vector interrupt table,
along with rerouting the timer interrupt for proper handling.
