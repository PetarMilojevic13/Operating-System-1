.global supervisorTrap
.extern _ZN5Riscv24supervisorsyscallHandlerEv
.extern _ZN5Riscv22supervisorTimerHandlerEv
.extern _ZN5Riscv33supervisorOutsideInterruptHandlerEv
.type supervisorTrap, @function
.align 4
supervisorTrap:
    j pushAllRegistersSysCall
    j pushAllRegistersTimer
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    j pushAllRegistersOutsideInterrupt



pushAllRegistersSysCall:


    addi sp, sp, -256
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    call _ZN5Riscv24supervisorsyscallHandlerEv
    sd x10, 80(sp)    #vracanje a0 da se ne pregazi pri popovanju svih registara
    j popAllRegisters


pushAllRegistersTimer:

    addi sp, sp, -256
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    call _ZN5Riscv22supervisorTimerHandlerEv
    j popAllRegisters

pushAllRegistersOutsideInterrupt:
    addi sp, sp, -256
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    call _ZN5Riscv33supervisorOutsideInterruptHandlerEv
    j popAllRegisters

popAllRegisters:
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret