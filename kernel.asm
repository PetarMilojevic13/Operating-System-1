
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	b4813103          	ld	sp,-1208(sp) # 8000cb48 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7e5060ef          	jal	ra,80007000 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <supervisorTrap>:
.extern _ZN5Riscv22supervisorTimerHandlerEv
.extern _ZN5Riscv33supervisorOutsideInterruptHandlerEv
.type supervisorTrap, @function
.align 4
supervisorTrap:
    j pushAllRegistersSysCall
    80001000:	0280006f          	j	80001028 <pushAllRegistersSysCall>
    j pushAllRegistersTimer
    80001004:	0b40006f          	j	800010b8 <pushAllRegistersTimer>
	...
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    j pushAllRegistersOutsideInterrupt
    80001024:	1200006f          	j	80001144 <pushAllRegistersOutsideInterrupt>

0000000080001028 <pushAllRegistersSysCall>:


pushAllRegistersSysCall:


    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000102c:	00013023          	sd	zero,0(sp)
    80001030:	00113423          	sd	ra,8(sp)
    80001034:	00213823          	sd	sp,16(sp)
    80001038:	00313c23          	sd	gp,24(sp)
    8000103c:	02413023          	sd	tp,32(sp)
    80001040:	02513423          	sd	t0,40(sp)
    80001044:	02613823          	sd	t1,48(sp)
    80001048:	02713c23          	sd	t2,56(sp)
    8000104c:	04813023          	sd	s0,64(sp)
    80001050:	04913423          	sd	s1,72(sp)
    80001054:	04a13823          	sd	a0,80(sp)
    80001058:	04b13c23          	sd	a1,88(sp)
    8000105c:	06c13023          	sd	a2,96(sp)
    80001060:	06d13423          	sd	a3,104(sp)
    80001064:	06e13823          	sd	a4,112(sp)
    80001068:	06f13c23          	sd	a5,120(sp)
    8000106c:	09013023          	sd	a6,128(sp)
    80001070:	09113423          	sd	a7,136(sp)
    80001074:	09213823          	sd	s2,144(sp)
    80001078:	09313c23          	sd	s3,152(sp)
    8000107c:	0b413023          	sd	s4,160(sp)
    80001080:	0b513423          	sd	s5,168(sp)
    80001084:	0b613823          	sd	s6,176(sp)
    80001088:	0b713c23          	sd	s7,184(sp)
    8000108c:	0d813023          	sd	s8,192(sp)
    80001090:	0d913423          	sd	s9,200(sp)
    80001094:	0da13823          	sd	s10,208(sp)
    80001098:	0db13c23          	sd	s11,216(sp)
    8000109c:	0fc13023          	sd	t3,224(sp)
    800010a0:	0fd13423          	sd	t4,232(sp)
    800010a4:	0fe13823          	sd	t5,240(sp)
    800010a8:	0ff13c23          	sd	t6,248(sp)
    call _ZN5Riscv24supervisorsyscallHandlerEv
    800010ac:	304010ef          	jal	ra,800023b0 <_ZN5Riscv24supervisorsyscallHandlerEv>
    sd x10, 80(sp)    #vracanje a0 da se ne pregazi pri popovanju svih registara
    800010b0:	04a13823          	sd	a0,80(sp)
    j popAllRegisters
    800010b4:	11c0006f          	j	800011d0 <popAllRegisters>

00000000800010b8 <pushAllRegistersTimer>:


pushAllRegistersTimer:

    addi sp, sp, -256
    800010b8:	f0010113          	addi	sp,sp,-256
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    800010bc:	00013023          	sd	zero,0(sp)
    800010c0:	00113423          	sd	ra,8(sp)
    800010c4:	00213823          	sd	sp,16(sp)
    800010c8:	00313c23          	sd	gp,24(sp)
    800010cc:	02413023          	sd	tp,32(sp)
    800010d0:	02513423          	sd	t0,40(sp)
    800010d4:	02613823          	sd	t1,48(sp)
    800010d8:	02713c23          	sd	t2,56(sp)
    800010dc:	04813023          	sd	s0,64(sp)
    800010e0:	04913423          	sd	s1,72(sp)
    800010e4:	04a13823          	sd	a0,80(sp)
    800010e8:	04b13c23          	sd	a1,88(sp)
    800010ec:	06c13023          	sd	a2,96(sp)
    800010f0:	06d13423          	sd	a3,104(sp)
    800010f4:	06e13823          	sd	a4,112(sp)
    800010f8:	06f13c23          	sd	a5,120(sp)
    800010fc:	09013023          	sd	a6,128(sp)
    80001100:	09113423          	sd	a7,136(sp)
    80001104:	09213823          	sd	s2,144(sp)
    80001108:	09313c23          	sd	s3,152(sp)
    8000110c:	0b413023          	sd	s4,160(sp)
    80001110:	0b513423          	sd	s5,168(sp)
    80001114:	0b613823          	sd	s6,176(sp)
    80001118:	0b713c23          	sd	s7,184(sp)
    8000111c:	0d813023          	sd	s8,192(sp)
    80001120:	0d913423          	sd	s9,200(sp)
    80001124:	0da13823          	sd	s10,208(sp)
    80001128:	0db13c23          	sd	s11,216(sp)
    8000112c:	0fc13023          	sd	t3,224(sp)
    80001130:	0fd13423          	sd	t4,232(sp)
    80001134:	0fe13823          	sd	t5,240(sp)
    80001138:	0ff13c23          	sd	t6,248(sp)
    call _ZN5Riscv22supervisorTimerHandlerEv
    8000113c:	65c010ef          	jal	ra,80002798 <_ZN5Riscv22supervisorTimerHandlerEv>
    j popAllRegisters
    80001140:	0900006f          	j	800011d0 <popAllRegisters>

0000000080001144 <pushAllRegistersOutsideInterrupt>:

pushAllRegistersOutsideInterrupt:
    addi sp, sp, -256
    80001144:	f0010113          	addi	sp,sp,-256
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001148:	00013023          	sd	zero,0(sp)
    8000114c:	00113423          	sd	ra,8(sp)
    80001150:	00213823          	sd	sp,16(sp)
    80001154:	00313c23          	sd	gp,24(sp)
    80001158:	02413023          	sd	tp,32(sp)
    8000115c:	02513423          	sd	t0,40(sp)
    80001160:	02613823          	sd	t1,48(sp)
    80001164:	02713c23          	sd	t2,56(sp)
    80001168:	04813023          	sd	s0,64(sp)
    8000116c:	04913423          	sd	s1,72(sp)
    80001170:	04a13823          	sd	a0,80(sp)
    80001174:	04b13c23          	sd	a1,88(sp)
    80001178:	06c13023          	sd	a2,96(sp)
    8000117c:	06d13423          	sd	a3,104(sp)
    80001180:	06e13823          	sd	a4,112(sp)
    80001184:	06f13c23          	sd	a5,120(sp)
    80001188:	09013023          	sd	a6,128(sp)
    8000118c:	09113423          	sd	a7,136(sp)
    80001190:	09213823          	sd	s2,144(sp)
    80001194:	09313c23          	sd	s3,152(sp)
    80001198:	0b413023          	sd	s4,160(sp)
    8000119c:	0b513423          	sd	s5,168(sp)
    800011a0:	0b613823          	sd	s6,176(sp)
    800011a4:	0b713c23          	sd	s7,184(sp)
    800011a8:	0d813023          	sd	s8,192(sp)
    800011ac:	0d913423          	sd	s9,200(sp)
    800011b0:	0da13823          	sd	s10,208(sp)
    800011b4:	0db13c23          	sd	s11,216(sp)
    800011b8:	0fc13023          	sd	t3,224(sp)
    800011bc:	0fd13423          	sd	t4,232(sp)
    800011c0:	0fe13823          	sd	t5,240(sp)
    800011c4:	0ff13c23          	sd	t6,248(sp)
    call _ZN5Riscv33supervisorOutsideInterruptHandlerEv
    800011c8:	678010ef          	jal	ra,80002840 <_ZN5Riscv33supervisorOutsideInterruptHandlerEv>
    j popAllRegisters
    800011cc:	0040006f          	j	800011d0 <popAllRegisters>

00000000800011d0 <popAllRegisters>:

popAllRegisters:
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011d0:	00013003          	ld	zero,0(sp)
    800011d4:	00813083          	ld	ra,8(sp)
    800011d8:	01013103          	ld	sp,16(sp)
    800011dc:	01813183          	ld	gp,24(sp)
    800011e0:	02013203          	ld	tp,32(sp)
    800011e4:	02813283          	ld	t0,40(sp)
    800011e8:	03013303          	ld	t1,48(sp)
    800011ec:	03813383          	ld	t2,56(sp)
    800011f0:	04013403          	ld	s0,64(sp)
    800011f4:	04813483          	ld	s1,72(sp)
    800011f8:	05013503          	ld	a0,80(sp)
    800011fc:	05813583          	ld	a1,88(sp)
    80001200:	06013603          	ld	a2,96(sp)
    80001204:	06813683          	ld	a3,104(sp)
    80001208:	07013703          	ld	a4,112(sp)
    8000120c:	07813783          	ld	a5,120(sp)
    80001210:	08013803          	ld	a6,128(sp)
    80001214:	08813883          	ld	a7,136(sp)
    80001218:	09013903          	ld	s2,144(sp)
    8000121c:	09813983          	ld	s3,152(sp)
    80001220:	0a013a03          	ld	s4,160(sp)
    80001224:	0a813a83          	ld	s5,168(sp)
    80001228:	0b013b03          	ld	s6,176(sp)
    8000122c:	0b813b83          	ld	s7,184(sp)
    80001230:	0c013c03          	ld	s8,192(sp)
    80001234:	0c813c83          	ld	s9,200(sp)
    80001238:	0d013d03          	ld	s10,208(sp)
    8000123c:	0d813d83          	ld	s11,216(sp)
    80001240:	0e013e03          	ld	t3,224(sp)
    80001244:	0e813e83          	ld	t4,232(sp)
    80001248:	0f013f03          	ld	t5,240(sp)
    8000124c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001250:	10010113          	addi	sp,sp,256
    80001254:	10200073          	sret

0000000080001258 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001258:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000125c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001260:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001264:	0085b103          	ld	sp,8(a1)

    80001268:	00008067          	ret

000000008000126c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000126c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001270:	00b29a63          	bne	t0,a1,80001284 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001274:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001278:	fe029ae3          	bnez	t0,8000126c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000127c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001280:	00008067          	ret

0000000080001284 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001284:	00100513          	li	a0,1
    80001288:	00008067          	ret

000000008000128c <_Z9mem_allocm>:
    __asm__ volatile("ecall");
}


void* mem_alloc (size_t size)
{
    8000128c:	ff010113          	addi	sp,sp,-16
    80001290:	00813423          	sd	s0,8(sp)
    80001294:	01010413          	addi	s0,sp,16
    size_t num_of_blocks = size;
    if (size % MEM_BLOCK_SIZE == 0)
    80001298:	03f57793          	andi	a5,a0,63
    8000129c:	02079463          	bnez	a5,800012c4 <_Z9mem_allocm+0x38>
    {
        num_of_blocks = size / MEM_BLOCK_SIZE;
    800012a0:	00655513          	srli	a0,a0,0x6
    else
    {
        num_of_blocks = size / MEM_BLOCK_SIZE;
        num_of_blocks++;
    }
    __asm__ volatile ("mv a1,%0" : :"r" (num_of_blocks));
    800012a4:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    800012a8:	00100793          	li	a5,1
    800012ac:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800012b0:	00000073          	ecall

    sys_call_preparation(MEM_ALLOC);

    uint64  return_adress;

    __asm__ volatile ("mv %0,a0" :"=r"(return_adress));
    800012b4:	00050513          	mv	a0,a0

    return (void*)return_adress;
}
    800012b8:	00813403          	ld	s0,8(sp)
    800012bc:	01010113          	addi	sp,sp,16
    800012c0:	00008067          	ret
        num_of_blocks = size / MEM_BLOCK_SIZE;
    800012c4:	00655513          	srli	a0,a0,0x6
        num_of_blocks++;
    800012c8:	00150513          	addi	a0,a0,1
    800012cc:	fd9ff06f          	j	800012a4 <_Z9mem_allocm+0x18>

00000000800012d0 <_Z8mem_freePv>:

int mem_free (void* arg)
{
    800012d0:	ff010113          	addi	sp,sp,-16
    800012d4:	00813423          	sd	s0,8(sp)
    800012d8:	01010413          	addi	s0,sp,16

    __asm__ volatile ("mv a1,%0" : :"r" (arg));
    800012dc:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    800012e0:	00200793          	li	a5,2
    800012e4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800012e8:	00000073          	ecall

    sys_call_preparation(MEM_FREE);

    int result;

    __asm__ volatile ("mv %0,a0" :"=r"(result));
    800012ec:	00050513          	mv	a0,a0

    return result;


}
    800012f0:	0005051b          	sext.w	a0,a0
    800012f4:	00813403          	ld	s0,8(sp)
    800012f8:	01010113          	addi	sp,sp,16
    800012fc:	00008067          	ret

0000000080001300 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create (thread_t* handle,void(*start_routine)(void*),void* arg)
{
    void* stack_space = nullptr;
    if (handle== nullptr) return -1;
    80001300:	08050663          	beqz	a0,8000138c <_Z13thread_createPP3TCBPFvPvES2_+0x8c>
{
    80001304:	fd010113          	addi	sp,sp,-48
    80001308:	02113423          	sd	ra,40(sp)
    8000130c:	02813023          	sd	s0,32(sp)
    80001310:	00913c23          	sd	s1,24(sp)
    80001314:	01213823          	sd	s2,16(sp)
    80001318:	01313423          	sd	s3,8(sp)
    8000131c:	03010413          	addi	s0,sp,48
    80001320:	00050493          	mv	s1,a0
    80001324:	00058913          	mv	s2,a1
    80001328:	00060993          	mv	s3,a2


    if (start_routine != nullptr){
    8000132c:	04058c63          	beqz	a1,80001384 <_Z13thread_createPP3TCBPFvPvES2_+0x84>
        size_t velicina = sizeof(uint64) * DEFAULT_STACK_SIZE;
        stack_space= mem_alloc(velicina);
    80001330:	00008537          	lui	a0,0x8
    80001334:	00000097          	auipc	ra,0x0
    80001338:	f58080e7          	jalr	-168(ra) # 8000128c <_Z9mem_allocm>

    if (stack_space== nullptr)return -3;}
    8000133c:	04050c63          	beqz	a0,80001394 <_Z13thread_createPP3TCBPFvPvES2_+0x94>


    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    80001340:	00048593          	mv	a1,s1
    __asm__ volatile ("mv a2,%0" : :"r" (start_routine));
    80001344:	00090613          	mv	a2,s2
    __asm__ volatile ("mv a3,%0" : :"r" (arg));
    80001348:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a4,%0" : :"r" (stack_space));
    8000134c:	00050713          	mv	a4,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001350:	01100793          	li	a5,17
    80001354:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001358:	00000073          	ecall


    sys_call_preparation(THREAD_CREATE);

    if (*handle!= nullptr) return 0;
    8000135c:	0004b783          	ld	a5,0(s1)
    80001360:	02078e63          	beqz	a5,8000139c <_Z13thread_createPP3TCBPFvPvES2_+0x9c>
    80001364:	00000513          	li	a0,0
    else return -4;
}
    80001368:	02813083          	ld	ra,40(sp)
    8000136c:	02013403          	ld	s0,32(sp)
    80001370:	01813483          	ld	s1,24(sp)
    80001374:	01013903          	ld	s2,16(sp)
    80001378:	00813983          	ld	s3,8(sp)
    8000137c:	03010113          	addi	sp,sp,48
    80001380:	00008067          	ret
    void* stack_space = nullptr;
    80001384:	00000513          	li	a0,0
    80001388:	fb9ff06f          	j	80001340 <_Z13thread_createPP3TCBPFvPvES2_+0x40>
    if (handle== nullptr) return -1;
    8000138c:	fff00513          	li	a0,-1
}
    80001390:	00008067          	ret
    if (stack_space== nullptr)return -3;}
    80001394:	ffd00513          	li	a0,-3
    80001398:	fd1ff06f          	j	80001368 <_Z13thread_createPP3TCBPFvPvES2_+0x68>
    else return -4;
    8000139c:	ffc00513          	li	a0,-4
    800013a0:	fc9ff06f          	j	80001368 <_Z13thread_createPP3TCBPFvPvES2_+0x68>

00000000800013a4 <_Z11thread_exitv>:

int thread_exit ()
{
    800013a4:	ff010113          	addi	sp,sp,-16
    800013a8:	00813423          	sd	s0,8(sp)
    800013ac:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    800013b0:	01200793          	li	a5,18
    800013b4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013b8:	00000073          	ecall

    sys_call_preparation(THREAD_EXIT);

    int result;

    __asm__ volatile ("mv %0,a0" :"=r"(result));
    800013bc:	00050513          	mv	a0,a0
    return result;
}
    800013c0:	0005051b          	sext.w	a0,a0
    800013c4:	00813403          	ld	s0,8(sp)
    800013c8:	01010113          	addi	sp,sp,16
    800013cc:	00008067          	ret

00000000800013d0 <_Z15thread_dispatchv>:

void thread_dispatch ()
{
    800013d0:	ff010113          	addi	sp,sp,-16
    800013d4:	00813423          	sd	s0,8(sp)
    800013d8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    800013dc:	01300793          	li	a5,19
    800013e0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013e4:	00000073          	ecall
    sys_call_preparation(THREAD_DISPATCH);
}
    800013e8:	00813403          	ld	s0,8(sp)
    800013ec:	01010113          	addi	sp,sp,16
    800013f0:	00008067          	ret

00000000800013f4 <_Z11thread_joinP3TCB>:

void thread_join (thread_t handle)
{
    800013f4:	ff010113          	addi	sp,sp,-16
    800013f8:	00813423          	sd	s0,8(sp)
    800013fc:	01010413          	addi	s0,sp,16
    if (handle == nullptr)return;
    80001400:	00050a63          	beqz	a0,80001414 <_Z11thread_joinP3TCB+0x20>

    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    80001404:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001408:	01400793          	li	a5,20
    8000140c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001410:	00000073          	ecall

    sys_call_preparation(THREAD_JOIN);

}
    80001414:	00813403          	ld	s0,8(sp)
    80001418:	01010113          	addi	sp,sp,16
    8000141c:	00008067          	ret

0000000080001420 <_Z12thread_startP3TCB>:

int thread_start (thread_t handle)
{
    80001420:	ff010113          	addi	sp,sp,-16
    80001424:	00813423          	sd	s0,8(sp)
    80001428:	01010413          	addi	s0,sp,16
    if (handle== nullptr) return -1;
    8000142c:	02050463          	beqz	a0,80001454 <_Z12thread_startP3TCB+0x34>

    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    80001430:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001434:	01500793          	li	a5,21
    80001438:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000143c:	00000073          	ecall

    sys_call_preparation(THREAD_START);

    int result;

    __asm__ volatile ("mv %0,a0" :"=r"(result));
    80001440:	00050513          	mv	a0,a0
    80001444:	0005051b          	sext.w	a0,a0
    return result;
}
    80001448:	00813403          	ld	s0,8(sp)
    8000144c:	01010113          	addi	sp,sp,16
    80001450:	00008067          	ret
    if (handle== nullptr) return -1;
    80001454:	fff00513          	li	a0,-1
    80001458:	ff1ff06f          	j	80001448 <_Z12thread_startP3TCB+0x28>

000000008000145c <_Z11thread_makePP3TCBPFvPvES2_>:

int thread_make (thread_t* handle,void(*start_routine)(void*),void* arg)
{
    void* stack_space = nullptr;
    if (handle== nullptr) return -1;
    8000145c:	08050663          	beqz	a0,800014e8 <_Z11thread_makePP3TCBPFvPvES2_+0x8c>
{
    80001460:	fd010113          	addi	sp,sp,-48
    80001464:	02113423          	sd	ra,40(sp)
    80001468:	02813023          	sd	s0,32(sp)
    8000146c:	00913c23          	sd	s1,24(sp)
    80001470:	01213823          	sd	s2,16(sp)
    80001474:	01313423          	sd	s3,8(sp)
    80001478:	03010413          	addi	s0,sp,48
    8000147c:	00050493          	mv	s1,a0
    80001480:	00058913          	mv	s2,a1
    80001484:	00060993          	mv	s3,a2


    if (start_routine != nullptr){
    80001488:	04058c63          	beqz	a1,800014e0 <_Z11thread_makePP3TCBPFvPvES2_+0x84>
        stack_space = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    8000148c:	00008537          	lui	a0,0x8
    80001490:	00000097          	auipc	ra,0x0
    80001494:	dfc080e7          	jalr	-516(ra) # 8000128c <_Z9mem_allocm>

        if (stack_space== nullptr)return -3;}
    80001498:	04050c63          	beqz	a0,800014f0 <_Z11thread_makePP3TCBPFvPvES2_+0x94>


    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    8000149c:	00048593          	mv	a1,s1
    __asm__ volatile ("mv a2,%0" : :"r" (start_routine));
    800014a0:	00090613          	mv	a2,s2
    __asm__ volatile ("mv a3,%0" : :"r" (arg));
    800014a4:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a4,%0" : :"r" (stack_space));
    800014a8:	00050713          	mv	a4,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    800014ac:	01600793          	li	a5,22
    800014b0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800014b4:	00000073          	ecall

    sys_call_preparation(THREAD_MAKE);

    if (*handle!= nullptr) return 0;
    800014b8:	0004b783          	ld	a5,0(s1)
    800014bc:	02078e63          	beqz	a5,800014f8 <_Z11thread_makePP3TCBPFvPvES2_+0x9c>
    800014c0:	00000513          	li	a0,0
    else return -4;
}
    800014c4:	02813083          	ld	ra,40(sp)
    800014c8:	02013403          	ld	s0,32(sp)
    800014cc:	01813483          	ld	s1,24(sp)
    800014d0:	01013903          	ld	s2,16(sp)
    800014d4:	00813983          	ld	s3,8(sp)
    800014d8:	03010113          	addi	sp,sp,48
    800014dc:	00008067          	ret
    void* stack_space = nullptr;
    800014e0:	00000513          	li	a0,0
    800014e4:	fb9ff06f          	j	8000149c <_Z11thread_makePP3TCBPFvPvES2_+0x40>
    if (handle== nullptr) return -1;
    800014e8:	fff00513          	li	a0,-1
}
    800014ec:	00008067          	ret
        if (stack_space== nullptr)return -3;}
    800014f0:	ffd00513          	li	a0,-3
    800014f4:	fd1ff06f          	j	800014c4 <_Z11thread_makePP3TCBPFvPvES2_+0x68>
    else return -4;
    800014f8:	ffc00513          	li	a0,-4
    800014fc:	fc9ff06f          	j	800014c4 <_Z11thread_makePP3TCBPFvPvES2_+0x68>

0000000080001500 <_Z13thread_deleteP3TCB>:

void thread_delete(thread_t handle)
{
    80001500:	ff010113          	addi	sp,sp,-16
    80001504:	00813423          	sd	s0,8(sp)
    80001508:	01010413          	addi	s0,sp,16
   if (handle== nullptr)return;
    8000150c:	00050a63          	beqz	a0,80001520 <_Z13thread_deleteP3TCB+0x20>

    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    80001510:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001514:	01700793          	li	a5,23
    80001518:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000151c:	00000073          	ecall

    sys_call_preparation(THREAD_DELETE);

}
    80001520:	00813403          	ld	s0,8(sp)
    80001524:	01010113          	addi	sp,sp,16
    80001528:	00008067          	ret

000000008000152c <_Z8sem_openPP4_semj>:


int sem_open (sem_t* handle,unsigned init)
{
    8000152c:	ff010113          	addi	sp,sp,-16
    80001530:	00813423          	sd	s0,8(sp)
    80001534:	01010413          	addi	s0,sp,16
    if (handle== nullptr) return -2;
    80001538:	02050863          	beqz	a0,80001568 <_Z8sem_openPP4_semj+0x3c>

    __asm__ volatile ("mv a2, a1");
    8000153c:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, a0");
    80001540:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001544:	02100793          	li	a5,33
    80001548:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000154c:	00000073          	ecall

    sys_call_preparation(SEM_OPEN);

    if (*handle!= nullptr) return 0;
    80001550:	00053783          	ld	a5,0(a0) # 8000 <_entry-0x7fff8000>
    80001554:	00078e63          	beqz	a5,80001570 <_Z8sem_openPP4_semj+0x44>
    80001558:	00000513          	li	a0,0
    else return -1;
}
    8000155c:	00813403          	ld	s0,8(sp)
    80001560:	01010113          	addi	sp,sp,16
    80001564:	00008067          	ret
    if (handle== nullptr) return -2;
    80001568:	ffe00513          	li	a0,-2
    8000156c:	ff1ff06f          	j	8000155c <_Z8sem_openPP4_semj+0x30>
    else return -1;
    80001570:	fff00513          	li	a0,-1
    80001574:	fe9ff06f          	j	8000155c <_Z8sem_openPP4_semj+0x30>

0000000080001578 <_Z9sem_closeP4_sem>:

int sem_close (sem_t handle)
{
    80001578:	ff010113          	addi	sp,sp,-16
    8000157c:	00813423          	sd	s0,8(sp)
    80001580:	01010413          	addi	s0,sp,16
    if (handle == nullptr) return -2;
    80001584:	02050463          	beqz	a0,800015ac <_Z9sem_closeP4_sem+0x34>

    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    80001588:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    8000158c:	02200793          	li	a5,34
    80001590:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001594:	00000073          	ecall

    sys_call_preparation(SEM_CLOSE);

    int result;
    __asm__ volatile ("mv %0,a0" :"=r"(result));
    80001598:	00050513          	mv	a0,a0
    8000159c:	0005051b          	sext.w	a0,a0
    return result;
}
    800015a0:	00813403          	ld	s0,8(sp)
    800015a4:	01010113          	addi	sp,sp,16
    800015a8:	00008067          	ret
    if (handle == nullptr) return -2;
    800015ac:	ffe00513          	li	a0,-2
    800015b0:	ff1ff06f          	j	800015a0 <_Z9sem_closeP4_sem+0x28>

00000000800015b4 <_Z8sem_waitP4_sem>:

int sem_wait (sem_t id)
{
    800015b4:	ff010113          	addi	sp,sp,-16
    800015b8:	00813423          	sd	s0,8(sp)
    800015bc:	01010413          	addi	s0,sp,16
    if (id== nullptr)return -2;
    800015c0:	02050463          	beqz	a0,800015e8 <_Z8sem_waitP4_sem+0x34>

    __asm__ volatile ("mv a1,%0" : :"r" (id));
    800015c4:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    800015c8:	02300793          	li	a5,35
    800015cc:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800015d0:	00000073          	ecall

    sys_call_preparation(SEM_WAIT);

    int result;
    __asm__ volatile ("mv %0,a0" :"=r"(result));
    800015d4:	00050513          	mv	a0,a0
    800015d8:	0005051b          	sext.w	a0,a0
    return result;

}
    800015dc:	00813403          	ld	s0,8(sp)
    800015e0:	01010113          	addi	sp,sp,16
    800015e4:	00008067          	ret
    if (id== nullptr)return -2;
    800015e8:	ffe00513          	li	a0,-2
    800015ec:	ff1ff06f          	j	800015dc <_Z8sem_waitP4_sem+0x28>

00000000800015f0 <_Z10sem_signalP4_sem>:

int sem_signal (sem_t id)
{
    800015f0:	ff010113          	addi	sp,sp,-16
    800015f4:	00813423          	sd	s0,8(sp)
    800015f8:	01010413          	addi	s0,sp,16
    if (id== nullptr)return -2;
    800015fc:	02050463          	beqz	a0,80001624 <_Z10sem_signalP4_sem+0x34>

    __asm__ volatile ("mv a1,%0" : :"r" (id));
    80001600:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001604:	02400793          	li	a5,36
    80001608:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000160c:	00000073          	ecall

    sys_call_preparation(SEM_SIGNAL);

    int result;
    __asm__ volatile ("mv %0,a0" :"=r"(result));
    80001610:	00050513          	mv	a0,a0
    80001614:	0005051b          	sext.w	a0,a0
    return result;

}
    80001618:	00813403          	ld	s0,8(sp)
    8000161c:	01010113          	addi	sp,sp,16
    80001620:	00008067          	ret
    if (id== nullptr)return -2;
    80001624:	ffe00513          	li	a0,-2
    80001628:	ff1ff06f          	j	80001618 <_Z10sem_signalP4_sem+0x28>

000000008000162c <_Z10time_sleepm>:

int time_sleep (time_t vreme)
{
    8000162c:	ff010113          	addi	sp,sp,-16
    80001630:	00813423          	sd	s0,8(sp)
    80001634:	01010413          	addi	s0,sp,16
    if (vreme==0)return -1; //Ovo je jedini moguci izvor greske,tako da ako on prodje onda sigurno vracamo 0!
    80001638:	02050263          	beqz	a0,8000165c <_Z10time_sleepm+0x30>

    __asm__ volatile ("mv a1,%0" : :"r" (vreme));
    8000163c:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001640:	03100793          	li	a5,49
    80001644:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001648:	00000073          	ecall

    sys_call_preparation(TIME_SLEEP);

   return 0;
    8000164c:	00000513          	li	a0,0


}
    80001650:	00813403          	ld	s0,8(sp)
    80001654:	01010113          	addi	sp,sp,16
    80001658:	00008067          	ret
    if (vreme==0)return -1; //Ovo je jedini moguci izvor greske,tako da ako on prodje onda sigurno vracamo 0!
    8000165c:	fff00513          	li	a0,-1
    80001660:	ff1ff06f          	j	80001650 <_Z10time_sleepm+0x24>

0000000080001664 <_Z4getcv>:


char getc ()
{
    80001664:	ff010113          	addi	sp,sp,-16
    80001668:	00813423          	sd	s0,8(sp)
    8000166c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    80001670:	04100793          	li	a5,65
    80001674:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001678:	00000073          	ecall

    sys_call_preparation(GETC);

    char karakter;
    __asm__ volatile ("mv %0,a0" :"=r"(karakter));
    8000167c:	00050513          	mv	a0,a0
    return karakter;
}
    80001680:	0ff57513          	andi	a0,a0,255
    80001684:	00813403          	ld	s0,8(sp)
    80001688:	01010113          	addi	sp,sp,16
    8000168c:	00008067          	ret

0000000080001690 <_Z4putcc>:


void putc (char c)
{
    80001690:	ff010113          	addi	sp,sp,-16
    80001694:	00813423          	sd	s0,8(sp)
    80001698:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1,%0" : :"r" (c));
    8000169c:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    800016a0:	04200793          	li	a5,66
    800016a4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800016a8:	00000073          	ecall

    sys_call_preparation(PUTC);

    800016ac:	00813403          	ld	s0,8(sp)
    800016b0:	01010113          	addi	sp,sp,16
    800016b4:	00008067          	ret

00000000800016b8 <_Z6sleepAPv>:

#include "../h/syscall_c.h"


void sleepA(void* arg)
{
    800016b8:	ff010113          	addi	sp,sp,-16
    800016bc:	00113423          	sd	ra,8(sp)
    800016c0:	00813023          	sd	s0,0(sp)
    800016c4:	01010413          	addi	s0,sp,16
    time_sleep(100);
    800016c8:	06400513          	li	a0,100
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	f60080e7          	jalr	-160(ra) # 8000162c <_Z10time_sleepm>
    putc('G');
    800016d4:	04700513          	li	a0,71
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	fb8080e7          	jalr	-72(ra) # 80001690 <_Z4putcc>
    putc('\n');
    800016e0:	00a00513          	li	a0,10
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	fac080e7          	jalr	-84(ra) # 80001690 <_Z4putcc>
}
    800016ec:	00813083          	ld	ra,8(sp)
    800016f0:	00013403          	ld	s0,0(sp)
    800016f4:	01010113          	addi	sp,sp,16
    800016f8:	00008067          	ret

00000000800016fc <_Z6sleepBPv>:


void sleepB(void* arg)
{
    800016fc:	ff010113          	addi	sp,sp,-16
    80001700:	00113423          	sd	ra,8(sp)
    80001704:	00813023          	sd	s0,0(sp)
    80001708:	01010413          	addi	s0,sp,16
    time_sleep(200);
    8000170c:	0c800513          	li	a0,200
    80001710:	00000097          	auipc	ra,0x0
    80001714:	f1c080e7          	jalr	-228(ra) # 8000162c <_Z10time_sleepm>
    putc('N');
    80001718:	04e00513          	li	a0,78
    8000171c:	00000097          	auipc	ra,0x0
    80001720:	f74080e7          	jalr	-140(ra) # 80001690 <_Z4putcc>
    putc('\n');
    80001724:	00a00513          	li	a0,10
    80001728:	00000097          	auipc	ra,0x0
    8000172c:	f68080e7          	jalr	-152(ra) # 80001690 <_Z4putcc>
}
    80001730:	00813083          	ld	ra,8(sp)
    80001734:	00013403          	ld	s0,0(sp)
    80001738:	01010113          	addi	sp,sp,16
    8000173c:	00008067          	ret

0000000080001740 <_Z10probasleepv>:

void probasleep()
{
    80001740:	fe010113          	addi	sp,sp,-32
    80001744:	00113c23          	sd	ra,24(sp)
    80001748:	00813823          	sd	s0,16(sp)
    8000174c:	02010413          	addi	s0,sp,32

    thread_t a;
    thread_t b;
    thread_create(&a,&sleepA, nullptr);
    80001750:	00000613          	li	a2,0
    80001754:	00000597          	auipc	a1,0x0
    80001758:	f6458593          	addi	a1,a1,-156 # 800016b8 <_Z6sleepAPv>
    8000175c:	fe840513          	addi	a0,s0,-24
    80001760:	00000097          	auipc	ra,0x0
    80001764:	ba0080e7          	jalr	-1120(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&b,&sleepB, nullptr);
    80001768:	00000613          	li	a2,0
    8000176c:	00000597          	auipc	a1,0x0
    80001770:	f9058593          	addi	a1,a1,-112 # 800016fc <_Z6sleepBPv>
    80001774:	fe040513          	addi	a0,s0,-32
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	b88080e7          	jalr	-1144(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true){thread_dispatch();}
    80001780:	00000097          	auipc	ra,0x0
    80001784:	c50080e7          	jalr	-944(ra) # 800013d0 <_Z15thread_dispatchv>
    80001788:	ff9ff06f          	j	80001780 <_Z10probasleepv+0x40>

000000008000178c <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned int init) {
    myHandle = nullptr;
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    8000178c:	ff010113          	addi	sp,sp,-16
    80001790:	00113423          	sd	ra,8(sp)
    80001794:	00813023          	sd	s0,0(sp)
    80001798:	01010413          	addi	s0,sp,16
    8000179c:	0000b797          	auipc	a5,0xb
    800017a0:	15478793          	addi	a5,a5,340 # 8000c8f0 <_ZTV9Semaphore+0x10>
    800017a4:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800017a8:	00853503          	ld	a0,8(a0)
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	dcc080e7          	jalr	-564(ra) # 80001578 <_Z9sem_closeP4_sem>
}
    800017b4:	00813083          	ld	ra,8(sp)
    800017b8:	00013403          	ld	s0,0(sp)
    800017bc:	01010113          	addi	sp,sp,16
    800017c0:	00008067          	ret

00000000800017c4 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800017c4:	fe010113          	addi	sp,sp,-32
    800017c8:	00113c23          	sd	ra,24(sp)
    800017cc:	00813823          	sd	s0,16(sp)
    800017d0:	00913423          	sd	s1,8(sp)
    800017d4:	02010413          	addi	s0,sp,32
    800017d8:	00050493          	mv	s1,a0
}
    800017dc:	00000097          	auipc	ra,0x0
    800017e0:	fb0080e7          	jalr	-80(ra) # 8000178c <_ZN9SemaphoreD1Ev>
    800017e4:	00048513          	mv	a0,s1
    800017e8:	00001097          	auipc	ra,0x1
    800017ec:	9b8080e7          	jalr	-1608(ra) # 800021a0 <_ZdlPv>
    800017f0:	01813083          	ld	ra,24(sp)
    800017f4:	01013403          	ld	s0,16(sp)
    800017f8:	00813483          	ld	s1,8(sp)
    800017fc:	02010113          	addi	sp,sp,32
    80001800:	00008067          	ret

0000000080001804 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80001804:	ff010113          	addi	sp,sp,-16
    80001808:	00113423          	sd	ra,8(sp)
    8000180c:	00813023          	sd	s0,0(sp)
    80001810:	01010413          	addi	s0,sp,16
    80001814:	0000b797          	auipc	a5,0xb
    80001818:	0dc78793          	addi	a5,a5,220 # 8000c8f0 <_ZTV9Semaphore+0x10>
    8000181c:	00f53023          	sd	a5,0(a0)
    myHandle = nullptr;
    80001820:	00053423          	sd	zero,8(a0)
    sem_open(&myHandle,init);
    80001824:	00850513          	addi	a0,a0,8
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	d04080e7          	jalr	-764(ra) # 8000152c <_Z8sem_openPP4_semj>
}
    80001830:	00813083          	ld	ra,8(sp)
    80001834:	00013403          	ld	s0,0(sp)
    80001838:	01010113          	addi	sp,sp,16
    8000183c:	00008067          	ret

0000000080001840 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80001840:	ff010113          	addi	sp,sp,-16
    80001844:	00113423          	sd	ra,8(sp)
    80001848:	00813023          	sd	s0,0(sp)
    8000184c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001850:	00853503          	ld	a0,8(a0)
    80001854:	00000097          	auipc	ra,0x0
    80001858:	d60080e7          	jalr	-672(ra) # 800015b4 <_Z8sem_waitP4_sem>
}
    8000185c:	00813083          	ld	ra,8(sp)
    80001860:	00013403          	ld	s0,0(sp)
    80001864:	01010113          	addi	sp,sp,16
    80001868:	00008067          	ret

000000008000186c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    8000186c:	ff010113          	addi	sp,sp,-16
    80001870:	00113423          	sd	ra,8(sp)
    80001874:	00813023          	sd	s0,0(sp)
    80001878:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000187c:	00853503          	ld	a0,8(a0)
    80001880:	00000097          	auipc	ra,0x0
    80001884:	d70080e7          	jalr	-656(ra) # 800015f0 <_Z10sem_signalP4_sem>
}
    80001888:	00813083          	ld	ra,8(sp)
    8000188c:	00013403          	ld	s0,0(sp)
    80001890:	01010113          	addi	sp,sp,16
    80001894:	00008067          	ret

0000000080001898 <_Z3fjaPv>:




void fja(void* a)
{
    80001898:	fe010113          	addi	sp,sp,-32
    8000189c:	00113c23          	sd	ra,24(sp)
    800018a0:	00813823          	sd	s0,16(sp)
    800018a4:	00913423          	sd	s1,8(sp)
    800018a8:	01213023          	sd	s2,0(sp)
    800018ac:	02010413          	addi	s0,sp,32
    800018b0:	00050493          	mv	s1,a0
   Data* data = (Data*) a;
   int sum=0;
    for (int i = 0; i < data->kolone; ++i) {
    800018b4:	00000793          	li	a5,0
   int sum=0;
    800018b8:	00000913          	li	s2,0
    for (int i = 0; i < data->kolone; ++i) {
    800018bc:	00c4a703          	lw	a4,12(s1)
    800018c0:	02e7d063          	bge	a5,a4,800018e0 <_Z3fjaPv+0x48>
        sum+= data->matrica[i];
    800018c4:	0104b703          	ld	a4,16(s1)
    800018c8:	00279693          	slli	a3,a5,0x2
    800018cc:	00d70733          	add	a4,a4,a3
    800018d0:	00072703          	lw	a4,0(a4)
    800018d4:	0127093b          	addw	s2,a4,s2
    for (int i = 0; i < data->kolone; ++i) {
    800018d8:	0017879b          	addiw	a5,a5,1
    800018dc:	fe1ff06f          	j	800018bc <_Z3fjaPv+0x24>
    }
    sem_wait(data->semafor);
    800018e0:	0184b503          	ld	a0,24(s1)
    800018e4:	00000097          	auipc	ra,0x0
    800018e8:	cd0080e7          	jalr	-816(ra) # 800015b4 <_Z8sem_waitP4_sem>
    *(data->res) = *(data->res)+ sum;
    800018ec:	0004b703          	ld	a4,0(s1)
    800018f0:	00072783          	lw	a5,0(a4)
    800018f4:	0127893b          	addw	s2,a5,s2
    800018f8:	01272023          	sw	s2,0(a4)
    sem_signal(data->semafor);
    800018fc:	0184b503          	ld	a0,24(s1)
    80001900:	00000097          	auipc	ra,0x0
    80001904:	cf0080e7          	jalr	-784(ra) # 800015f0 <_Z10sem_signalP4_sem>
    delete data;
    80001908:	00048863          	beqz	s1,80001918 <_Z3fjaPv+0x80>
    8000190c:	00048513          	mv	a0,s1
    80001910:	00001097          	auipc	ra,0x1
    80001914:	890080e7          	jalr	-1904(ra) # 800021a0 <_ZdlPv>
}
    80001918:	01813083          	ld	ra,24(sp)
    8000191c:	01013403          	ld	s0,16(sp)
    80001920:	00813483          	ld	s1,8(sp)
    80001924:	00013903          	ld	s2,0(sp)
    80001928:	02010113          	addi	sp,sp,32
    8000192c:	00008067          	ret

0000000080001930 <_Z5probav>:

void proba()
{
    80001930:	f8010113          	addi	sp,sp,-128
    80001934:	06113c23          	sd	ra,120(sp)
    80001938:	06813823          	sd	s0,112(sp)
    8000193c:	06913423          	sd	s1,104(sp)
    80001940:	07213023          	sd	s2,96(sp)
    80001944:	05313c23          	sd	s3,88(sp)
    80001948:	05413823          	sd	s4,80(sp)
    8000194c:	05513423          	sd	s5,72(sp)
    80001950:	05613023          	sd	s6,64(sp)
    80001954:	03713c23          	sd	s7,56(sp)
    80001958:	08010413          	addi	s0,sp,128
   int n;
   int m;
   char string[30];

    printString("Unesite broj vrsta matrice:");
    8000195c:	00008517          	auipc	a0,0x8
    80001960:	6c450513          	addi	a0,a0,1732 # 8000a020 <CONSOLE_STATUS+0x10>
    80001964:	00004097          	auipc	ra,0x4
    80001968:	440080e7          	jalr	1088(ra) # 80005da4 <_Z11printStringPKc>
    getString(string,30);
    8000196c:	01e00593          	li	a1,30
    80001970:	f9040493          	addi	s1,s0,-112
    80001974:	00048513          	mv	a0,s1
    80001978:	00004097          	auipc	ra,0x4
    8000197c:	4b4080e7          	jalr	1204(ra) # 80005e2c <_Z9getStringPci>
    n = stringToInt(string);
    80001980:	00048513          	mv	a0,s1
    80001984:	00004097          	auipc	ra,0x4
    80001988:	58c080e7          	jalr	1420(ra) # 80005f10 <_Z11stringToIntPKc>
    8000198c:	00050a13          	mv	s4,a0

    printString("Unesite broj kolona matrice:");
    80001990:	00008517          	auipc	a0,0x8
    80001994:	6b050513          	addi	a0,a0,1712 # 8000a040 <CONSOLE_STATUS+0x30>
    80001998:	00004097          	auipc	ra,0x4
    8000199c:	40c080e7          	jalr	1036(ra) # 80005da4 <_Z11printStringPKc>
    getString(string,30);
    800019a0:	01e00593          	li	a1,30
    800019a4:	00048513          	mv	a0,s1
    800019a8:	00004097          	auipc	ra,0x4
    800019ac:	484080e7          	jalr	1156(ra) # 80005e2c <_Z9getStringPci>
    m = stringToInt(string);
    800019b0:	00048513          	mv	a0,s1
    800019b4:	00004097          	auipc	ra,0x4
    800019b8:	55c080e7          	jalr	1372(ra) # 80005f10 <_Z11stringToIntPKc>
    800019bc:	00050993          	mv	s3,a0

    int** matrica;
   // matrica = new int*[n];
    matrica = (int**) mem_alloc(sizeof(int*) * n);
    800019c0:	003a1b93          	slli	s7,s4,0x3
    800019c4:	000b8513          	mv	a0,s7
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	8c4080e7          	jalr	-1852(ra) # 8000128c <_Z9mem_allocm>
    800019d0:	00050a93          	mv	s5,a0


    printString("Unesite elemente matrice:\n");
    800019d4:	00008517          	auipc	a0,0x8
    800019d8:	68c50513          	addi	a0,a0,1676 # 8000a060 <CONSOLE_STATUS+0x50>
    800019dc:	00004097          	auipc	ra,0x4
    800019e0:	3c8080e7          	jalr	968(ra) # 80005da4 <_Z11printStringPKc>
    int broj=1;

    for (int i = 0; i <n ; ++i) {
    800019e4:	00000b13          	li	s6,0
    int broj=1;
    800019e8:	00100493          	li	s1,1
    800019ec:	0080006f          	j	800019f4 <_Z5probav+0xc4>
    for (int i = 0; i <n ; ++i) {
    800019f0:	001b0b1b          	addiw	s6,s6,1
    800019f4:	054b5063          	bge	s6,s4,80001a34 <_Z5probav+0x104>
        matrica[i] = (int*) mem_alloc(sizeof(int) * m);
    800019f8:	003b1913          	slli	s2,s6,0x3
    800019fc:	012a8933          	add	s2,s5,s2
    80001a00:	00299513          	slli	a0,s3,0x2
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	888080e7          	jalr	-1912(ra) # 8000128c <_Z9mem_allocm>
    80001a0c:	00a93023          	sd	a0,0(s2)
        for (int j = 0; j < m; ++j) {
    80001a10:	00000793          	li	a5,0
    80001a14:	fd37dee3          	bge	a5,s3,800019f0 <_Z5probav+0xc0>
     //       getString(string,30);
      //      matrica[i][j] = stringToInt(string);
      matrica[i][j] = broj++;
    80001a18:	00093703          	ld	a4,0(s2)
    80001a1c:	00279693          	slli	a3,a5,0x2
    80001a20:	00d70733          	add	a4,a4,a3
    80001a24:	00972023          	sw	s1,0(a4)
        for (int j = 0; j < m; ++j) {
    80001a28:	0017879b          	addiw	a5,a5,1
      matrica[i][j] = broj++;
    80001a2c:	0014849b          	addiw	s1,s1,1
        for (int j = 0; j < m; ++j) {
    80001a30:	fe5ff06f          	j	80001a14 <_Z5probav+0xe4>
        }
    }

    int res=0;
    80001a34:	f8042623          	sw	zero,-116(s0)
    thread_t*  niti = (thread_t*)mem_alloc(sizeof(thread_t) * n);
    80001a38:	000b8513          	mv	a0,s7
    80001a3c:	00000097          	auipc	ra,0x0
    80001a40:	850080e7          	jalr	-1968(ra) # 8000128c <_Z9mem_allocm>
    80001a44:	00050913          	mv	s2,a0
    sem_t  semafor;
    sem_open(&semafor,1);
    80001a48:	00100593          	li	a1,1
    80001a4c:	f8040513          	addi	a0,s0,-128
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	adc080e7          	jalr	-1316(ra) # 8000152c <_Z8sem_openPP4_semj>



    for (int i = 0; i < n; ++i) {
    80001a58:	00000493          	li	s1,0
    80001a5c:	0744d463          	bge	s1,s4,80001ac4 <_Z5probav+0x194>
        Data* a = new Data();
    80001a60:	02000513          	li	a0,32
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	6ec080e7          	jalr	1772(ra) # 80002150 <_Znwm>
    80001a6c:	00050613          	mv	a2,a0
    80001a70:	00053023          	sd	zero,0(a0)
    80001a74:	00052423          	sw	zero,8(a0)
    80001a78:	00052623          	sw	zero,12(a0)
    80001a7c:	00053823          	sd	zero,16(a0)
        a->semafor=semafor;
    80001a80:	f8043783          	ld	a5,-128(s0)
    80001a84:	00f53c23          	sd	a5,24(a0)
        a->matrica=matrica[i];
    80001a88:	00349513          	slli	a0,s1,0x3
    80001a8c:	00aa87b3          	add	a5,s5,a0
    80001a90:	0007b783          	ld	a5,0(a5)
    80001a94:	00f63823          	sd	a5,16(a2)
        a->res=&res;
    80001a98:	f8c40793          	addi	a5,s0,-116
    80001a9c:	00f63023          	sd	a5,0(a2)
        a->vrsta=i;
    80001aa0:	00962423          	sw	s1,8(a2)
        a->kolone=m;
    80001aa4:	01362623          	sw	s3,12(a2)
        thread_create(&niti[i], fja,a);
    80001aa8:	00000597          	auipc	a1,0x0
    80001aac:	df058593          	addi	a1,a1,-528 # 80001898 <_Z3fjaPv>
    80001ab0:	00a90533          	add	a0,s2,a0
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	84c080e7          	jalr	-1972(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < n; ++i) {
    80001abc:	0014849b          	addiw	s1,s1,1
    80001ac0:	f9dff06f          	j	80001a5c <_Z5probav+0x12c>
    }


    for (int i = 0; i < n; ++i) {
    80001ac4:	00000493          	li	s1,0
    80001ac8:	0344d063          	bge	s1,s4,80001ae8 <_Z5probav+0x1b8>
        thread_join(niti[i]);
    80001acc:	00349793          	slli	a5,s1,0x3
    80001ad0:	00f907b3          	add	a5,s2,a5
    80001ad4:	0007b503          	ld	a0,0(a5)
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	91c080e7          	jalr	-1764(ra) # 800013f4 <_Z11thread_joinP3TCB>
    for (int i = 0; i < n; ++i) {
    80001ae0:	0014849b          	addiw	s1,s1,1
    80001ae4:	fe5ff06f          	j	80001ac8 <_Z5probav+0x198>
    }

    printInt(res);
    80001ae8:	00000613          	li	a2,0
    80001aec:	00a00593          	li	a1,10
    80001af0:	f8c42503          	lw	a0,-116(s0)
    80001af4:	00004097          	auipc	ra,0x4
    80001af8:	46c080e7          	jalr	1132(ra) # 80005f60 <_Z8printIntiii>
    putc('\n');
    80001afc:	00a00513          	li	a0,10
    80001b00:	00000097          	auipc	ra,0x0
    80001b04:	b90080e7          	jalr	-1136(ra) # 80001690 <_Z4putcc>

    for (int i = 0; i <n ; ++i) {
    80001b08:	00000493          	li	s1,0
    80001b0c:	0344d063          	bge	s1,s4,80001b2c <_Z5probav+0x1fc>
        mem_free(matrica[i]);
    80001b10:	00349793          	slli	a5,s1,0x3
    80001b14:	00fa87b3          	add	a5,s5,a5
    80001b18:	0007b503          	ld	a0,0(a5)
    80001b1c:	fffff097          	auipc	ra,0xfffff
    80001b20:	7b4080e7          	jalr	1972(ra) # 800012d0 <_Z8mem_freePv>
    for (int i = 0; i <n ; ++i) {
    80001b24:	0014849b          	addiw	s1,s1,1
    80001b28:	fe5ff06f          	j	80001b0c <_Z5probav+0x1dc>
    }
    mem_free(matrica);
    80001b2c:	000a8513          	mv	a0,s5
    80001b30:	fffff097          	auipc	ra,0xfffff
    80001b34:	7a0080e7          	jalr	1952(ra) # 800012d0 <_Z8mem_freePv>
    mem_free(niti);
    80001b38:	00090513          	mv	a0,s2
    80001b3c:	fffff097          	auipc	ra,0xfffff
    80001b40:	794080e7          	jalr	1940(ra) # 800012d0 <_Z8mem_freePv>

    80001b44:	07813083          	ld	ra,120(sp)
    80001b48:	07013403          	ld	s0,112(sp)
    80001b4c:	06813483          	ld	s1,104(sp)
    80001b50:	06013903          	ld	s2,96(sp)
    80001b54:	05813983          	ld	s3,88(sp)
    80001b58:	05013a03          	ld	s4,80(sp)
    80001b5c:	04813a83          	ld	s5,72(sp)
    80001b60:	04013b03          	ld	s6,64(sp)
    80001b64:	03813b83          	ld	s7,56(sp)
    80001b68:	08010113          	addi	sp,sp,128
    80001b6c:	00008067          	ret

0000000080001b70 <_ZN6Thread7wrapperEPv>:
}

Thread::Thread(): Thread(Thread::wrapper, this){}

void Thread::wrapper(void *thr)
{
    80001b70:	ff010113          	addi	sp,sp,-16
    80001b74:	00113423          	sd	ra,8(sp)
    80001b78:	00813023          	sd	s0,0(sp)
    80001b7c:	01010413          	addi	s0,sp,16
    ((Thread*)thr)->run();
    80001b80:	00053783          	ld	a5,0(a0)
    80001b84:	0107b783          	ld	a5,16(a5)
    80001b88:	000780e7          	jalr	a5
}
    80001b8c:	00813083          	ld	ra,8(sp)
    80001b90:	00013403          	ld	s0,0(sp)
    80001b94:	01010113          	addi	sp,sp,16
    80001b98:	00008067          	ret

0000000080001b9c <_ZN6ThreadD1Ev>:
int Thread::sleep (time_t vreme)
{
    return time_sleep(vreme);
}

Thread::~Thread() {
    80001b9c:	fe010113          	addi	sp,sp,-32
    80001ba0:	00113c23          	sd	ra,24(sp)
    80001ba4:	00813823          	sd	s0,16(sp)
    80001ba8:	00913423          	sd	s1,8(sp)
    80001bac:	02010413          	addi	s0,sp,32
    80001bb0:	00050493          	mv	s1,a0
    80001bb4:	0000b797          	auipc	a5,0xb
    80001bb8:	d6478793          	addi	a5,a5,-668 # 8000c918 <_ZTV6Thread+0x10>
    80001bbc:	00f53023          	sd	a5,0(a0)
    // Ukoliko nit jos uvek radi cekamo nit da zavrsi!
    thread_join(myHandle);
    80001bc0:	00853503          	ld	a0,8(a0)
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	830080e7          	jalr	-2000(ra) # 800013f4 <_Z11thread_joinP3TCB>
    thread_delete(myHandle);
    80001bcc:	0084b503          	ld	a0,8(s1)
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	930080e7          	jalr	-1744(ra) # 80001500 <_Z13thread_deleteP3TCB>

}
    80001bd8:	01813083          	ld	ra,24(sp)
    80001bdc:	01013403          	ld	s0,16(sp)
    80001be0:	00813483          	ld	s1,8(sp)
    80001be4:	02010113          	addi	sp,sp,32
    80001be8:	00008067          	ret

0000000080001bec <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001bec:	fe010113          	addi	sp,sp,-32
    80001bf0:	00113c23          	sd	ra,24(sp)
    80001bf4:	00813823          	sd	s0,16(sp)
    80001bf8:	00913423          	sd	s1,8(sp)
    80001bfc:	02010413          	addi	s0,sp,32
    80001c00:	00050493          	mv	s1,a0
}
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	f98080e7          	jalr	-104(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80001c0c:	00048513          	mv	a0,s1
    80001c10:	00000097          	auipc	ra,0x0
    80001c14:	590080e7          	jalr	1424(ra) # 800021a0 <_ZdlPv>
    80001c18:	01813083          	ld	ra,24(sp)
    80001c1c:	01013403          	ld	s0,16(sp)
    80001c20:	00813483          	ld	s1,8(sp)
    80001c24:	02010113          	addi	sp,sp,32
    80001c28:	00008067          	ret

0000000080001c2c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) :body(body),arg(arg){
    80001c2c:	ff010113          	addi	sp,sp,-16
    80001c30:	00113423          	sd	ra,8(sp)
    80001c34:	00813023          	sd	s0,0(sp)
    80001c38:	01010413          	addi	s0,sp,16
    80001c3c:	0000b797          	auipc	a5,0xb
    80001c40:	cdc78793          	addi	a5,a5,-804 # 8000c918 <_ZTV6Thread+0x10>
    80001c44:	00f53023          	sd	a5,0(a0)
    80001c48:	00b53823          	sd	a1,16(a0)
    80001c4c:	00c53c23          	sd	a2,24(a0)
    thread_make(&myHandle, body, arg);
    80001c50:	00850513          	addi	a0,a0,8
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	808080e7          	jalr	-2040(ra) # 8000145c <_Z11thread_makePP3TCBPFvPvES2_>
}
    80001c5c:	00813083          	ld	ra,8(sp)
    80001c60:	00013403          	ld	s0,0(sp)
    80001c64:	01010113          	addi	sp,sp,16
    80001c68:	00008067          	ret

0000000080001c6c <_ZN6ThreadC1Ev>:
Thread::Thread(): Thread(Thread::wrapper, this){}
    80001c6c:	ff010113          	addi	sp,sp,-16
    80001c70:	00113423          	sd	ra,8(sp)
    80001c74:	00813023          	sd	s0,0(sp)
    80001c78:	01010413          	addi	s0,sp,16
    80001c7c:	00050613          	mv	a2,a0
    80001c80:	00000597          	auipc	a1,0x0
    80001c84:	ef058593          	addi	a1,a1,-272 # 80001b70 <_ZN6Thread7wrapperEPv>
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	fa4080e7          	jalr	-92(ra) # 80001c2c <_ZN6ThreadC1EPFvPvES0_>
    80001c90:	00813083          	ld	ra,8(sp)
    80001c94:	00013403          	ld	s0,0(sp)
    80001c98:	01010113          	addi	sp,sp,16
    80001c9c:	00008067          	ret

0000000080001ca0 <_ZN6Thread5startEv>:
{
    80001ca0:	ff010113          	addi	sp,sp,-16
    80001ca4:	00113423          	sd	ra,8(sp)
    80001ca8:	00813023          	sd	s0,0(sp)
    80001cac:	01010413          	addi	s0,sp,16
   return thread_start(myHandle);
    80001cb0:	00853503          	ld	a0,8(a0)
    80001cb4:	fffff097          	auipc	ra,0xfffff
    80001cb8:	76c080e7          	jalr	1900(ra) # 80001420 <_Z12thread_startP3TCB>
}
    80001cbc:	00813083          	ld	ra,8(sp)
    80001cc0:	00013403          	ld	s0,0(sp)
    80001cc4:	01010113          	addi	sp,sp,16
    80001cc8:	00008067          	ret

0000000080001ccc <_ZN6Thread4joinEv>:
{
    80001ccc:	ff010113          	addi	sp,sp,-16
    80001cd0:	00113423          	sd	ra,8(sp)
    80001cd4:	00813023          	sd	s0,0(sp)
    80001cd8:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80001cdc:	00853503          	ld	a0,8(a0)
    80001ce0:	fffff097          	auipc	ra,0xfffff
    80001ce4:	714080e7          	jalr	1812(ra) # 800013f4 <_Z11thread_joinP3TCB>
}
    80001ce8:	00813083          	ld	ra,8(sp)
    80001cec:	00013403          	ld	s0,0(sp)
    80001cf0:	01010113          	addi	sp,sp,16
    80001cf4:	00008067          	ret

0000000080001cf8 <_ZN6Thread8dispatchEv>:
{
    80001cf8:	ff010113          	addi	sp,sp,-16
    80001cfc:	00113423          	sd	ra,8(sp)
    80001d00:	00813023          	sd	s0,0(sp)
    80001d04:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001d08:	fffff097          	auipc	ra,0xfffff
    80001d0c:	6c8080e7          	jalr	1736(ra) # 800013d0 <_Z15thread_dispatchv>
}
    80001d10:	00813083          	ld	ra,8(sp)
    80001d14:	00013403          	ld	s0,0(sp)
    80001d18:	01010113          	addi	sp,sp,16
    80001d1c:	00008067          	ret

0000000080001d20 <_ZN6Thread5sleepEm>:
{
    80001d20:	ff010113          	addi	sp,sp,-16
    80001d24:	00113423          	sd	ra,8(sp)
    80001d28:	00813023          	sd	s0,0(sp)
    80001d2c:	01010413          	addi	s0,sp,16
    return time_sleep(vreme);
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	8fc080e7          	jalr	-1796(ra) # 8000162c <_Z10time_sleepm>
}
    80001d38:	00813083          	ld	ra,8(sp)
    80001d3c:	00013403          	ld	s0,0(sp)
    80001d40:	01010113          	addi	sp,sp,16
    80001d44:	00008067          	ret

0000000080001d48 <_ZN6Thread3runEv>:
    static void wrapper(void*);


protected:
    Thread ();
    virtual void run () {}
    80001d48:	ff010113          	addi	sp,sp,-16
    80001d4c:	00813423          	sd	s0,8(sp)
    80001d50:	01010413          	addi	s0,sp,16
    80001d54:	00813403          	ld	s0,8(sp)
    80001d58:	01010113          	addi	sp,sp,16
    80001d5c:	00008067          	ret

0000000080001d60 <_ZN9Scheduler3getEv>:
TCB* Scheduler:: head = nullptr;
TCB* Scheduler:: tail = nullptr;
int Scheduler:: count = 0;

TCB *Scheduler::get()
{
    80001d60:	ff010113          	addi	sp,sp,-16
    80001d64:	00813423          	sd	s0,8(sp)
    80001d68:	01010413          	addi	s0,sp,16
    if (head== nullptr)return nullptr;
    80001d6c:	0000b517          	auipc	a0,0xb
    80001d70:	e5453503          	ld	a0,-428(a0) # 8000cbc0 <_ZN9Scheduler4headE>
    80001d74:	02050463          	beqz	a0,80001d9c <_ZN9Scheduler3getEv+0x3c>
    else
    {
        TCB* curr = head;
        head = head->next;
    80001d78:	03853683          	ld	a3,56(a0)
    80001d7c:	0000b797          	auipc	a5,0xb
    80001d80:	e4478793          	addi	a5,a5,-444 # 8000cbc0 <_ZN9Scheduler4headE>
    80001d84:	00d7b023          	sd	a3,0(a5)
        count--;
    80001d88:	0087a703          	lw	a4,8(a5)
    80001d8c:	fff7071b          	addiw	a4,a4,-1
    80001d90:	00e7a423          	sw	a4,8(a5)
        if (head== nullptr)tail= nullptr;
    80001d94:	00068a63          	beqz	a3,80001da8 <_ZN9Scheduler3getEv+0x48>
        curr->next= nullptr;
    80001d98:	02053c23          	sd	zero,56(a0)
        return curr;
    }

}
    80001d9c:	00813403          	ld	s0,8(sp)
    80001da0:	01010113          	addi	sp,sp,16
    80001da4:	00008067          	ret
        if (head== nullptr)tail= nullptr;
    80001da8:	0000b797          	auipc	a5,0xb
    80001dac:	e207b423          	sd	zero,-472(a5) # 8000cbd0 <_ZN9Scheduler4tailE>
    80001db0:	fe9ff06f          	j	80001d98 <_ZN9Scheduler3getEv+0x38>

0000000080001db4 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB *data)
{
    80001db4:	ff010113          	addi	sp,sp,-16
    80001db8:	00813423          	sd	s0,8(sp)
    80001dbc:	01010413          	addi	s0,sp,16
    if (head == nullptr)
    80001dc0:	0000b797          	auipc	a5,0xb
    80001dc4:	e007b783          	ld	a5,-512(a5) # 8000cbc0 <_ZN9Scheduler4headE>
    80001dc8:	02078a63          	beqz	a5,80001dfc <_ZN9Scheduler3putEP3TCB+0x48>
        tail = data;
        data->next= nullptr;
    }
    else
    {
        tail->next = data;
    80001dcc:	0000b797          	auipc	a5,0xb
    80001dd0:	df478793          	addi	a5,a5,-524 # 8000cbc0 <_ZN9Scheduler4headE>
    80001dd4:	0107b703          	ld	a4,16(a5)
    80001dd8:	02a73c23          	sd	a0,56(a4)
        tail = data;
    80001ddc:	00a7b823          	sd	a0,16(a5)
        count++;
    80001de0:	0087a703          	lw	a4,8(a5)
    80001de4:	0017071b          	addiw	a4,a4,1
    80001de8:	00e7a423          	sw	a4,8(a5)
        data->next= nullptr;
    80001dec:	02053c23          	sd	zero,56(a0)
    }
}
    80001df0:	00813403          	ld	s0,8(sp)
    80001df4:	01010113          	addi	sp,sp,16
    80001df8:	00008067          	ret
        head = data;
    80001dfc:	0000b797          	auipc	a5,0xb
    80001e00:	dc478793          	addi	a5,a5,-572 # 8000cbc0 <_ZN9Scheduler4headE>
    80001e04:	00a7b023          	sd	a0,0(a5)
        count++;
    80001e08:	0087a703          	lw	a4,8(a5)
    80001e0c:	0017071b          	addiw	a4,a4,1
    80001e10:	00e7a423          	sw	a4,8(a5)
        tail = data;
    80001e14:	00a7b823          	sd	a0,16(a5)
        data->next= nullptr;
    80001e18:	02053c23          	sd	zero,56(a0)
    80001e1c:	fd5ff06f          	j	80001df0 <_ZN9Scheduler3putEP3TCB+0x3c>

0000000080001e20 <_ZN7Console4getcEv>:
// Created by os on 5/30/23.
//
#include "../h/syscall_cpp.hpp"


char Console::getc() {
    80001e20:	ff010113          	addi	sp,sp,-16
    80001e24:	00113423          	sd	ra,8(sp)
    80001e28:	00813023          	sd	s0,0(sp)
    80001e2c:	01010413          	addi	s0,sp,16
    return ::getc();
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	834080e7          	jalr	-1996(ra) # 80001664 <_Z4getcv>
}
    80001e38:	00813083          	ld	ra,8(sp)
    80001e3c:	00013403          	ld	s0,0(sp)
    80001e40:	01010113          	addi	sp,sp,16
    80001e44:	00008067          	ret

0000000080001e48 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80001e48:	ff010113          	addi	sp,sp,-16
    80001e4c:	00113423          	sd	ra,8(sp)
    80001e50:	00813023          	sd	s0,0(sp)
    80001e54:	01010413          	addi	s0,sp,16
    ::putc(c);
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	838080e7          	jalr	-1992(ra) # 80001690 <_Z4putcc>
}
    80001e60:	00813083          	ld	ra,8(sp)
    80001e64:	00013403          	ld	s0,0(sp)
    80001e68:	01010113          	addi	sp,sp,16
    80001e6c:	00008067          	ret

0000000080001e70 <_Z13idle_functionPv>:
extern  void userMain();
extern  void probasleep();


void idle_function(void* arg)
{
    80001e70:	ff010113          	addi	sp,sp,-16
    80001e74:	00113423          	sd	ra,8(sp)
    80001e78:	00813023          	sd	s0,0(sp)
    80001e7c:	01010413          	addi	s0,sp,16
    while(true)
    {
        thread_dispatch();
    80001e80:	fffff097          	auipc	ra,0xfffff
    80001e84:	550080e7          	jalr	1360(ra) # 800013d0 <_Z15thread_dispatchv>
    while(true)
    80001e88:	ff9ff06f          	j	80001e80 <_Z13idle_functionPv+0x10>

0000000080001e8c <_Z12user_wrapperPv>:
    }
}


void user_wrapper(void* arg)
{
    80001e8c:	ff010113          	addi	sp,sp,-16
    80001e90:	00113423          	sd	ra,8(sp)
    80001e94:	00813023          	sd	s0,0(sp)
    80001e98:	01010413          	addi	s0,sp,16
  userMain();
    80001e9c:	00004097          	auipc	ra,0x4
    80001ea0:	5dc080e7          	jalr	1500(ra) # 80006478 <_Z8userMainv>
  //probasleep();
}
    80001ea4:	00813083          	ld	ra,8(sp)
    80001ea8:	00013403          	ld	s0,0(sp)
    80001eac:	01010113          	addi	sp,sp,16
    80001eb0:	00008067          	ret

0000000080001eb4 <_Z5ispisPv>:



void ispis(void* arg) {
    80001eb4:	fd010113          	addi	sp,sp,-48
    80001eb8:	02113423          	sd	ra,40(sp)
    80001ebc:	02813023          	sd	s0,32(sp)
    80001ec0:	00913c23          	sd	s1,24(sp)
    80001ec4:	03010413          	addi	s0,sp,48
    while (true) {
                // Uzimanje vrednosti status registra
                char volatile status = *((char *) CONSOLE_STATUS);
    80001ec8:	0000b797          	auipc	a5,0xb
    80001ecc:	c507b783          	ld	a5,-944(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001ed0:	0007b483          	ld	s1,0(a5)
    80001ed4:	0004c783          	lbu	a5,0(s1)
    80001ed8:	fcf40f23          	sb	a5,-34(s0)
                while (status & CONSOLE_TX_STATUS_BIT) {
    80001edc:	fde44783          	lbu	a5,-34(s0)
    80001ee0:	0ff7f793          	andi	a5,a5,255
    80001ee4:	0207f793          	andi	a5,a5,32
    80001ee8:	fe0780e3          	beqz	a5,80001ec8 <_Z5ispisPv+0x14>
                    // Uzimanje karaktera iz izlaznog bafera
                    char volatile c = Riscv::output_buffer->get();
    80001eec:	0000b797          	auipc	a5,0xb
    80001ef0:	c647b783          	ld	a5,-924(a5) # 8000cb50 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001ef4:	0007b503          	ld	a0,0(a5)
    80001ef8:	00002097          	auipc	ra,0x2
    80001efc:	97c080e7          	jalr	-1668(ra) # 80003874 <_ZN7_Buffer3getEv>
    80001f00:	fca40fa3          	sb	a0,-33(s0)
                    *((char *) CONSOLE_TX_DATA) = c;
    80001f04:	0000b797          	auipc	a5,0xb
    80001f08:	c3c7b783          	ld	a5,-964(a5) # 8000cb40 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001f0c:	0007b783          	ld	a5,0(a5)
    80001f10:	fdf44703          	lbu	a4,-33(s0)
    80001f14:	00e78023          	sb	a4,0(a5)
                    status = *((char*)CONSOLE_STATUS);
    80001f18:	0004c783          	lbu	a5,0(s1)
    80001f1c:	fcf40f23          	sb	a5,-34(s0)
                while (status & CONSOLE_TX_STATUS_BIT) {
    80001f20:	fbdff06f          	j	80001edc <_Z5ispisPv+0x28>

0000000080001f24 <main>:
    }



int main()
{
    80001f24:	fe010113          	addi	sp,sp,-32
    80001f28:	00113c23          	sd	ra,24(sp)
    80001f2c:	00813823          	sd	s0,16(sp)
    80001f30:	00913423          	sd	s1,8(sp)
    80001f34:	01213023          	sd	s2,0(sp)
    80001f38:	02010413          	addi	s0,sp,32

  Riscv::input_buffer=new _Buffer();
    80001f3c:	12800513          	li	a0,296
    80001f40:	00001097          	auipc	ra,0x1
    80001f44:	744080e7          	jalr	1860(ra) # 80003684 <_ZN7_BuffernwEm>
    80001f48:	00050493          	mv	s1,a0
    80001f4c:	00002097          	auipc	ra,0x2
    80001f50:	824080e7          	jalr	-2012(ra) # 80003770 <_ZN7_BufferC1Ev>
    80001f54:	0000b797          	auipc	a5,0xb
    80001f58:	c1c7b783          	ld	a5,-996(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001f5c:	0097b023          	sd	s1,0(a5)
  Riscv::output_buffer=new _Buffer();
    80001f60:	12800513          	li	a0,296
    80001f64:	00001097          	auipc	ra,0x1
    80001f68:	720080e7          	jalr	1824(ra) # 80003684 <_ZN7_BuffernwEm>
    80001f6c:	00050493          	mv	s1,a0
    80001f70:	00002097          	auipc	ra,0x2
    80001f74:	800080e7          	jalr	-2048(ra) # 80003770 <_ZN7_BufferC1Ev>
    80001f78:	0000b797          	auipc	a5,0xb
    80001f7c:	bd87b783          	ld	a5,-1064(a5) # 8000cb50 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001f80:	0097b023          	sd	s1,0(a5)

    Riscv::w_stvec((uint64) &supervisorTrap);
    80001f84:	0000b797          	auipc	a5,0xb
    80001f88:	bb47b783          	ld	a5,-1100(a5) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x30>
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001f8c:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrs stvec, 0x01");
    80001f90:	1050e073          	csrsi	stvec,1


    TCB* kernel = TCB::createThread(nullptr, nullptr, nullptr,true);
    80001f94:	00100693          	li	a3,1
    80001f98:	00000613          	li	a2,0
    80001f9c:	00000593          	li	a1,0
    80001fa0:	00000513          	li	a0,0
    80001fa4:	00001097          	auipc	ra,0x1
    80001fa8:	b44080e7          	jalr	-1212(ra) # 80002ae8 <_ZN3TCB12createThreadEPFvPvES0_Pmb>
    80001fac:	00050493          	mv	s1,a0


    TCB::running = kernel;
    80001fb0:	0000b797          	auipc	a5,0xb
    80001fb4:	bb07b783          	ld	a5,-1104(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001fb8:	00a7b023          	sd	a0,0(a5)
    if (velicina%MEM_BLOCK_SIZE==0){velicina = (sizeof(uint64) * DEFAULT_STACK_SIZE)/MEM_BLOCK_SIZE; }
    else {
        velicina = (sizeof(uint64) * DEFAULT_STACK_SIZE)/MEM_BLOCK_SIZE;
        velicina = velicina+1;
    }
    TCB::idle = TCB::createIdleThread(idle_function, nullptr, (uint64*)MemoryAllocator::mem_alloc(velicina),false);
    80001fbc:	20000513          	li	a0,512
    80001fc0:	00001097          	auipc	ra,0x1
    80001fc4:	0fc080e7          	jalr	252(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    80001fc8:	00050613          	mv	a2,a0
    80001fcc:	00000693          	li	a3,0
    80001fd0:	00000593          	li	a1,0
    80001fd4:	00000517          	auipc	a0,0x0
    80001fd8:	e9c50513          	addi	a0,a0,-356 # 80001e70 <_Z13idle_functionPv>
    80001fdc:	00001097          	auipc	ra,0x1
    80001fe0:	a58080e7          	jalr	-1448(ra) # 80002a34 <_ZN3TCB16createIdleThreadEPFvPvES0_Pmb>
    80001fe4:	0000b797          	auipc	a5,0xb
    80001fe8:	b447b783          	ld	a5,-1212(a5) # 8000cb28 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001fec:	00a7b023          	sd	a0,0(a5)

    TCB::out = TCB::createThread(ispis, nullptr, (uint64*)MemoryAllocator::mem_alloc(velicina),true);
    80001ff0:	20000513          	li	a0,512
    80001ff4:	00001097          	auipc	ra,0x1
    80001ff8:	0c8080e7          	jalr	200(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    80001ffc:	00050613          	mv	a2,a0
    80002000:	00100693          	li	a3,1
    80002004:	00000593          	li	a1,0
    80002008:	00000517          	auipc	a0,0x0
    8000200c:	eac50513          	addi	a0,a0,-340 # 80001eb4 <_Z5ispisPv>
    80002010:	00001097          	auipc	ra,0x1
    80002014:	ad8080e7          	jalr	-1320(ra) # 80002ae8 <_ZN3TCB12createThreadEPFvPvES0_Pmb>
    80002018:	0000b797          	auipc	a5,0xb
    8000201c:	b407b783          	ld	a5,-1216(a5) # 8000cb58 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002020:	00a7b023          	sd	a0,0(a5)
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002024:	00200793          	li	a5,2
    80002028:	1007a073          	csrs	sstatus,a5

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    TCB* nit = TCB::createThread(user_wrapper, nullptr, (uint64*)MemoryAllocator::mem_alloc(velicina),false);
    8000202c:	20000513          	li	a0,512
    80002030:	00001097          	auipc	ra,0x1
    80002034:	08c080e7          	jalr	140(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    80002038:	00050613          	mv	a2,a0
    8000203c:	00000693          	li	a3,0
    80002040:	00000593          	li	a1,0
    80002044:	00000517          	auipc	a0,0x0
    80002048:	e4850513          	addi	a0,a0,-440 # 80001e8c <_Z12user_wrapperPv>
    8000204c:	00001097          	auipc	ra,0x1
    80002050:	a9c080e7          	jalr	-1380(ra) # 80002ae8 <_ZN3TCB12createThreadEPFvPvES0_Pmb>
    80002054:	00050913          	mv	s2,a0

    //Cekanje da se zavrsi nit koja izvrsava userMain()

    kernel->join(nit);
    80002058:	00050593          	mv	a1,a0
    8000205c:	00048513          	mv	a0,s1
    80002060:	00001097          	auipc	ra,0x1
    80002064:	bbc080e7          	jalr	-1092(ra) # 80002c1c <_ZN3TCB4joinEPS_>



//Sluzi za ispis ako je jos nesto ostalo u baferu a mi nismo stigli da ga ispisemo
 while (Riscv::output_buffer->count() > 0) {  TCB::dispatch();}
    80002068:	0000b797          	auipc	a5,0xb
    8000206c:	ae87b783          	ld	a5,-1304(a5) # 8000cb50 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002070:	0007b503          	ld	a0,0(a5)
    80002074:	00002097          	auipc	ra,0x2
    80002078:	89c080e7          	jalr	-1892(ra) # 80003910 <_ZN7_Buffer5countEv>
    8000207c:	04a05463          	blez	a0,800020c4 <main+0x1a0>
    80002080:	00001097          	auipc	ra,0x1
    80002084:	8c4080e7          	jalr	-1852(ra) # 80002944 <_ZN3TCB8dispatchEv>
    80002088:	fe1ff06f          	j	80002068 <main+0x144>
    8000208c:	00050913          	mv	s2,a0
  Riscv::input_buffer=new _Buffer();
    80002090:	00048513          	mv	a0,s1
    80002094:	00001097          	auipc	ra,0x1
    80002098:	6b4080e7          	jalr	1716(ra) # 80003748 <_ZN7_BufferdlEPv>
    8000209c:	00090513          	mv	a0,s2
    800020a0:	0000c097          	auipc	ra,0xc
    800020a4:	cb8080e7          	jalr	-840(ra) # 8000dd58 <_Unwind_Resume>
    800020a8:	00050913          	mv	s2,a0
  Riscv::output_buffer=new _Buffer();
    800020ac:	00048513          	mv	a0,s1
    800020b0:	00001097          	auipc	ra,0x1
    800020b4:	698080e7          	jalr	1688(ra) # 80003748 <_ZN7_BufferdlEPv>
    800020b8:	00090513          	mv	a0,s2
    800020bc:	0000c097          	auipc	ra,0xc
    800020c0:	c9c080e7          	jalr	-868(ra) # 8000dd58 <_Unwind_Resume>
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800020c4:	00200793          	li	a5,2
    800020c8:	1007b073          	csrc	sstatus,a5

 //Onemogucavanje prekida
 Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
 //Oslobadjanje memorije
 MemoryAllocator::mem_free(TCB::idle);
    800020cc:	0000b797          	auipc	a5,0xb
    800020d0:	a5c7b783          	ld	a5,-1444(a5) # 8000cb28 <_GLOBAL_OFFSET_TABLE_+0x20>
    800020d4:	0007b503          	ld	a0,0(a5)
    800020d8:	00001097          	auipc	ra,0x1
    800020dc:	130080e7          	jalr	304(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
 MemoryAllocator::mem_free(TCB::out);
    800020e0:	0000b797          	auipc	a5,0xb
    800020e4:	a787b783          	ld	a5,-1416(a5) # 8000cb58 <_GLOBAL_OFFSET_TABLE_+0x50>
    800020e8:	0007b503          	ld	a0,0(a5)
    800020ec:	00001097          	auipc	ra,0x1
    800020f0:	11c080e7          	jalr	284(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
 MemoryAllocator::mem_free(Riscv::output_buffer);
    800020f4:	0000b797          	auipc	a5,0xb
    800020f8:	a5c7b783          	ld	a5,-1444(a5) # 8000cb50 <_GLOBAL_OFFSET_TABLE_+0x48>
    800020fc:	0007b503          	ld	a0,0(a5)
    80002100:	00001097          	auipc	ra,0x1
    80002104:	108080e7          	jalr	264(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
 MemoryAllocator::mem_free(Riscv::input_buffer);
    80002108:	0000b797          	auipc	a5,0xb
    8000210c:	a687b783          	ld	a5,-1432(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002110:	0007b503          	ld	a0,0(a5)
    80002114:	00001097          	auipc	ra,0x1
    80002118:	0f4080e7          	jalr	244(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
 MemoryAllocator::mem_free(nit);
    8000211c:	00090513          	mv	a0,s2
    80002120:	00001097          	auipc	ra,0x1
    80002124:	0e8080e7          	jalr	232(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
 MemoryAllocator::mem_free(kernel);
    80002128:	00048513          	mv	a0,s1
    8000212c:	00001097          	auipc	ra,0x1
    80002130:	0dc080e7          	jalr	220(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
 return 0;

    80002134:	00000513          	li	a0,0
    80002138:	01813083          	ld	ra,24(sp)
    8000213c:	01013403          	ld	s0,16(sp)
    80002140:	00813483          	ld	s1,8(sp)
    80002144:	00013903          	ld	s2,0(sp)
    80002148:	02010113          	addi	sp,sp,32
    8000214c:	00008067          	ret

0000000080002150 <_Znwm>:
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../h/syscall_cpp.hpp"


void *operator new(size_t size) {
    80002150:	ff010113          	addi	sp,sp,-16
    80002154:	00113423          	sd	ra,8(sp)
    80002158:	00813023          	sd	s0,0(sp)
    8000215c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002160:	fffff097          	auipc	ra,0xfffff
    80002164:	12c080e7          	jalr	300(ra) # 8000128c <_Z9mem_allocm>
}
    80002168:	00813083          	ld	ra,8(sp)
    8000216c:	00013403          	ld	s0,0(sp)
    80002170:	01010113          	addi	sp,sp,16
    80002174:	00008067          	ret

0000000080002178 <_Znam>:

void *operator new[](size_t size) {
    80002178:	ff010113          	addi	sp,sp,-16
    8000217c:	00113423          	sd	ra,8(sp)
    80002180:	00813023          	sd	s0,0(sp)
    80002184:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002188:	fffff097          	auipc	ra,0xfffff
    8000218c:	104080e7          	jalr	260(ra) # 8000128c <_Z9mem_allocm>
}
    80002190:	00813083          	ld	ra,8(sp)
    80002194:	00013403          	ld	s0,0(sp)
    80002198:	01010113          	addi	sp,sp,16
    8000219c:	00008067          	ret

00000000800021a0 <_ZdlPv>:



void operator delete(void *p)  noexcept {
    800021a0:	ff010113          	addi	sp,sp,-16
    800021a4:	00113423          	sd	ra,8(sp)
    800021a8:	00813023          	sd	s0,0(sp)
    800021ac:	01010413          	addi	s0,sp,16
    mem_free(p);
    800021b0:	fffff097          	auipc	ra,0xfffff
    800021b4:	120080e7          	jalr	288(ra) # 800012d0 <_Z8mem_freePv>
}
    800021b8:	00813083          	ld	ra,8(sp)
    800021bc:	00013403          	ld	s0,0(sp)
    800021c0:	01010113          	addi	sp,sp,16
    800021c4:	00008067          	ret

00000000800021c8 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    800021c8:	ff010113          	addi	sp,sp,-16
    800021cc:	00113423          	sd	ra,8(sp)
    800021d0:	00813023          	sd	s0,0(sp)
    800021d4:	01010413          	addi	s0,sp,16
    mem_free(p);
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	0f8080e7          	jalr	248(ra) # 800012d0 <_Z8mem_freePv>
}
    800021e0:	00813083          	ld	ra,8(sp)
    800021e4:	00013403          	ld	s0,0(sp)
    800021e8:	01010113          	addi	sp,sp,16
    800021ec:	00008067          	ret

00000000800021f0 <_ZN14PeriodicThread7wrapperEPv>:
//
#include "../h/syscall_cpp.hpp"

PeriodicThread::PeriodicThread(time_t period):Thread(PeriodicThread::wrapper,this),period(period){}

void PeriodicThread::wrapper(void *arg) {
    800021f0:	fe010113          	addi	sp,sp,-32
    800021f4:	00113c23          	sd	ra,24(sp)
    800021f8:	00813823          	sd	s0,16(sp)
    800021fc:	00913423          	sd	s1,8(sp)
    80002200:	02010413          	addi	s0,sp,32
    80002204:	00050493          	mv	s1,a0
    PeriodicThread* t = (PeriodicThread*) arg;
    while (t->period>0) {
    80002208:	0204b503          	ld	a0,32(s1)
    8000220c:	02050063          	beqz	a0,8000222c <_ZN14PeriodicThread7wrapperEPv+0x3c>
        time_sleep(t->period);
    80002210:	fffff097          	auipc	ra,0xfffff
    80002214:	41c080e7          	jalr	1052(ra) # 8000162c <_Z10time_sleepm>
        t->periodicActivation();
    80002218:	0004b783          	ld	a5,0(s1)
    8000221c:	0187b783          	ld	a5,24(a5)
    80002220:	00048513          	mv	a0,s1
    80002224:	000780e7          	jalr	a5
    while (t->period>0) {
    80002228:	fe1ff06f          	j	80002208 <_ZN14PeriodicThread7wrapperEPv+0x18>
    }
}
    8000222c:	01813083          	ld	ra,24(sp)
    80002230:	01013403          	ld	s0,16(sp)
    80002234:	00813483          	ld	s1,8(sp)
    80002238:	02010113          	addi	sp,sp,32
    8000223c:	00008067          	ret

0000000080002240 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):Thread(PeriodicThread::wrapper,this),period(period){}
    80002240:	fe010113          	addi	sp,sp,-32
    80002244:	00113c23          	sd	ra,24(sp)
    80002248:	00813823          	sd	s0,16(sp)
    8000224c:	00913423          	sd	s1,8(sp)
    80002250:	01213023          	sd	s2,0(sp)
    80002254:	02010413          	addi	s0,sp,32
    80002258:	00050493          	mv	s1,a0
    8000225c:	00058913          	mv	s2,a1
    80002260:	00050613          	mv	a2,a0
    80002264:	00000597          	auipc	a1,0x0
    80002268:	f8c58593          	addi	a1,a1,-116 # 800021f0 <_ZN14PeriodicThread7wrapperEPv>
    8000226c:	00000097          	auipc	ra,0x0
    80002270:	9c0080e7          	jalr	-1600(ra) # 80001c2c <_ZN6ThreadC1EPFvPvES0_>
    80002274:	0000a797          	auipc	a5,0xa
    80002278:	6cc78793          	addi	a5,a5,1740 # 8000c940 <_ZTV14PeriodicThread+0x10>
    8000227c:	00f4b023          	sd	a5,0(s1)
    80002280:	0324b023          	sd	s2,32(s1)
    80002284:	01813083          	ld	ra,24(sp)
    80002288:	01013403          	ld	s0,16(sp)
    8000228c:	00813483          	ld	s1,8(sp)
    80002290:	00013903          	ld	s2,0(sp)
    80002294:	02010113          	addi	sp,sp,32
    80002298:	00008067          	ret

000000008000229c <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {period=0;}
    8000229c:	ff010113          	addi	sp,sp,-16
    800022a0:	00813423          	sd	s0,8(sp)
    800022a4:	01010413          	addi	s0,sp,16
    800022a8:	02053023          	sd	zero,32(a0)
    800022ac:	00813403          	ld	s0,8(sp)
    800022b0:	01010113          	addi	sp,sp,16
    800022b4:	00008067          	ret

00000000800022b8 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();
    static void wrapper(void*);
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800022b8:	ff010113          	addi	sp,sp,-16
    800022bc:	00813423          	sd	s0,8(sp)
    800022c0:	01010413          	addi	s0,sp,16
    800022c4:	00813403          	ld	s0,8(sp)
    800022c8:	01010113          	addi	sp,sp,16
    800022cc:	00008067          	ret

00000000800022d0 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800022d0:	ff010113          	addi	sp,sp,-16
    800022d4:	00113423          	sd	ra,8(sp)
    800022d8:	00813023          	sd	s0,0(sp)
    800022dc:	01010413          	addi	s0,sp,16
    800022e0:	0000a797          	auipc	a5,0xa
    800022e4:	66078793          	addi	a5,a5,1632 # 8000c940 <_ZTV14PeriodicThread+0x10>
    800022e8:	00f53023          	sd	a5,0(a0)
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	8b0080e7          	jalr	-1872(ra) # 80001b9c <_ZN6ThreadD1Ev>
    800022f4:	00813083          	ld	ra,8(sp)
    800022f8:	00013403          	ld	s0,0(sp)
    800022fc:	01010113          	addi	sp,sp,16
    80002300:	00008067          	ret

0000000080002304 <_ZN14PeriodicThreadD0Ev>:
    80002304:	fe010113          	addi	sp,sp,-32
    80002308:	00113c23          	sd	ra,24(sp)
    8000230c:	00813823          	sd	s0,16(sp)
    80002310:	00913423          	sd	s1,8(sp)
    80002314:	02010413          	addi	s0,sp,32
    80002318:	00050493          	mv	s1,a0
    8000231c:	0000a797          	auipc	a5,0xa
    80002320:	62478793          	addi	a5,a5,1572 # 8000c940 <_ZTV14PeriodicThread+0x10>
    80002324:	00f53023          	sd	a5,0(a0)
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	874080e7          	jalr	-1932(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80002330:	00048513          	mv	a0,s1
    80002334:	00000097          	auipc	ra,0x0
    80002338:	e6c080e7          	jalr	-404(ra) # 800021a0 <_ZdlPv>
    8000233c:	01813083          	ld	ra,24(sp)
    80002340:	01013403          	ld	s0,16(sp)
    80002344:	00813483          	ld	s1,8(sp)
    80002348:	02010113          	addi	sp,sp,32
    8000234c:	00008067          	ret

0000000080002350 <_ZN5Riscv10popSppSpieEv>:
SleepingList Riscv::SleepingThreads;
_Buffer* Riscv::input_buffer = nullptr;
_Buffer* Riscv::output_buffer= nullptr;

void Riscv::popSppSpie()
{
    80002350:	ff010113          	addi	sp,sp,-16
    80002354:	00813423          	sd	s0,8(sp)
    80002358:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    8000235c:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002360:	10200073          	sret
}
    80002364:	00813403          	ld	s0,8(sp)
    80002368:	01010113          	addi	sp,sp,16
    8000236c:	00008067          	ret

0000000080002370 <_ZN5Riscv13setThreadModeEv>:

void Riscv::setThreadMode()
{
    80002370:	ff010113          	addi	sp,sp,-16
    80002374:	00813423          	sd	s0,8(sp)
    80002378:	01010413          	addi	s0,sp,16

    // Vracamo nit u odgovarajuci mode rada
    if (TCB::running->isSystemThread())
    8000237c:	0000a797          	auipc	a5,0xa
    80002380:	7e47b783          	ld	a5,2020(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002384:	0007b783          	ld	a5,0(a5)

    bool isBlocked() const { return blocked; }

    bool isStarted() const { return started; }

    bool isSystemThread() { return system_thread;}
    80002388:	0337c783          	lbu	a5,51(a5)
    8000238c:	00078c63          	beqz	a5,800023a4 <_ZN5Riscv13setThreadModeEv+0x34>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002390:	10000793          	li	a5,256
    80002394:	1007a073          	csrs	sstatus,a5
    }
    else
    {
        mc_sstatus(SSTATUS_SPP);
    }
}
    80002398:	00813403          	ld	s0,8(sp)
    8000239c:	01010113          	addi	sp,sp,16
    800023a0:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800023a4:	10000793          	li	a5,256
    800023a8:	1007b073          	csrc	sstatus,a5
    800023ac:	fedff06f          	j	80002398 <_ZN5Riscv13setThreadModeEv+0x28>

00000000800023b0 <_ZN5Riscv24supervisorsyscallHandlerEv>:

void Riscv::supervisorsyscallHandler()
{
    800023b0:	f4010113          	addi	sp,sp,-192
    800023b4:	0a113c23          	sd	ra,184(sp)
    800023b8:	0a813823          	sd	s0,176(sp)
    800023bc:	0a913423          	sd	s1,168(sp)
    800023c0:	0c010413          	addi	s0,sp,192


    uint64  volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800023c4:	142027f3          	csrr	a5,scause
    800023c8:	fcf43c23          	sd	a5,-40(s0)
    uint64 volatile a0;
    uint64 volatile a1;
    uint64 volatile a2;
    uint64 volatile a3;
    uint64 volatile a4;
    uint64 volatile return_value = 0;
    800023cc:	fa043423          	sd	zero,-88(s0)

    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    800023d0:	00050793          	mv	a5,a0
    800023d4:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("mv %[a1], a1" : [a1] "=r"(a1));
    800023d8:	00058793          	mv	a5,a1
    800023dc:	fcf43423          	sd	a5,-56(s0)
    __asm__ volatile ("mv %[a2], a2" : [a2] "=r"(a2));
    800023e0:	00060793          	mv	a5,a2
    800023e4:	fcf43023          	sd	a5,-64(s0)
    __asm__ volatile ("mv %[a3], a3" : [a3] "=r"(a3));
    800023e8:	00068793          	mv	a5,a3
    800023ec:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("mv %[a4], a4" : [a4] "=r"(a4));
    800023f0:	00070793          	mv	a5,a4
    800023f4:	faf43823          	sd	a5,-80(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800023f8:	100027f3          	csrr	a5,sstatus
    800023fc:	f6f43823          	sd	a5,-144(s0)
    return sstatus;
    80002400:	f7043783          	ld	a5,-144(s0)

    uint64  volatile sstatus = Riscv::r_sstatus();
    80002404:	faf43023          	sd	a5,-96(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002408:	141027f3          	csrr	a5,sepc
    8000240c:	f6f43423          	sd	a5,-152(s0)
    return sepc;
    80002410:	f6843783          	ld	a5,-152(s0)
    uint64 volatile sepc = Riscv::r_sepc();
    80002414:	f8f43c23          	sd	a5,-104(s0)

    if (scause== 0x0000000000000008 || scause== 0x0000000000000009 )
    80002418:	fd843703          	ld	a4,-40(s0)
    8000241c:	00800793          	li	a5,8
    80002420:	00f70863          	beq	a4,a5,80002430 <_ZN5Riscv24supervisorsyscallHandlerEv+0x80>
    80002424:	fd843703          	ld	a4,-40(s0)
    80002428:	00900793          	li	a5,9
    8000242c:	02f71663          	bne	a4,a5,80002458 <_ZN5Riscv24supervisorsyscallHandlerEv+0xa8>
    {
        switch (a0) {
    80002430:	fd043783          	ld	a5,-48(s0)
    80002434:	04200713          	li	a4,66
    80002438:	14f76e63          	bltu	a4,a5,80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
    8000243c:	00279793          	slli	a5,a5,0x2
    80002440:	00008717          	auipc	a4,0x8
    80002444:	c6870713          	addi	a4,a4,-920 # 8000a0a8 <CONSOLE_STATUS+0x98>
    80002448:	00e787b3          	add	a5,a5,a4
    8000244c:	0007a783          	lw	a5,0(a5)
    80002450:	00e787b3          	add	a5,a5,a4
    80002454:	00078067          	jr	a5
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002458:	142027f3          	csrr	a5,scause
    8000245c:	f8f43823          	sd	a5,-112(s0)
    return scause;
    80002460:	f9043783          	ld	a5,-112(s0)


    }
    else
    {
        uint64 volatile scause = r_scause();
    80002464:	f4f43423          	sd	a5,-184(s0)
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    80002468:	143027f3          	csrr	a5,stval
    8000246c:	f8f43423          	sd	a5,-120(s0)
    return stval;
    80002470:	f8843783          	ld	a5,-120(s0)
        uint64 volatile stval = r_stval();
    80002474:	f4f43823          	sd	a5,-176(s0)
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    80002478:	105027f3          	csrr	a5,stvec
    8000247c:	f8f43023          	sd	a5,-128(s0)
    return stvec;
    80002480:	f8043783          	ld	a5,-128(s0)
        uint64 volatile stvec = r_stvec();
    80002484:	f4f43c23          	sd	a5,-168(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002488:	141027f3          	csrr	a5,sepc
    8000248c:	f6f43c23          	sd	a5,-136(s0)
    return sepc;
    80002490:	f7843783          	ld	a5,-136(s0)
        uint64 volatile sepc = r_sepc();
    80002494:	f6f43023          	sd	a5,-160(s0)

        printString("scause: ");
    80002498:	00008517          	auipc	a0,0x8
    8000249c:	be850513          	addi	a0,a0,-1048 # 8000a080 <CONSOLE_STATUS+0x70>
    800024a0:	00004097          	auipc	ra,0x4
    800024a4:	904080e7          	jalr	-1788(ra) # 80005da4 <_Z11printStringPKc>
        printInt(scause);
    800024a8:	f4843503          	ld	a0,-184(s0)
    800024ac:	00000613          	li	a2,0
    800024b0:	00a00593          	li	a1,10
    800024b4:	0005051b          	sext.w	a0,a0
    800024b8:	00004097          	auipc	ra,0x4
    800024bc:	aa8080e7          	jalr	-1368(ra) # 80005f60 <_Z8printIntiii>
        printString("\n");
    800024c0:	00008517          	auipc	a0,0x8
    800024c4:	ee850513          	addi	a0,a0,-280 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800024c8:	00004097          	auipc	ra,0x4
    800024cc:	8dc080e7          	jalr	-1828(ra) # 80005da4 <_Z11printStringPKc>

        printString("stval: ");
    800024d0:	00008517          	auipc	a0,0x8
    800024d4:	bc050513          	addi	a0,a0,-1088 # 8000a090 <CONSOLE_STATUS+0x80>
    800024d8:	00004097          	auipc	ra,0x4
    800024dc:	8cc080e7          	jalr	-1844(ra) # 80005da4 <_Z11printStringPKc>
        printInt(stval);
    800024e0:	f5043503          	ld	a0,-176(s0)
    800024e4:	00000613          	li	a2,0
    800024e8:	00a00593          	li	a1,10
    800024ec:	0005051b          	sext.w	a0,a0
    800024f0:	00004097          	auipc	ra,0x4
    800024f4:	a70080e7          	jalr	-1424(ra) # 80005f60 <_Z8printIntiii>
        printString("\n");
    800024f8:	00008517          	auipc	a0,0x8
    800024fc:	eb050513          	addi	a0,a0,-336 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80002500:	00004097          	auipc	ra,0x4
    80002504:	8a4080e7          	jalr	-1884(ra) # 80005da4 <_Z11printStringPKc>

        printString("stvec: ");
    80002508:	00008517          	auipc	a0,0x8
    8000250c:	b9050513          	addi	a0,a0,-1136 # 8000a098 <CONSOLE_STATUS+0x88>
    80002510:	00004097          	auipc	ra,0x4
    80002514:	894080e7          	jalr	-1900(ra) # 80005da4 <_Z11printStringPKc>
        printInt(stvec);
    80002518:	f5843503          	ld	a0,-168(s0)
    8000251c:	00000613          	li	a2,0
    80002520:	00a00593          	li	a1,10
    80002524:	0005051b          	sext.w	a0,a0
    80002528:	00004097          	auipc	ra,0x4
    8000252c:	a38080e7          	jalr	-1480(ra) # 80005f60 <_Z8printIntiii>
        printString("\n");
    80002530:	00008517          	auipc	a0,0x8
    80002534:	e7850513          	addi	a0,a0,-392 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80002538:	00004097          	auipc	ra,0x4
    8000253c:	86c080e7          	jalr	-1940(ra) # 80005da4 <_Z11printStringPKc>

        printString("sepc: ");
    80002540:	00008517          	auipc	a0,0x8
    80002544:	b6050513          	addi	a0,a0,-1184 # 8000a0a0 <CONSOLE_STATUS+0x90>
    80002548:	00004097          	auipc	ra,0x4
    8000254c:	85c080e7          	jalr	-1956(ra) # 80005da4 <_Z11printStringPKc>
        printInt(sepc);
    80002550:	f6043503          	ld	a0,-160(s0)
    80002554:	00000613          	li	a2,0
    80002558:	00a00593          	li	a1,10
    8000255c:	0005051b          	sext.w	a0,a0
    80002560:	00004097          	auipc	ra,0x4
    80002564:	a00080e7          	jalr	-1536(ra) # 80005f60 <_Z8printIntiii>
        printString("\n");
    80002568:	00008517          	auipc	a0,0x8
    8000256c:	e4050513          	addi	a0,a0,-448 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80002570:	00004097          	auipc	ra,0x4
    80002574:	834080e7          	jalr	-1996(ra) # 80005da4 <_Z11printStringPKc>
    80002578:	0380006f          	j	800025b0 <_ZN5Riscv24supervisorsyscallHandlerEv+0x200>
                size = (size_t) a1;
    8000257c:	fc843503          	ld	a0,-56(s0)
               return_value = (uint64) MemoryAllocator::mem_alloc(size);
    80002580:	00001097          	auipc	ra,0x1
    80002584:	b3c080e7          	jalr	-1220(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    80002588:	faa43423          	sd	a0,-88(s0)
               Riscv::w_a0(return_value);
    8000258c:	fa843783          	ld	a5,-88(s0)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

inline void Riscv::w_a0(uint64 a0) {
    __asm__ volatile ("mv a0,%0" : :"r" (a0));
    80002590:	00078513          	mv	a0,a5
        sepc+=4;
    80002594:	f9843783          	ld	a5,-104(s0)
    80002598:	00478793          	addi	a5,a5,4
    8000259c:	f8f43c23          	sd	a5,-104(s0)
        Riscv::w_sepc(sepc);
    800025a0:	f9843783          	ld	a5,-104(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800025a4:	14179073          	csrw	sepc,a5
        Riscv::w_sstatus(sstatus);
    800025a8:	fa043783          	ld	a5,-96(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800025ac:	10079073          	csrw	sstatus,a5
    }


}
    800025b0:	0b813083          	ld	ra,184(sp)
    800025b4:	0b013403          	ld	s0,176(sp)
    800025b8:	0a813483          	ld	s1,168(sp)
    800025bc:	0c010113          	addi	sp,sp,192
    800025c0:	00008067          	ret
                pointer = (void*) a1;
    800025c4:	fc843503          	ld	a0,-56(s0)
                return_value = (uint64)MemoryAllocator::mem_free(pointer);
    800025c8:	00001097          	auipc	ra,0x1
    800025cc:	c40080e7          	jalr	-960(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
    800025d0:	faa43423          	sd	a0,-88(s0)
                Riscv::w_a0(return_value);
    800025d4:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("mv a0,%0" : :"r" (a0));
    800025d8:	00078513          	mv	a0,a5
}
    800025dc:	fb9ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                handle = (thread_t*) a1;
    800025e0:	fc843483          	ld	s1,-56(s0)
                start_routine = (TCB::Body) a2;
    800025e4:	fc043503          	ld	a0,-64(s0)
                 arg = (void*) a3;
    800025e8:	fb843583          	ld	a1,-72(s0)
                stack = (void*) a4;
    800025ec:	fb043603          	ld	a2,-80(s0)
                *handle = TCB::createThread(start_routine,arg,stack_space,false);
    800025f0:	00000693          	li	a3,0
    800025f4:	00000097          	auipc	ra,0x0
    800025f8:	4f4080e7          	jalr	1268(ra) # 80002ae8 <_ZN3TCB12createThreadEPFvPvES0_Pmb>
    800025fc:	00a4b023          	sd	a0,0(s1)
                break;
    80002600:	f95ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                return_value = TCB::exit();
    80002604:	00000097          	auipc	ra,0x0
    80002608:	69c080e7          	jalr	1692(ra) # 80002ca0 <_ZN3TCB4exitEv>
    8000260c:	faa43423          	sd	a0,-88(s0)
                Riscv::w_a0(return_value);
    80002610:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("mv a0,%0" : :"r" (a0));
    80002614:	00078513          	mv	a0,a5
}
    80002618:	f7dff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                TCB::dispatch();
    8000261c:	00000097          	auipc	ra,0x0
    80002620:	328080e7          	jalr	808(ra) # 80002944 <_ZN3TCB8dispatchEv>
                break;
    80002624:	f71ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                __asm__ volatile("mv %0, a1" : "=r" (nit));
    80002628:	00058593          	mv	a1,a1
                TCB::running->join(nit);
    8000262c:	0000a797          	auipc	a5,0xa
    80002630:	5347b783          	ld	a5,1332(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002634:	0007b503          	ld	a0,0(a5)
    80002638:	00000097          	auipc	ra,0x0
    8000263c:	5e4080e7          	jalr	1508(ra) # 80002c1c <_ZN3TCB4joinEPS_>
                break;
    80002640:	f55ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                __asm__ volatile("mv %0, a1" : "=r" (nit));
    80002644:	00058593          	mv	a1,a1
               return_value =  TCB::running->start(nit);
    80002648:	0000a797          	auipc	a5,0xa
    8000264c:	5187b783          	ld	a5,1304(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002650:	0007b503          	ld	a0,0(a5)
    80002654:	00000097          	auipc	ra,0x0
    80002658:	6c8080e7          	jalr	1736(ra) # 80002d1c <_ZN3TCB5startEPS_>
    8000265c:	faa43423          	sd	a0,-88(s0)
                Riscv::w_a0(return_value);
    80002660:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("mv a0,%0" : :"r" (a0));
    80002664:	00078513          	mv	a0,a5
}
    80002668:	f2dff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                handle = (thread_t*) a1;
    8000266c:	fc843483          	ld	s1,-56(s0)
                start_routine = (TCB::Body) a2;
    80002670:	fc043503          	ld	a0,-64(s0)
                arg = (void*) a3;
    80002674:	fb843583          	ld	a1,-72(s0)
                stack = (void*) a4;
    80002678:	fb043603          	ld	a2,-80(s0)
                *handle = TCB::makeThread(start_routine,arg,stack_space,false);
    8000267c:	00000693          	li	a3,0
    80002680:	00000097          	auipc	ra,0x0
    80002684:	6e4080e7          	jalr	1764(ra) # 80002d64 <_ZN3TCB10makeThreadEPFvPvES0_Pmb>
    80002688:	00a4b023          	sd	a0,0(s1)
                break;
    8000268c:	f09ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                thread_t nit = (thread_t) a1;
    80002690:	fc843483          	ld	s1,-56(s0)
                delete nit;
    80002694:	f00480e3          	beqz	s1,80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
        delete[] stack;
    80002698:	0104b503          	ld	a0,16(s1)
    8000269c:	00050663          	beqz	a0,800026a8 <_ZN5Riscv24supervisorsyscallHandlerEv+0x2f8>
    800026a0:	00000097          	auipc	ra,0x0
    800026a4:	b28080e7          	jalr	-1240(ra) # 800021c8 <_ZdaPv>
    800026a8:	00048513          	mv	a0,s1
    800026ac:	00000097          	auipc	ra,0x0
    800026b0:	510080e7          	jalr	1296(ra) # 80002bbc <_ZN3TCBdlEPv>
    800026b4:	ee1ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                handle = (sem_t*) a1;
    800026b8:	fc843483          	ld	s1,-56(s0)
                init = (unsigned) a2;
    800026bc:	fc043503          	ld	a0,-64(s0)
                *handle = _sem::createSemaphore(init);
    800026c0:	0005051b          	sext.w	a0,a0
    800026c4:	00001097          	auipc	ra,0x1
    800026c8:	9b0080e7          	jalr	-1616(ra) # 80003074 <_ZN4_sem15createSemaphoreEj>
    800026cc:	00a4b023          	sd	a0,0(s1)
                break;
    800026d0:	ec5ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                __asm__ volatile("mv %0, a1" : "=r" (handle));
    800026d4:	00058493          	mv	s1,a1
                return_value = handle->close();
    800026d8:	00048513          	mv	a0,s1
    800026dc:	00001097          	auipc	ra,0x1
    800026e0:	904080e7          	jalr	-1788(ra) # 80002fe0 <_ZN4_sem5closeEv>
    800026e4:	faa43423          	sd	a0,-88(s0)
                MemoryAllocator::mem_free(handle);
    800026e8:	00048513          	mv	a0,s1
    800026ec:	00001097          	auipc	ra,0x1
    800026f0:	b1c080e7          	jalr	-1252(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
                Riscv::w_a0(return_value);
    800026f4:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("mv a0,%0" : :"r" (a0));
    800026f8:	00078513          	mv	a0,a5
}
    800026fc:	e99ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                handle = (sem_t)a1;
    80002700:	fc843503          	ld	a0,-56(s0)
                return_value = handle->wait();
    80002704:	00000097          	auipc	ra,0x0
    80002708:	7b0080e7          	jalr	1968(ra) # 80002eb4 <_ZN4_sem4waitEv>
    8000270c:	faa43423          	sd	a0,-88(s0)
                Riscv::w_a0(return_value);
    80002710:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("mv a0,%0" : :"r" (a0));
    80002714:	00078513          	mv	a0,a5
}
    80002718:	e7dff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                handle = (sem_t)a1;
    8000271c:	fc843503          	ld	a0,-56(s0)
                return_value = handle->signal();
    80002720:	00001097          	auipc	ra,0x1
    80002724:	85c080e7          	jalr	-1956(ra) # 80002f7c <_ZN4_sem6signalEv>
    80002728:	faa43423          	sd	a0,-88(s0)
                Riscv::w_a0(return_value);
    8000272c:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("mv a0,%0" : :"r" (a0));
    80002730:	00078513          	mv	a0,a5
}
    80002734:	e61ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                vreme = (time_t) a1;
    80002738:	fc843603          	ld	a2,-56(s0)
                SleepingThreads.add_node(TCB::running,vreme);
    8000273c:	0000a797          	auipc	a5,0xa
    80002740:	4247b783          	ld	a5,1060(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002744:	0007b583          	ld	a1,0(a5)
    80002748:	0000a517          	auipc	a0,0xa
    8000274c:	49050513          	addi	a0,a0,1168 # 8000cbd8 <_ZN5Riscv15SleepingThreadsE>
    80002750:	00001097          	auipc	ra,0x1
    80002754:	cb4080e7          	jalr	-844(ra) # 80003404 <_ZN12SleepingList8add_nodeEP3TCBm>
                TCB::dispatch();
    80002758:	00000097          	auipc	ra,0x0
    8000275c:	1ec080e7          	jalr	492(ra) # 80002944 <_ZN3TCB8dispatchEv>
                break;
    80002760:	e35ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                char karakter = input_buffer->get();
    80002764:	0000a517          	auipc	a0,0xa
    80002768:	47c53503          	ld	a0,1148(a0) # 8000cbe0 <_ZN5Riscv12input_bufferE>
    8000276c:	00001097          	auipc	ra,0x1
    80002770:	108080e7          	jalr	264(ra) # 80003874 <_ZN7_Buffer3getEv>
                __asm__ volatile ("mv a0,%0" : :"r" (karakter));
    80002774:	00050513          	mv	a0,a0
                break;
    80002778:	e1dff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>
                karakter = (char)a1;
    8000277c:	fc843583          	ld	a1,-56(s0)
                output_buffer->put(karakter);
    80002780:	0ff5f593          	andi	a1,a1,255
    80002784:	0000a517          	auipc	a0,0xa
    80002788:	46453503          	ld	a0,1124(a0) # 8000cbe8 <_ZN5Riscv13output_bufferE>
    8000278c:	00001097          	auipc	ra,0x1
    80002790:	04c080e7          	jalr	76(ra) # 800037d8 <_ZN7_Buffer3putEc>
                break;
    80002794:	e01ff06f          	j	80002594 <_ZN5Riscv24supervisorsyscallHandlerEv+0x1e4>

0000000080002798 <_ZN5Riscv22supervisorTimerHandlerEv>:

void Riscv::supervisorTimerHandler()
{
    80002798:	fc010113          	addi	sp,sp,-64
    8000279c:	02113c23          	sd	ra,56(sp)
    800027a0:	02813823          	sd	s0,48(sp)
    800027a4:	02913423          	sd	s1,40(sp)
    800027a8:	04010413          	addi	s0,sp,64



    TCB::timeSliceCounter++;
    800027ac:	0000a497          	auipc	s1,0xa
    800027b0:	3844b483          	ld	s1,900(s1) # 8000cb30 <_GLOBAL_OFFSET_TABLE_+0x28>
    800027b4:	0004b783          	ld	a5,0(s1)
    800027b8:	00178793          	addi	a5,a5,1
    800027bc:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800027c0:	00200793          	li	a5,2
    800027c4:	1447b073          	csrc	sip,a5
    mc_sip(SIP_SSIP);

    SleepingThreads.otkucaj();
    800027c8:	0000a517          	auipc	a0,0xa
    800027cc:	41050513          	addi	a0,a0,1040 # 8000cbd8 <_ZN5Riscv15SleepingThreadsE>
    800027d0:	00001097          	auipc	ra,0x1
    800027d4:	e14080e7          	jalr	-492(ra) # 800035e4 <_ZN12SleepingList7otkucajEv>


    if (TCB::timeSliceCounter>=TCB::running->getTimeSlice())
    800027d8:	0000a797          	auipc	a5,0xa
    800027dc:	3887b783          	ld	a5,904(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x58>
    800027e0:	0007b783          	ld	a5,0(a5)

    void setStarted(bool value) { started = value; }



    uint64 getTimeSlice() const { return timeSlice; }
    800027e4:	0287b783          	ld	a5,40(a5)
    800027e8:	0004b703          	ld	a4,0(s1)
    800027ec:	00f77c63          	bgeu	a4,a5,80002804 <_ZN5Riscv22supervisorTimerHandlerEv+0x6c>
        Riscv::w_sstatus(sstatus);
    }



}
    800027f0:	03813083          	ld	ra,56(sp)
    800027f4:	03013403          	ld	s0,48(sp)
    800027f8:	02813483          	ld	s1,40(sp)
    800027fc:	04010113          	addi	sp,sp,64
    80002800:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002804:	141027f3          	csrr	a5,sepc
    80002808:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    8000280c:	fd843783          	ld	a5,-40(s0)
        uint64 volatile sepc = Riscv::r_sepc();
    80002810:	fcf43023          	sd	a5,-64(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002814:	100027f3          	csrr	a5,sstatus
    80002818:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    8000281c:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sstatus = Riscv::r_sstatus();
    80002820:	fcf43423          	sd	a5,-56(s0)
        TCB::dispatch();
    80002824:	00000097          	auipc	ra,0x0
    80002828:	120080e7          	jalr	288(ra) # 80002944 <_ZN3TCB8dispatchEv>
        Riscv::w_sepc(sepc);
    8000282c:	fc043783          	ld	a5,-64(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002830:	14179073          	csrw	sepc,a5
        Riscv::w_sstatus(sstatus);
    80002834:	fc843783          	ld	a5,-56(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002838:	10079073          	csrw	sstatus,a5
}
    8000283c:	fb5ff06f          	j	800027f0 <_ZN5Riscv22supervisorTimerHandlerEv+0x58>

0000000080002840 <_ZN5Riscv33supervisorOutsideInterruptHandlerEv>:




void Riscv::supervisorOutsideInterruptHandler()
{
    80002840:	fd010113          	addi	sp,sp,-48
    80002844:	02113423          	sd	ra,40(sp)
    80002848:	02813023          	sd	s0,32(sp)
    8000284c:	00913c23          	sd	s1,24(sp)
    80002850:	01213823          	sd	s2,16(sp)
    80002854:	03010413          	addi	s0,sp,48


  //Posto nam treba samo prvi bajt statusnog registra pretvoricemo ga u char
    int broj_prekida_uredjaja = plic_claim();
    80002858:	00005097          	auipc	ra,0x5
    8000285c:	ffc080e7          	jalr	-4(ra) # 80007854 <plic_claim>
    80002860:	00050493          	mv	s1,a0
    if (broj_prekida_uredjaja == (int)CONSOLE_IRQ)
    80002864:	00a00793          	li	a5,10
    80002868:	02f50463          	beq	a0,a5,80002890 <_ZN5Riscv33supervisorOutsideInterruptHandlerEv+0x50>
           if (Riscv::input_buffer->size<256)
                Riscv::input_buffer->put(c);
            status = *((char*)CONSOLE_STATUS);
        }
    }
    plic_complete(broj_prekida_uredjaja);
    8000286c:	00048513          	mv	a0,s1
    80002870:	00005097          	auipc	ra,0x5
    80002874:	01c080e7          	jalr	28(ra) # 8000788c <plic_complete>
    80002878:	02813083          	ld	ra,40(sp)
    8000287c:	02013403          	ld	s0,32(sp)
    80002880:	01813483          	ld	s1,24(sp)
    80002884:	01013903          	ld	s2,16(sp)
    80002888:	03010113          	addi	sp,sp,48
    8000288c:	00008067          	ret
        char volatile status = *((char*)CONSOLE_STATUS);
    80002890:	0000a797          	auipc	a5,0xa
    80002894:	2887b783          	ld	a5,648(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002898:	0007b903          	ld	s2,0(a5)
    8000289c:	00094783          	lbu	a5,0(s2)
    800028a0:	fcf40f23          	sb	a5,-34(s0)
    800028a4:	01c0006f          	j	800028c0 <_ZN5Riscv33supervisorOutsideInterruptHandlerEv+0x80>
                Riscv::input_buffer->put(c);
    800028a8:	fdf44583          	lbu	a1,-33(s0)
    800028ac:	0ff5f593          	andi	a1,a1,255
    800028b0:	00001097          	auipc	ra,0x1
    800028b4:	f28080e7          	jalr	-216(ra) # 800037d8 <_ZN7_Buffer3putEc>
            status = *((char*)CONSOLE_STATUS);
    800028b8:	00094783          	lbu	a5,0(s2)
    800028bc:	fcf40f23          	sb	a5,-34(s0)
        while (status & CONSOLE_RX_STATUS_BIT){
    800028c0:	fde44783          	lbu	a5,-34(s0)
    800028c4:	0017f793          	andi	a5,a5,1
    800028c8:	fa0782e3          	beqz	a5,8000286c <_ZN5Riscv33supervisorOutsideInterruptHandlerEv+0x2c>
            char  volatile c = *(char*)CONSOLE_RX_DATA;
    800028cc:	0000a797          	auipc	a5,0xa
    800028d0:	2447b783          	ld	a5,580(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x8>
    800028d4:	0007b783          	ld	a5,0(a5)
    800028d8:	0007c783          	lbu	a5,0(a5)
    800028dc:	fcf40fa3          	sb	a5,-33(s0)
           if (Riscv::input_buffer->size<256)
    800028e0:	0000a517          	auipc	a0,0xa
    800028e4:	30053503          	ld	a0,768(a0) # 8000cbe0 <_ZN5Riscv12input_bufferE>
    800028e8:	00852703          	lw	a4,8(a0)
    800028ec:	0ff00793          	li	a5,255
    800028f0:	fce7c4e3          	blt	a5,a4,800028b8 <_ZN5Riscv33supervisorOutsideInterruptHandlerEv+0x78>
    800028f4:	fb5ff06f          	j	800028a8 <_ZN5Riscv33supervisorOutsideInterruptHandlerEv+0x68>

00000000800028f8 <_ZN3TCB13threadWrapperEv>:
    Riscv::setThreadMode();
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper()
{
    800028f8:	ff010113          	addi	sp,sp,-16
    800028fc:	00113423          	sd	ra,8(sp)
    80002900:	00813023          	sd	s0,0(sp)
    80002904:	01010413          	addi	s0,sp,16
    Riscv::setThreadMode();
    80002908:	00000097          	auipc	ra,0x0
    8000290c:	a68080e7          	jalr	-1432(ra) # 80002370 <_ZN5Riscv13setThreadModeEv>
    Riscv::popSppSpie();
    80002910:	00000097          	auipc	ra,0x0
    80002914:	a40080e7          	jalr	-1472(ra) # 80002350 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80002918:	0000a797          	auipc	a5,0xa
    8000291c:	2d87b783          	ld	a5,728(a5) # 8000cbf0 <_ZN3TCB7runningE>
    80002920:	0007b703          	ld	a4,0(a5)
    80002924:	0087b503          	ld	a0,8(a5)
    80002928:	000700e7          	jalr	a4
    thread_exit();
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	a78080e7          	jalr	-1416(ra) # 800013a4 <_Z11thread_exitv>
}
    80002934:	00813083          	ld	ra,8(sp)
    80002938:	00013403          	ld	s0,0(sp)
    8000293c:	01010113          	addi	sp,sp,16
    80002940:	00008067          	ret

0000000080002944 <_ZN3TCB8dispatchEv>:
{
    80002944:	fe010113          	addi	sp,sp,-32
    80002948:	00113c23          	sd	ra,24(sp)
    8000294c:	00813823          	sd	s0,16(sp)
    80002950:	00913423          	sd	s1,8(sp)
    80002954:	02010413          	addi	s0,sp,32
    TCB::timeSliceCounter=0; // reset za vreme zauzetosti jedne niti
    80002958:	0000a797          	auipc	a5,0xa
    8000295c:	29878793          	addi	a5,a5,664 # 8000cbf0 <_ZN3TCB7runningE>
    80002960:	0007b423          	sd	zero,8(a5)
    TCB *old = running;
    80002964:	0007b483          	ld	s1,0(a5)

    ~TCB() {
        delete[] stack;
        }

    bool isFinished() const { return finished; }
    80002968:	0304c783          	lbu	a5,48(s1)
    if (!old->isFinished() && !old->isBlocked() && old->started && old!=idle) { Scheduler::put(old); }
    8000296c:	02079663          	bnez	a5,80002998 <_ZN3TCB8dispatchEv+0x54>

    bool isBlocked() const { return blocked; }
    80002970:	0314c783          	lbu	a5,49(s1)
    80002974:	02079263          	bnez	a5,80002998 <_ZN3TCB8dispatchEv+0x54>
    80002978:	0324c783          	lbu	a5,50(s1)
    8000297c:	00078e63          	beqz	a5,80002998 <_ZN3TCB8dispatchEv+0x54>
    80002980:	0000a797          	auipc	a5,0xa
    80002984:	2807b783          	ld	a5,640(a5) # 8000cc00 <_ZN3TCB4idleE>
    80002988:	00978863          	beq	a5,s1,80002998 <_ZN3TCB8dispatchEv+0x54>
    8000298c:	00048513          	mv	a0,s1
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	424080e7          	jalr	1060(ra) # 80001db4 <_ZN9Scheduler3putEP3TCB>
    running = Scheduler::get();
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	3c8080e7          	jalr	968(ra) # 80001d60 <_ZN9Scheduler3getEv>
    800029a0:	0000a797          	auipc	a5,0xa
    800029a4:	24a7b823          	sd	a0,592(a5) # 8000cbf0 <_ZN3TCB7runningE>
    if (running== nullptr)running=idle;
    800029a8:	02050c63          	beqz	a0,800029e0 <_ZN3TCB8dispatchEv+0x9c>
    Riscv::setThreadMode();
    800029ac:	00000097          	auipc	ra,0x0
    800029b0:	9c4080e7          	jalr	-1596(ra) # 80002370 <_ZN5Riscv13setThreadModeEv>
    TCB::contextSwitch(&old->context, &running->context);
    800029b4:	0000a597          	auipc	a1,0xa
    800029b8:	23c5b583          	ld	a1,572(a1) # 8000cbf0 <_ZN3TCB7runningE>
    800029bc:	01858593          	addi	a1,a1,24
    800029c0:	01848513          	addi	a0,s1,24
    800029c4:	fffff097          	auipc	ra,0xfffff
    800029c8:	894080e7          	jalr	-1900(ra) # 80001258 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800029cc:	01813083          	ld	ra,24(sp)
    800029d0:	01013403          	ld	s0,16(sp)
    800029d4:	00813483          	ld	s1,8(sp)
    800029d8:	02010113          	addi	sp,sp,32
    800029dc:	00008067          	ret
    if (running== nullptr)running=idle;
    800029e0:	0000a797          	auipc	a5,0xa
    800029e4:	21078793          	addi	a5,a5,528 # 8000cbf0 <_ZN3TCB7runningE>
    800029e8:	0107b703          	ld	a4,16(a5)
    800029ec:	00e7b023          	sd	a4,0(a5)
    800029f0:	fbdff06f          	j	800029ac <_ZN3TCB8dispatchEv+0x68>

00000000800029f4 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    800029f4:	ff010113          	addi	sp,sp,-16
    800029f8:	00113423          	sd	ra,8(sp)
    800029fc:	00813023          	sd	s0,0(sp)
    80002a00:	01010413          	addi	s0,sp,16
    size_t block = size;
    if (block % MEM_BLOCK_SIZE==0)block=size/MEM_BLOCK_SIZE;
    80002a04:	03f57793          	andi	a5,a0,63
    80002a08:	02079063          	bnez	a5,80002a28 <_ZN3TCBnwEm+0x34>
    80002a0c:	00655513          	srli	a0,a0,0x6
    else block=(size/MEM_BLOCK_SIZE)+1;
    void* pointer = MemoryAllocator::mem_alloc(block);
    80002a10:	00000097          	auipc	ra,0x0
    80002a14:	6ac080e7          	jalr	1708(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    return pointer;
}
    80002a18:	00813083          	ld	ra,8(sp)
    80002a1c:	00013403          	ld	s0,0(sp)
    80002a20:	01010113          	addi	sp,sp,16
    80002a24:	00008067          	ret
    else block=(size/MEM_BLOCK_SIZE)+1;
    80002a28:	00655513          	srli	a0,a0,0x6
    80002a2c:	00150513          	addi	a0,a0,1
    80002a30:	fe1ff06f          	j	80002a10 <_ZN3TCBnwEm+0x1c>

0000000080002a34 <_ZN3TCB16createIdleThreadEPFvPvES0_Pmb>:
{
    80002a34:	fd010113          	addi	sp,sp,-48
    80002a38:	02113423          	sd	ra,40(sp)
    80002a3c:	02813023          	sd	s0,32(sp)
    80002a40:	00913c23          	sd	s1,24(sp)
    80002a44:	01213823          	sd	s2,16(sp)
    80002a48:	01313423          	sd	s3,8(sp)
    80002a4c:	01413023          	sd	s4,0(sp)
    80002a50:	03010413          	addi	s0,sp,48
    80002a54:	00050913          	mv	s2,a0
    80002a58:	00058a13          	mv	s4,a1
    80002a5c:	00060493          	mv	s1,a2
    80002a60:	00068993          	mv	s3,a3
    TCB* curr = new TCB(body,arg,stack,system_thread);
    80002a64:	04800513          	li	a0,72
    80002a68:	00000097          	auipc	ra,0x0
    80002a6c:	f8c080e7          	jalr	-116(ra) # 800029f4 <_ZN3TCBnwEm>

    TCB(Body body,void* a,uint64* stack_space, bool kernel_thread) :
            body(body),
            arg(a),
            stack(stack_space),
            timeSlice(DEFAULT_TIME_SLICE)
    80002a70:	01253023          	sd	s2,0(a0)
    80002a74:	01453423          	sd	s4,8(a0)
    80002a78:	00953823          	sd	s1,16(a0)
    80002a7c:	00200793          	li	a5,2
    80002a80:	02f53423          	sd	a5,40(a0)

            {
                finished=false;
    80002a84:	02050823          	sb	zero,48(a0)
                blocked=false;
    80002a88:	020508a3          	sb	zero,49(a0)
                started=true;
    80002a8c:	00100793          	li	a5,1
    80002a90:	02f50923          	sb	a5,50(a0)
                system_thread=kernel_thread;
    80002a94:	033509a3          	sb	s3,51(a0)
                next=nullptr;
    80002a98:	02053c23          	sd	zero,56(a0)
                blokirani_head=nullptr;
    80002a9c:	04053023          	sd	zero,64(a0)
                if (body!= nullptr)
    80002aa0:	02090e63          	beqz	s2,80002adc <_ZN3TCB16createIdleThreadEPFvPvES0_Pmb+0xa8>
                {
                    context = {(uint64) &threadWrapper,(uint64) &stack[DEFAULT_STACK_SIZE]};
    80002aa4:	00008637          	lui	a2,0x8
    80002aa8:	00c484b3          	add	s1,s1,a2
    80002aac:	00000797          	auipc	a5,0x0
    80002ab0:	e4c78793          	addi	a5,a5,-436 # 800028f8 <_ZN3TCB13threadWrapperEv>
    80002ab4:	00f53c23          	sd	a5,24(a0)
    80002ab8:	02953023          	sd	s1,32(a0)
}
    80002abc:	02813083          	ld	ra,40(sp)
    80002ac0:	02013403          	ld	s0,32(sp)
    80002ac4:	01813483          	ld	s1,24(sp)
    80002ac8:	01013903          	ld	s2,16(sp)
    80002acc:	00813983          	ld	s3,8(sp)
    80002ad0:	00013a03          	ld	s4,0(sp)
    80002ad4:	03010113          	addi	sp,sp,48
    80002ad8:	00008067          	ret
                }
                else
                {
                  context = {0,0};
    80002adc:	00053c23          	sd	zero,24(a0)
    80002ae0:	02053023          	sd	zero,32(a0)
    return curr;
    80002ae4:	fd9ff06f          	j	80002abc <_ZN3TCB16createIdleThreadEPFvPvES0_Pmb+0x88>

0000000080002ae8 <_ZN3TCB12createThreadEPFvPvES0_Pmb>:
{
    80002ae8:	fc010113          	addi	sp,sp,-64
    80002aec:	02113c23          	sd	ra,56(sp)
    80002af0:	02813823          	sd	s0,48(sp)
    80002af4:	02913423          	sd	s1,40(sp)
    80002af8:	03213023          	sd	s2,32(sp)
    80002afc:	01313c23          	sd	s3,24(sp)
    80002b00:	01413823          	sd	s4,16(sp)
    80002b04:	01513423          	sd	s5,8(sp)
    80002b08:	04010413          	addi	s0,sp,64
    80002b0c:	00050993          	mv	s3,a0
    80002b10:	00058a93          	mv	s5,a1
    80002b14:	00060913          	mv	s2,a2
    80002b18:	00068a13          	mv	s4,a3
    TCB* curr = new TCB(body,arg,stack,system_thread);
    80002b1c:	04800513          	li	a0,72
    80002b20:	00000097          	auipc	ra,0x0
    80002b24:	ed4080e7          	jalr	-300(ra) # 800029f4 <_ZN3TCBnwEm>
    80002b28:	00050493          	mv	s1,a0
            timeSlice(DEFAULT_TIME_SLICE)
    80002b2c:	01353023          	sd	s3,0(a0)
    80002b30:	01553423          	sd	s5,8(a0)
    80002b34:	01253823          	sd	s2,16(a0)
    80002b38:	00200793          	li	a5,2
    80002b3c:	02f53423          	sd	a5,40(a0)
                finished=false;
    80002b40:	02050823          	sb	zero,48(a0)
                blocked=false;
    80002b44:	020508a3          	sb	zero,49(a0)
                started=true;
    80002b48:	00100793          	li	a5,1
    80002b4c:	02f50923          	sb	a5,50(a0)
                system_thread=kernel_thread;
    80002b50:	034509a3          	sb	s4,51(a0)
                next=nullptr;
    80002b54:	02053c23          	sd	zero,56(a0)
                blokirani_head=nullptr;
    80002b58:	04053023          	sd	zero,64(a0)
                if (body!= nullptr)
    80002b5c:	04098a63          	beqz	s3,80002bb0 <_ZN3TCB12createThreadEPFvPvES0_Pmb+0xc8>
                    context = {(uint64) &threadWrapper,(uint64) &stack[DEFAULT_STACK_SIZE]};
    80002b60:	00008637          	lui	a2,0x8
    80002b64:	00c90933          	add	s2,s2,a2
    80002b68:	00000797          	auipc	a5,0x0
    80002b6c:	d9078793          	addi	a5,a5,-624 # 800028f8 <_ZN3TCB13threadWrapperEv>
    80002b70:	00f53c23          	sd	a5,24(a0)
    80002b74:	03253023          	sd	s2,32(a0)
    if (curr->body!= nullptr){Scheduler::put(curr);}
    80002b78:	00098863          	beqz	s3,80002b88 <_ZN3TCB12createThreadEPFvPvES0_Pmb+0xa0>
    80002b7c:	00048513          	mv	a0,s1
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	234080e7          	jalr	564(ra) # 80001db4 <_ZN9Scheduler3putEP3TCB>
}
    80002b88:	00048513          	mv	a0,s1
    80002b8c:	03813083          	ld	ra,56(sp)
    80002b90:	03013403          	ld	s0,48(sp)
    80002b94:	02813483          	ld	s1,40(sp)
    80002b98:	02013903          	ld	s2,32(sp)
    80002b9c:	01813983          	ld	s3,24(sp)
    80002ba0:	01013a03          	ld	s4,16(sp)
    80002ba4:	00813a83          	ld	s5,8(sp)
    80002ba8:	04010113          	addi	sp,sp,64
    80002bac:	00008067          	ret
                  context = {0,0};
    80002bb0:	00053c23          	sd	zero,24(a0)
    80002bb4:	02053023          	sd	zero,32(a0)
    80002bb8:	fc1ff06f          	j	80002b78 <_ZN3TCB12createThreadEPFvPvES0_Pmb+0x90>

0000000080002bbc <_ZN3TCBdlEPv>:


void TCB::operator delete(void *adress) {
    80002bbc:	ff010113          	addi	sp,sp,-16
    80002bc0:	00113423          	sd	ra,8(sp)
    80002bc4:	00813023          	sd	s0,0(sp)
    80002bc8:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(adress);
    80002bcc:	00000097          	auipc	ra,0x0
    80002bd0:	63c080e7          	jalr	1596(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80002bd4:	00813083          	ld	ra,8(sp)
    80002bd8:	00013403          	ld	s0,0(sp)
    80002bdc:	01010113          	addi	sp,sp,16
    80002be0:	00008067          	ret

0000000080002be4 <_ZN3TCB11add_blockedEPS_>:

    dispatch();
    return 0;
}

void TCB::add_blocked(TCB* thread) {
    80002be4:	ff010113          	addi	sp,sp,-16
    80002be8:	00813423          	sd	s0,8(sp)
    80002bec:	01010413          	addi	s0,sp,16
    TCB* curr = blokirani_head;
    80002bf0:	04053783          	ld	a5,64(a0)
    if (curr== nullptr)
    80002bf4:	02078063          	beqz	a5,80002c14 <_ZN3TCB11add_blockedEPS_+0x30>
    {
        blokirani_head=thread;
    }
    else
    {
        while (curr->next!= nullptr)
    80002bf8:	00078713          	mv	a4,a5
    80002bfc:	0387b783          	ld	a5,56(a5)
    80002c00:	fe079ce3          	bnez	a5,80002bf8 <_ZN3TCB11add_blockedEPS_+0x14>
        {
            curr = curr->next;
        }
        curr->next=thread;
    80002c04:	02b73c23          	sd	a1,56(a4)
    }

}
    80002c08:	00813403          	ld	s0,8(sp)
    80002c0c:	01010113          	addi	sp,sp,16
    80002c10:	00008067          	ret
        blokirani_head=thread;
    80002c14:	04b53023          	sd	a1,64(a0)
    80002c18:	ff1ff06f          	j	80002c08 <_ZN3TCB11add_blockedEPS_+0x24>

0000000080002c1c <_ZN3TCB4joinEPS_>:
    bool isFinished() const { return finished; }
    80002c1c:	0305c703          	lbu	a4,48(a1)
    if (!handle->isFinished()) {
    80002c20:	00070463          	beqz	a4,80002c28 <_ZN3TCB4joinEPS_+0xc>
    80002c24:	00008067          	ret
void TCB::join(TCB *handle) {
    80002c28:	ff010113          	addi	sp,sp,-16
    80002c2c:	00113423          	sd	ra,8(sp)
    80002c30:	00813023          	sd	s0,0(sp)
    80002c34:	01010413          	addi	s0,sp,16
    80002c38:	00050793          	mv	a5,a0
    80002c3c:	00058513          	mv	a0,a1
    void setBlocked (bool value) { blocked=value; }
    80002c40:	00100713          	li	a4,1
    80002c44:	02e788a3          	sb	a4,49(a5)
        handle->add_blocked(TCB::running);
    80002c48:	0000a597          	auipc	a1,0xa
    80002c4c:	fa85b583          	ld	a1,-88(a1) # 8000cbf0 <_ZN3TCB7runningE>
    80002c50:	00000097          	auipc	ra,0x0
    80002c54:	f94080e7          	jalr	-108(ra) # 80002be4 <_ZN3TCB11add_blockedEPS_>
        dispatch();
    80002c58:	00000097          	auipc	ra,0x0
    80002c5c:	cec080e7          	jalr	-788(ra) # 80002944 <_ZN3TCB8dispatchEv>
}
    80002c60:	00813083          	ld	ra,8(sp)
    80002c64:	00013403          	ld	s0,0(sp)
    80002c68:	01010113          	addi	sp,sp,16
    80002c6c:	00008067          	ret

0000000080002c70 <_ZN3TCB14remove_blockedEv>:

TCB* TCB::remove_blocked()
{
    80002c70:	ff010113          	addi	sp,sp,-16
    80002c74:	00813423          	sd	s0,8(sp)
    80002c78:	01010413          	addi	s0,sp,16
    80002c7c:	00050793          	mv	a5,a0
    TCB* curr = blokirani_head;
    80002c80:	04053503          	ld	a0,64(a0)
    if (curr== nullptr)return nullptr;
    80002c84:	00050863          	beqz	a0,80002c94 <_ZN3TCB14remove_blockedEv+0x24>
    blokirani_head = blokirani_head->next;
    80002c88:	03853703          	ld	a4,56(a0)
    80002c8c:	04e7b023          	sd	a4,64(a5)
    curr->next= nullptr;
    80002c90:	02053c23          	sd	zero,56(a0)
    return curr;
}
    80002c94:	00813403          	ld	s0,8(sp)
    80002c98:	01010113          	addi	sp,sp,16
    80002c9c:	00008067          	ret

0000000080002ca0 <_ZN3TCB4exitEv>:
    if (TCB::running->isFinished() || TCB::running==nullptr){return -1;}
    80002ca0:	0000a797          	auipc	a5,0xa
    80002ca4:	f507b783          	ld	a5,-176(a5) # 8000cbf0 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80002ca8:	0307c703          	lbu	a4,48(a5)
    80002cac:	06071063          	bnez	a4,80002d0c <_ZN3TCB4exitEv+0x6c>
    80002cb0:	06078263          	beqz	a5,80002d14 <_ZN3TCB4exitEv+0x74>
int TCB::exit() {
    80002cb4:	ff010113          	addi	sp,sp,-16
    80002cb8:	00113423          	sd	ra,8(sp)
    80002cbc:	00813023          	sd	s0,0(sp)
    80002cc0:	01010413          	addi	s0,sp,16
    void setFinished(bool value) { finished = value; }
    80002cc4:	00100713          	li	a4,1
    80002cc8:	02e78823          	sb	a4,48(a5)
        curr = TCB::running->remove_blocked();
    80002ccc:	0000a517          	auipc	a0,0xa
    80002cd0:	f2453503          	ld	a0,-220(a0) # 8000cbf0 <_ZN3TCB7runningE>
    80002cd4:	00000097          	auipc	ra,0x0
    80002cd8:	f9c080e7          	jalr	-100(ra) # 80002c70 <_ZN3TCB14remove_blockedEv>
        if (curr== nullptr)break;
    80002cdc:	00050a63          	beqz	a0,80002cf0 <_ZN3TCB4exitEv+0x50>
    void setBlocked (bool value) { blocked=value; }
    80002ce0:	020508a3          	sb	zero,49(a0)
        Scheduler::put(curr);
    80002ce4:	fffff097          	auipc	ra,0xfffff
    80002ce8:	0d0080e7          	jalr	208(ra) # 80001db4 <_ZN9Scheduler3putEP3TCB>
        curr = TCB::running->remove_blocked();
    80002cec:	fe1ff06f          	j	80002ccc <_ZN3TCB4exitEv+0x2c>
    dispatch();
    80002cf0:	00000097          	auipc	ra,0x0
    80002cf4:	c54080e7          	jalr	-940(ra) # 80002944 <_ZN3TCB8dispatchEv>
    return 0;
    80002cf8:	00000513          	li	a0,0
}
    80002cfc:	00813083          	ld	ra,8(sp)
    80002d00:	00013403          	ld	s0,0(sp)
    80002d04:	01010113          	addi	sp,sp,16
    80002d08:	00008067          	ret
    if (TCB::running->isFinished() || TCB::running==nullptr){return -1;}
    80002d0c:	fff00513          	li	a0,-1
    80002d10:	00008067          	ret
    80002d14:	fff00513          	li	a0,-1
}
    80002d18:	00008067          	ret

0000000080002d1c <_ZN3TCB5startEPS_>:
    bool isStarted() const { return started; }
    80002d1c:	0325c783          	lbu	a5,50(a1)

int TCB::start(TCB *handle)
{
    if (!handle->isStarted()) {
    80002d20:	02079e63          	bnez	a5,80002d5c <_ZN3TCB5startEPS_+0x40>
{
    80002d24:	ff010113          	addi	sp,sp,-16
    80002d28:	00113423          	sd	ra,8(sp)
    80002d2c:	00813023          	sd	s0,0(sp)
    80002d30:	01010413          	addi	s0,sp,16
    80002d34:	00058513          	mv	a0,a1
    void setStarted(bool value) { started = value; }
    80002d38:	00100793          	li	a5,1
    80002d3c:	02f58923          	sb	a5,50(a1)
        handle->setStarted(true);
        Scheduler::put(handle);
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	074080e7          	jalr	116(ra) # 80001db4 <_ZN9Scheduler3putEP3TCB>
        return 0;
    80002d48:	00000513          	li	a0,0
    }
    return -1;
}
    80002d4c:	00813083          	ld	ra,8(sp)
    80002d50:	00013403          	ld	s0,0(sp)
    80002d54:	01010113          	addi	sp,sp,16
    80002d58:	00008067          	ret
    return -1;
    80002d5c:	fff00513          	li	a0,-1
}
    80002d60:	00008067          	ret

0000000080002d64 <_ZN3TCB10makeThreadEPFvPvES0_Pmb>:

TCB *TCB::makeThread(TCB::Body body, void *arg, uint64 *stack, bool system_thread) {
    80002d64:	fd010113          	addi	sp,sp,-48
    80002d68:	02113423          	sd	ra,40(sp)
    80002d6c:	02813023          	sd	s0,32(sp)
    80002d70:	00913c23          	sd	s1,24(sp)
    80002d74:	01213823          	sd	s2,16(sp)
    80002d78:	01313423          	sd	s3,8(sp)
    80002d7c:	01413023          	sd	s4,0(sp)
    80002d80:	03010413          	addi	s0,sp,48
    80002d84:	00050913          	mv	s2,a0
    80002d88:	00058a13          	mv	s4,a1
    80002d8c:	00060493          	mv	s1,a2
    80002d90:	00068993          	mv	s3,a3
   TCB* curr = new TCB(body,arg,stack,system_thread);
    80002d94:	04800513          	li	a0,72
    80002d98:	00000097          	auipc	ra,0x0
    80002d9c:	c5c080e7          	jalr	-932(ra) # 800029f4 <_ZN3TCBnwEm>
            timeSlice(DEFAULT_TIME_SLICE)
    80002da0:	01253023          	sd	s2,0(a0)
    80002da4:	01453423          	sd	s4,8(a0)
    80002da8:	00953823          	sd	s1,16(a0)
    80002dac:	00200793          	li	a5,2
    80002db0:	02f53423          	sd	a5,40(a0)
                finished=false;
    80002db4:	02050823          	sb	zero,48(a0)
                blocked=false;
    80002db8:	020508a3          	sb	zero,49(a0)
                started=true;
    80002dbc:	00100793          	li	a5,1
    80002dc0:	02f50923          	sb	a5,50(a0)
                system_thread=kernel_thread;
    80002dc4:	033509a3          	sb	s3,51(a0)
                next=nullptr;
    80002dc8:	02053c23          	sd	zero,56(a0)
                blokirani_head=nullptr;
    80002dcc:	04053023          	sd	zero,64(a0)
                if (body!= nullptr)
    80002dd0:	04090063          	beqz	s2,80002e10 <_ZN3TCB10makeThreadEPFvPvES0_Pmb+0xac>
                    context = {(uint64) &threadWrapper,(uint64) &stack[DEFAULT_STACK_SIZE]};
    80002dd4:	00008637          	lui	a2,0x8
    80002dd8:	00c484b3          	add	s1,s1,a2
    80002ddc:	00000797          	auipc	a5,0x0
    80002de0:	b1c78793          	addi	a5,a5,-1252 # 800028f8 <_ZN3TCB13threadWrapperEv>
    80002de4:	00f53c23          	sd	a5,24(a0)
    80002de8:	02953023          	sd	s1,32(a0)
    void setStarted(bool value) { started = value; }
    80002dec:	02050923          	sb	zero,50(a0)
    curr->setStarted(false);
    return curr;
}
    80002df0:	02813083          	ld	ra,40(sp)
    80002df4:	02013403          	ld	s0,32(sp)
    80002df8:	01813483          	ld	s1,24(sp)
    80002dfc:	01013903          	ld	s2,16(sp)
    80002e00:	00813983          	ld	s3,8(sp)
    80002e04:	00013a03          	ld	s4,0(sp)
    80002e08:	03010113          	addi	sp,sp,48
    80002e0c:	00008067          	ret
                  context = {0,0};
    80002e10:	00053c23          	sd	zero,24(a0)
    80002e14:	02053023          	sd	zero,32(a0)
    80002e18:	fd5ff06f          	j	80002dec <_ZN3TCB10makeThreadEPFvPvES0_Pmb+0x88>

0000000080002e1c <_ZN4_semdlEPv>:
#include "../h/_sem.hpp"




void _sem::operator delete(void *adress) {
    80002e1c:	ff010113          	addi	sp,sp,-16
    80002e20:	00113423          	sd	ra,8(sp)
    80002e24:	00813023          	sd	s0,0(sp)
    80002e28:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(adress);
    80002e2c:	00000097          	auipc	ra,0x0
    80002e30:	3dc080e7          	jalr	988(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80002e34:	00813083          	ld	ra,8(sp)
    80002e38:	00013403          	ld	s0,0(sp)
    80002e3c:	01010113          	addi	sp,sp,16
    80002e40:	00008067          	ret

0000000080002e44 <_ZN4_semnwEm>:



void *_sem::operator new(size_t size) {
    80002e44:	ff010113          	addi	sp,sp,-16
    80002e48:	00113423          	sd	ra,8(sp)
    80002e4c:	00813023          	sd	s0,0(sp)
    80002e50:	01010413          	addi	s0,sp,16



   size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    80002e54:	03f50513          	addi	a0,a0,63
    void* pointer = MemoryAllocator::mem_alloc(block);
    80002e58:	00655513          	srli	a0,a0,0x6
    80002e5c:	00000097          	auipc	ra,0x0
    80002e60:	260080e7          	jalr	608(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    return pointer;
}
    80002e64:	00813083          	ld	ra,8(sp)
    80002e68:	00013403          	ld	s0,0(sp)
    80002e6c:	01010113          	addi	sp,sp,16
    80002e70:	00008067          	ret

0000000080002e74 <_ZN4_sem10add_threadEP3TCB>:
    }
    if (this->finished){return -1;}
    else return 0;
}

void _sem::add_thread(TCB *nit) {
    80002e74:	ff010113          	addi	sp,sp,-16
    80002e78:	00813423          	sd	s0,8(sp)
    80002e7c:	01010413          	addi	s0,sp,16

    if (waiting_head== nullptr)
    80002e80:	00853783          	ld	a5,8(a0)
    80002e84:	02078063          	beqz	a5,80002ea4 <_ZN4_sem10add_threadEP3TCB+0x30>
        tail=nit;
        nit->next= nullptr;
    }
    else
    {
        tail->next=nit;
    80002e88:	01053783          	ld	a5,16(a0)
    80002e8c:	02b7bc23          	sd	a1,56(a5)
        tail=nit;
    80002e90:	00b53823          	sd	a1,16(a0)
        nit->next= nullptr;
    80002e94:	0205bc23          	sd	zero,56(a1)

    }

}
    80002e98:	00813403          	ld	s0,8(sp)
    80002e9c:	01010113          	addi	sp,sp,16
    80002ea0:	00008067          	ret
        waiting_head=nit;
    80002ea4:	00b53423          	sd	a1,8(a0)
        tail=nit;
    80002ea8:	00b53823          	sd	a1,16(a0)
        nit->next= nullptr;
    80002eac:	0205bc23          	sd	zero,56(a1)
    80002eb0:	fe9ff06f          	j	80002e98 <_ZN4_sem10add_threadEP3TCB+0x24>

0000000080002eb4 <_ZN4_sem4waitEv>:
    if (this->finished){return -1;}
    80002eb4:	00454783          	lbu	a5,4(a0)
    80002eb8:	08079063          	bnez	a5,80002f38 <_ZN4_sem4waitEv+0x84>
int _sem::wait() {
    80002ebc:	fe010113          	addi	sp,sp,-32
    80002ec0:	00113c23          	sd	ra,24(sp)
    80002ec4:	00813823          	sd	s0,16(sp)
    80002ec8:	00913423          	sd	s1,8(sp)
    80002ecc:	02010413          	addi	s0,sp,32
    80002ed0:	00050493          	mv	s1,a0
        if (--val<0)
    80002ed4:	00052783          	lw	a5,0(a0)
    80002ed8:	fff7879b          	addiw	a5,a5,-1
    80002edc:	00f52023          	sw	a5,0(a0)
    80002ee0:	02079713          	slli	a4,a5,0x20
    80002ee4:	02074263          	bltz	a4,80002f08 <_ZN4_sem4waitEv+0x54>
    if (this->finished){return -1;}
    80002ee8:	0044c783          	lbu	a5,4(s1)
    80002eec:	04079263          	bnez	a5,80002f30 <_ZN4_sem4waitEv+0x7c>
    else return 0;
    80002ef0:	00000513          	li	a0,0
}
    80002ef4:	01813083          	ld	ra,24(sp)
    80002ef8:	01013403          	ld	s0,16(sp)
    80002efc:	00813483          	ld	s1,8(sp)
    80002f00:	02010113          	addi	sp,sp,32
    80002f04:	00008067          	ret
            TCB::running->blocked= true;
    80002f08:	0000a797          	auipc	a5,0xa
    80002f0c:	c587b783          	ld	a5,-936(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002f10:	0007b583          	ld	a1,0(a5)
    80002f14:	00100793          	li	a5,1
    80002f18:	02f588a3          	sb	a5,49(a1)
            add_thread(TCB::running);
    80002f1c:	00000097          	auipc	ra,0x0
    80002f20:	f58080e7          	jalr	-168(ra) # 80002e74 <_ZN4_sem10add_threadEP3TCB>
            TCB::dispatch();
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	a20080e7          	jalr	-1504(ra) # 80002944 <_ZN3TCB8dispatchEv>
    80002f2c:	fbdff06f          	j	80002ee8 <_ZN4_sem4waitEv+0x34>
    if (this->finished){return -1;}
    80002f30:	fff00513          	li	a0,-1
    80002f34:	fc1ff06f          	j	80002ef4 <_ZN4_sem4waitEv+0x40>
    if (this->finished){return -1;}
    80002f38:	fff00513          	li	a0,-1
}
    80002f3c:	00008067          	ret

0000000080002f40 <_ZN4_sem14release_threadEv>:

TCB *_sem::release_thread() {
    80002f40:	ff010113          	addi	sp,sp,-16
    80002f44:	00813423          	sd	s0,8(sp)
    80002f48:	01010413          	addi	s0,sp,16
    80002f4c:	00050793          	mv	a5,a0
    TCB* curr = waiting_head;
    80002f50:	00853503          	ld	a0,8(a0)
    if (curr== nullptr)return nullptr;
    80002f54:	00050a63          	beqz	a0,80002f68 <_ZN4_sem14release_threadEv+0x28>
    waiting_head = waiting_head->next;
    80002f58:	03853703          	ld	a4,56(a0)
    80002f5c:	00e7b423          	sd	a4,8(a5)
    if (waiting_head== nullptr)tail= nullptr;
    80002f60:	00070a63          	beqz	a4,80002f74 <_ZN4_sem14release_threadEv+0x34>
    curr->next= nullptr;
    80002f64:	02053c23          	sd	zero,56(a0)
    return curr;
}
    80002f68:	00813403          	ld	s0,8(sp)
    80002f6c:	01010113          	addi	sp,sp,16
    80002f70:	00008067          	ret
    if (waiting_head== nullptr)tail= nullptr;
    80002f74:	0007b823          	sd	zero,16(a5)
    80002f78:	fedff06f          	j	80002f64 <_ZN4_sem14release_threadEv+0x24>

0000000080002f7c <_ZN4_sem6signalEv>:

int _sem::signal() {
    if (this->finished)return -1;
    80002f7c:	00454783          	lbu	a5,4(a0)
    80002f80:	04079c63          	bnez	a5,80002fd8 <_ZN4_sem6signalEv+0x5c>
    if (++val<=0)
    80002f84:	00052783          	lw	a5,0(a0)
    80002f88:	0017879b          	addiw	a5,a5,1
    80002f8c:	0007871b          	sext.w	a4,a5
    80002f90:	00f52023          	sw	a5,0(a0)
    80002f94:	00e05663          	blez	a4,80002fa0 <_ZN4_sem6signalEv+0x24>
    {
        TCB* curr = release_thread();
        curr->setBlocked(false);
        Scheduler::put(curr);
    }
    return 0;
    80002f98:	00000513          	li	a0,0
}
    80002f9c:	00008067          	ret
int _sem::signal() {
    80002fa0:	ff010113          	addi	sp,sp,-16
    80002fa4:	00113423          	sd	ra,8(sp)
    80002fa8:	00813023          	sd	s0,0(sp)
    80002fac:	01010413          	addi	s0,sp,16
        TCB* curr = release_thread();
    80002fb0:	00000097          	auipc	ra,0x0
    80002fb4:	f90080e7          	jalr	-112(ra) # 80002f40 <_ZN4_sem14release_threadEv>
    void setBlocked (bool value) { blocked=value; }
    80002fb8:	020508a3          	sb	zero,49(a0)
        Scheduler::put(curr);
    80002fbc:	fffff097          	auipc	ra,0xfffff
    80002fc0:	df8080e7          	jalr	-520(ra) # 80001db4 <_ZN9Scheduler3putEP3TCB>
    return 0;
    80002fc4:	00000513          	li	a0,0
}
    80002fc8:	00813083          	ld	ra,8(sp)
    80002fcc:	00013403          	ld	s0,0(sp)
    80002fd0:	01010113          	addi	sp,sp,16
    80002fd4:	00008067          	ret
    if (this->finished)return -1;
    80002fd8:	fff00513          	li	a0,-1
    80002fdc:	00008067          	ret

0000000080002fe0 <_ZN4_sem5closeEv>:

int _sem::close() {
    if (finished)return -1;
    80002fe0:	00454783          	lbu	a5,4(a0)
    80002fe4:	06079063          	bnez	a5,80003044 <_ZN4_sem5closeEv+0x64>
int _sem::close() {
    80002fe8:	fe010113          	addi	sp,sp,-32
    80002fec:	00113c23          	sd	ra,24(sp)
    80002ff0:	00813823          	sd	s0,16(sp)
    80002ff4:	00913423          	sd	s1,8(sp)
    80002ff8:	02010413          	addi	s0,sp,32
    80002ffc:	00050493          	mv	s1,a0
    finished=true;
    80003000:	00100793          	li	a5,1
    80003004:	00f50223          	sb	a5,4(a0)
    val = 0;
    80003008:	00052023          	sw	zero,0(a0)
    8000300c:	0100006f          	j	8000301c <_ZN4_sem5closeEv+0x3c>
    80003010:	020508a3          	sb	zero,49(a0)
    while (true)
    {
        TCB* curr = release_thread();
        if (curr== nullptr)break;
        curr->setBlocked(false);
        Scheduler::put(curr);
    80003014:	fffff097          	auipc	ra,0xfffff
    80003018:	da0080e7          	jalr	-608(ra) # 80001db4 <_ZN9Scheduler3putEP3TCB>
        TCB* curr = release_thread();
    8000301c:	00048513          	mv	a0,s1
    80003020:	00000097          	auipc	ra,0x0
    80003024:	f20080e7          	jalr	-224(ra) # 80002f40 <_ZN4_sem14release_threadEv>
        if (curr== nullptr)break;
    80003028:	fe0514e3          	bnez	a0,80003010 <_ZN4_sem5closeEv+0x30>
    }
    return 0;
    8000302c:	00000513          	li	a0,0
}
    80003030:	01813083          	ld	ra,24(sp)
    80003034:	01013403          	ld	s0,16(sp)
    80003038:	00813483          	ld	s1,8(sp)
    8000303c:	02010113          	addi	sp,sp,32
    80003040:	00008067          	ret
    if (finished)return -1;
    80003044:	fff00513          	li	a0,-1
}
    80003048:	00008067          	ret

000000008000304c <_ZN4_semD1Ev>:

_sem::~_sem() {
    8000304c:	ff010113          	addi	sp,sp,-16
    80003050:	00113423          	sd	ra,8(sp)
    80003054:	00813023          	sd	s0,0(sp)
    80003058:	01010413          	addi	s0,sp,16
    this->close();
    8000305c:	00000097          	auipc	ra,0x0
    80003060:	f84080e7          	jalr	-124(ra) # 80002fe0 <_ZN4_sem5closeEv>
}
    80003064:	00813083          	ld	ra,8(sp)
    80003068:	00013403          	ld	s0,0(sp)
    8000306c:	01010113          	addi	sp,sp,16
    80003070:	00008067          	ret

0000000080003074 <_ZN4_sem15createSemaphoreEj>:


_sem* _sem::createSemaphore(unsigned init) {
    80003074:	fe010113          	addi	sp,sp,-32
    80003078:	00113c23          	sd	ra,24(sp)
    8000307c:	00813823          	sd	s0,16(sp)
    80003080:	00913423          	sd	s1,8(sp)
    80003084:	02010413          	addi	s0,sp,32
    80003088:	00050493          	mv	s1,a0
    _sem* curr = new _sem(init);
    8000308c:	01800513          	li	a0,24
    80003090:	00000097          	auipc	ra,0x0
    80003094:	db4080e7          	jalr	-588(ra) # 80002e44 <_ZN4_semnwEm>
    bool finished;
    TCB* waiting_head;
    TCB* tail;


    _sem(unsigned init):finished(false),waiting_head(nullptr),tail(nullptr){};
    80003098:	00050223          	sb	zero,4(a0)
    8000309c:	00053423          	sd	zero,8(a0)
    800030a0:	00053823          	sd	zero,16(a0)
    curr->val=(int)init;
    800030a4:	00952023          	sw	s1,0(a0)
    return curr;
}
    800030a8:	01813083          	ld	ra,24(sp)
    800030ac:	01013403          	ld	s0,16(sp)
    800030b0:	00813483          	ld	s1,8(sp)
    800030b4:	02010113          	addi	sp,sp,32
    800030b8:	00008067          	ret

00000000800030bc <_ZN15MemoryAllocator9mem_allocEm>:
MemoryAllocator::UsedSegment* MemoryAllocator::used_head = nullptr;

void* MemoryAllocator::starting_adress = nullptr;
void* MemoryAllocator::ending_adress = nullptr;

void *MemoryAllocator::mem_alloc(size_t size) {
    800030bc:	ff010113          	addi	sp,sp,-16
    800030c0:	00813423          	sd	s0,8(sp)
    800030c4:	01010413          	addi	s0,sp,16
    //Velicina za alokaciju
    size_t size_of_blocks = size*MEM_BLOCK_SIZE;

    if (size<=0) return nullptr;
    800030c8:	12050c63          	beqz	a0,80003200 <_ZN15MemoryAllocator9mem_allocEm+0x144>
    800030cc:	00651713          	slli	a4,a0,0x6
    if (initialized == false)
    800030d0:	0000a797          	auipc	a5,0xa
    800030d4:	b407c783          	lbu	a5,-1216(a5) # 8000cc10 <_ZN15MemoryAllocator11initializedE>
    800030d8:	06079463          	bnez	a5,80003140 <_ZN15MemoryAllocator9mem_allocEm+0x84>
    {
        // Pocetna inicijalizacija!

        initialized=true;
    800030dc:	0000a697          	auipc	a3,0xa
    800030e0:	b3468693          	addi	a3,a3,-1228 # 8000cc10 <_ZN15MemoryAllocator11initializedE>
    800030e4:	00100793          	li	a5,1
    800030e8:	00f68023          	sb	a5,0(a3)
        //Pocetna adresa poravnata
        starting_adress = (void*)(((uint64) (HEAP_START_ADDR) /MEM_BLOCK_SIZE + 1)*MEM_BLOCK_SIZE);
    800030ec:	0000a797          	auipc	a5,0xa
    800030f0:	a347b783          	ld	a5,-1484(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x18>
    800030f4:	0007b783          	ld	a5,0(a5)
    800030f8:	0067d793          	srli	a5,a5,0x6
    800030fc:	00178793          	addi	a5,a5,1
    80003100:	00679793          	slli	a5,a5,0x6
    80003104:	00f6b423          	sd	a5,8(a3)
        //Krajnja adresa poravnata
        ending_adress = (void*)(((uint64) (HEAP_END_ADDR) / (uint64)MEM_BLOCK_SIZE)*(uint64)MEM_BLOCK_SIZE);
    80003108:	0000a617          	auipc	a2,0xa
    8000310c:	a6063603          	ld	a2,-1440(a2) # 8000cb68 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003110:	00063603          	ld	a2,0(a2)
    80003114:	fc067613          	andi	a2,a2,-64
    80003118:	00c6b823          	sd	a2,16(a3)
        free_head = (FreeSegment*)((uint64)starting_adress);
    8000311c:	00f6bc23          	sd	a5,24(a3)
        free_head->next= nullptr;
    80003120:	0007b023          	sd	zero,0(a5)
        free_head->prev= nullptr;
    80003124:	0186b603          	ld	a2,24(a3)
    80003128:	00063423          	sd	zero,8(a2)

         void* a = starting_adress;
    8000312c:	0086b583          	ld	a1,8(a3)
         void* b = ending_adress;
    80003130:	0106b783          	ld	a5,16(a3)


        // Pamti se velicina slobodnog prostora bez sizeof(FreeSegment) za koji je alociran jedan MEM_BLOCK_SIZE zbog poravnjanja u svim slobodnim segmentima
        // odnosno za svaku strukturu FreeSegment odnosno UsedSegment se uzima jedan MEM_BLOCK_SIZE zbog poravnanja!

        free_head->size = (size_t)((uint64)ending_adress - (uint64)starting_adress) - MEM_BLOCK_SIZE;
    80003134:	40b787b3          	sub	a5,a5,a1
    80003138:	fc078793          	addi	a5,a5,-64
    8000313c:	00f63823          	sd	a5,16(a2)
    }
    
        // First-fit algoritam

        FreeSegment* current = free_head;
    80003140:	0000a517          	auipc	a0,0xa
    80003144:	ae853503          	ld	a0,-1304(a0) # 8000cc28 <_ZN15MemoryAllocator9free_headE>
    80003148:	05c0006f          	j	800031a4 <_ZN15MemoryAllocator9mem_allocEm+0xe8>
        while (current)
        {
            if (current->size>size_of_blocks)
            {
                size_t remain = current->size-size_of_blocks - MEM_BLOCK_SIZE;
    8000314c:	40e787b3          	sub	a5,a5,a4
    80003150:	fc078793          	addi	a5,a5,-64

                //Uzimamo MEM_BLOCK_SIZE za zaglavlje zbog poravnjanja!


                uint64 adr = (uint64)( (uint64)current + (uint64)MEM_BLOCK_SIZE + (uint64)remain);
    80003154:	00f50633          	add	a2,a0,a5
    80003158:	04060693          	addi	a3,a2,64

                UsedSegment* novi = (UsedSegment*)adr;
                novi->next= used_head;
    8000315c:	0000a597          	auipc	a1,0xa
    80003160:	ad45b583          	ld	a1,-1324(a1) # 8000cc30 <_ZN15MemoryAllocator9used_headE>
    80003164:	04b63023          	sd	a1,64(a2)
                novi->prev= nullptr;
    80003168:	0006b423          	sd	zero,8(a3)
                novi->size=size_of_blocks;
    8000316c:	00e6b823          	sd	a4,16(a3)

                // Umanjujemo slobodni segment od kojeg koristimo memoriju za alokaciju.

                current->size = remain;
    80003170:	00f53823          	sd	a5,16(a0)

                //Ubacujemo novi korisceni segment u listu koriscenih segmenata
                // i to na pocetak liste zato sto pri mem_free ne moramo da imamo sortiranu listu koriscenih segmenata
                // jer svakako dobijamo segment koji smo alocirali uz pomoc mem_alloc

                if (used_head!= nullptr)
    80003174:	00058463          	beqz	a1,8000317c <_ZN15MemoryAllocator9mem_allocEm+0xc0>
                {
                    used_head->prev = novi;
    80003178:	00d5b423          	sd	a3,8(a1)
                }
                used_head = novi;
    8000317c:	0000a797          	auipc	a5,0xa
    80003180:	aad7ba23          	sd	a3,-1356(a5) # 8000cc30 <_ZN15MemoryAllocator9used_headE>
                uint64  br = ((uint64)(novi) + (uint64)MEM_BLOCK_SIZE);
    80003184:	08060513          	addi	a0,a2,128
            }
        }
        return nullptr;


}
    80003188:	00813403          	ld	s0,8(sp)
    8000318c:	01010113          	addi	sp,sp,16
    80003190:	00008067          	ret
                    free_head = current->next;
    80003194:	0000a617          	auipc	a2,0xa
    80003198:	a8f63a23          	sd	a5,-1388(a2) # 8000cc28 <_ZN15MemoryAllocator9free_headE>
    8000319c:	0280006f          	j	800031c4 <_ZN15MemoryAllocator9mem_allocEm+0x108>
                current = current->next;
    800031a0:	00053503          	ld	a0,0(a0)
        while (current)
    800031a4:	fe0502e3          	beqz	a0,80003188 <_ZN15MemoryAllocator9mem_allocEm+0xcc>
            if (current->size>size_of_blocks)
    800031a8:	01053783          	ld	a5,16(a0)
    800031ac:	faf760e3          	bltu	a4,a5,8000314c <_ZN15MemoryAllocator9mem_allocEm+0x90>
            else if (current->size==size_of_blocks)
    800031b0:	fee798e3          	bne	a5,a4,800031a0 <_ZN15MemoryAllocator9mem_allocEm+0xe4>
                FreeSegment* next_node = current->next;
    800031b4:	00053783          	ld	a5,0(a0)
                FreeSegment* prev_node = current->prev;
    800031b8:	00853683          	ld	a3,8(a0)
                if (prev_node== nullptr)
    800031bc:	fc068ce3          	beqz	a3,80003194 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
                    prev_node->next = next_node;
    800031c0:	00f6b023          	sd	a5,0(a3)
                if (next_node!= nullptr)
    800031c4:	00078463          	beqz	a5,800031cc <_ZN15MemoryAllocator9mem_allocEm+0x110>
                    next_node->prev=prev_node;
    800031c8:	00d7b423          	sd	a3,8(a5)
                novi->next= used_head;
    800031cc:	0000a797          	auipc	a5,0xa
    800031d0:	a4478793          	addi	a5,a5,-1468 # 8000cc10 <_ZN15MemoryAllocator11initializedE>
    800031d4:	0207b683          	ld	a3,32(a5)
    800031d8:	00d53023          	sd	a3,0(a0)
                novi->prev= nullptr;
    800031dc:	00053423          	sd	zero,8(a0)
                novi->size=size_of_blocks;
    800031e0:	00e53823          	sd	a4,16(a0)
                if (used_head!= nullptr)
    800031e4:	0207b783          	ld	a5,32(a5)
    800031e8:	00078463          	beqz	a5,800031f0 <_ZN15MemoryAllocator9mem_allocEm+0x134>
                    used_head->prev = novi;
    800031ec:	00a7b423          	sd	a0,8(a5)
                used_head = novi;
    800031f0:	0000a797          	auipc	a5,0xa
    800031f4:	a4a7b023          	sd	a0,-1472(a5) # 8000cc30 <_ZN15MemoryAllocator9used_headE>
                void* res = (void*)((uint64)(novi) + (uint64)MEM_BLOCK_SIZE);
    800031f8:	04050513          	addi	a0,a0,64
                return res;
    800031fc:	f8dff06f          	j	80003188 <_ZN15MemoryAllocator9mem_allocEm+0xcc>
    if (size<=0) return nullptr;
    80003200:	00000513          	li	a0,0
    80003204:	f85ff06f          	j	80003188 <_ZN15MemoryAllocator9mem_allocEm+0xcc>

0000000080003208 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr) {
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00813423          	sd	s0,8(sp)
    80003210:	01010413          	addi	s0,sp,16

    uint64  checker_adr = (uint64)((uint64)(starting_adress) + (uint64)(MEM_BLOCK_SIZE));
    80003214:	0000a717          	auipc	a4,0xa
    80003218:	9fc70713          	addi	a4,a4,-1540 # 8000cc10 <_ZN15MemoryAllocator11initializedE>
    8000321c:	00873783          	ld	a5,8(a4)

    // Provera ukoliko radimo mem_free pre nego sto smo bilo sta alocirali!
    if (initialized == false)return -4;
    80003220:	00074703          	lbu	a4,0(a4)
    80003224:	1a070463          	beqz	a4,800033cc <_ZN15MemoryAllocator8mem_freeEPv+0x1c4>
    80003228:	04078793          	addi	a5,a5,64

    // Posto mi dobijamo kao parametar adresu iza koje se nalazi struktura UsedSegment
    // onda mozemo da izvrsimo proveru ukoliko je adr kad se pomeri za velicinu pomenute strukture
    // iza HEAP_START_ADDR to je onda sigurno greska.

    if ((uint64)adr < checker_adr) return -1;
    8000322c:	1af56463          	bltu	a0,a5,800033d4 <_ZN15MemoryAllocator8mem_freeEPv+0x1cc>

    uint64 checker_end_adr = (uint64)ending_adress;
    80003230:	0000a797          	auipc	a5,0xa
    80003234:	9f07b783          	ld	a5,-1552(a5) # 8000cc20 <_ZN15MemoryAllocator13ending_adressE>

    // Naravno ukoliko je adresa van opsega date memorije i to je sigurno greska

    if ((uint64)adr >= checker_end_adr) return -2;
    80003238:	1af57263          	bgeu	a0,a5,800033dc <_ZN15MemoryAllocator8mem_freeEPv+0x1d4>

    //Pocetak trazenja segmenta koji je dat kao parametar!
    UsedSegment* current = used_head;
    8000323c:	0000a797          	auipc	a5,0xa
    80003240:	9f47b783          	ld	a5,-1548(a5) # 8000cc30 <_ZN15MemoryAllocator9used_headE>
    while (current)
    80003244:	1a078063          	beqz	a5,800033e4 <_ZN15MemoryAllocator8mem_freeEPv+0x1dc>
    {
        uint64 potential_adr = (uint64)(current) + (uint64)(MEM_BLOCK_SIZE);
    80003248:	00078613          	mv	a2,a5
    8000324c:	04078713          	addi	a4,a5,64
        if (potential_adr == (uint64)adr)
    80003250:	00e50663          	beq	a0,a4,8000325c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
            }


            return 0;
        }
        current=current->next;
    80003254:	0007b783          	ld	a5,0(a5)
    while (current)
    80003258:	fedff06f          	j	80003244 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
            UsedSegment* prev_used = current->prev;
    8000325c:	0087b683          	ld	a3,8(a5)
            UsedSegment* next_used = current->next;
    80003260:	0007b703          	ld	a4,0(a5)
            if (prev_used == nullptr)
    80003264:	02068c63          	beqz	a3,8000329c <_ZN15MemoryAllocator8mem_freeEPv+0x94>
                prev_used->next = next_used;
    80003268:	00e6b023          	sd	a4,0(a3)
            if (next_used!= nullptr)
    8000326c:	00070463          	beqz	a4,80003274 <_ZN15MemoryAllocator8mem_freeEPv+0x6c>
                next_used->prev = prev_used;
    80003270:	00d73423          	sd	a3,8(a4)
            new_free_segment->size=current->size;
    80003274:	0107b803          	ld	a6,16(a5)
            new_free_segment->next= nullptr;
    80003278:	0007b023          	sd	zero,0(a5)
            new_free_segment->prev= nullptr;
    8000327c:	0007b423          	sd	zero,8(a5)
            FreeSegment* tmp = free_head;
    80003280:	0000a717          	auipc	a4,0xa
    80003284:	9a873703          	ld	a4,-1624(a4) # 8000cc28 <_ZN15MemoryAllocator9free_headE>
            if (tmp== nullptr)
    80003288:	08071e63          	bnez	a4,80003324 <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
                free_head = new_free_segment;
    8000328c:	0000a717          	auipc	a4,0xa
    80003290:	98f73e23          	sd	a5,-1636(a4) # 8000cc28 <_ZN15MemoryAllocator9free_headE>
                return 0;
    80003294:	00000513          	li	a0,0
    80003298:	1500006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
                used_head = next_used;
    8000329c:	0000a597          	auipc	a1,0xa
    800032a0:	98e5ba23          	sd	a4,-1644(a1) # 8000cc30 <_ZN15MemoryAllocator9used_headE>
    800032a4:	fc9ff06f          	j	8000326c <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                        uint64 new_length = (uint64)(tmp->size) + (uint64) (MEM_BLOCK_SIZE) + (uint64)(new_free_segment->size);
    800032a8:	00a806b3          	add	a3,a6,a0
    800032ac:	04068693          	addi	a3,a3,64
                        tmp->size = (size_t)new_length;
    800032b0:	00d73823          	sd	a3,16(a4)
                        new_free_segment->size=(size_t) new_length;
    800032b4:	00d7b823          	sd	a3,16(a5)
                        new_free_segment->next=tmp->next;
    800032b8:	00073683          	ld	a3,0(a4)
    800032bc:	00d7b023          	sd	a3,0(a5)
                        new_free_segment->prev=tmp->prev;
    800032c0:	00873683          	ld	a3,8(a4)
    800032c4:	00d7b423          	sd	a3,8(a5)
                        FreeSegment* novi = tmp->next;
    800032c8:	00073783          	ld	a5,0(a4)
                        if (novi!= nullptr)
    800032cc:	12078863          	beqz	a5,800033fc <_ZN15MemoryAllocator8mem_freeEPv+0x1f4>
                            length = (uint64)(new_free_segment->size);
    800032d0:	01073683          	ld	a3,16(a4)
                            length = length + (uint64)(MEM_BLOCK_SIZE);
    800032d4:	04068613          	addi	a2,a3,64
                            if ((uint64) novi == new_free_segment_addr+length)
    800032d8:	00c705b3          	add	a1,a4,a2
    800032dc:	00f58a63          	beq	a1,a5,800032f0 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
                                novi->prev=new_free_segment;
    800032e0:	00e7b423          	sd	a4,8(a5)
                                new_free_segment->next=novi;
    800032e4:	00f73023          	sd	a5,0(a4)
                                return 0;
    800032e8:	00000513          	li	a0,0
    800032ec:	0fc0006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
                                uint64 new_length =  (uint64)(new_free_segment->size) + (uint64)novi->size + (uint64)MEM_BLOCK_SIZE;
    800032f0:	0107b603          	ld	a2,16(a5)
    800032f4:	00d606b3          	add	a3,a2,a3
    800032f8:	04068693          	addi	a3,a3,64
                                new_free_segment->size=new_length;
    800032fc:	00d73823          	sd	a3,16(a4)
                                if (novi->next!= nullptr)
    80003300:	0007b683          	ld	a3,0(a5)
    80003304:	00068463          	beqz	a3,8000330c <_ZN15MemoryAllocator8mem_freeEPv+0x104>
                                    novi->next->prev=new_free_segment;
    80003308:	00e6b423          	sd	a4,8(a3)
                                new_free_segment->next = novi->next;
    8000330c:	0007b783          	ld	a5,0(a5)
    80003310:	00f73023          	sd	a5,0(a4)
                                return 0;
    80003314:	00000513          	li	a0,0
    80003318:	0d00006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
                else if (start_adr>new_free_segment_addr)
    8000331c:	02d66c63          	bltu	a2,a3,80003354 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
                tmp=tmp->next;
    80003320:	00073703          	ld	a4,0(a4)
            while (tmp!= nullptr)
    80003324:	0c070863          	beqz	a4,800033f4 <_ZN15MemoryAllocator8mem_freeEPv+0x1ec>
                uint64 start_adr = (uint64) tmp + (uint64)(MEM_BLOCK_SIZE);
    80003328:	04070693          	addi	a3,a4,64
                if (start_adr<new_free_segment_addr)
    8000332c:	fec6f8e3          	bgeu	a3,a2,8000331c <_ZN15MemoryAllocator8mem_freeEPv+0x114>
                    uint64 length = (uint64)(tmp->size);
    80003330:	01073503          	ld	a0,16(a4)
                    if (length+start_adr==new_free_segment_addr)
    80003334:	00a686b3          	add	a3,a3,a0
    80003338:	f6d608e3          	beq	a2,a3,800032a8 <_ZN15MemoryAllocator8mem_freeEPv+0xa0>
                    else if (tmp->next== nullptr)
    8000333c:	00073683          	ld	a3,0(a4)
    80003340:	fe0690e3          	bnez	a3,80003320 <_ZN15MemoryAllocator8mem_freeEPv+0x118>
                        tmp->next=new_free_segment;
    80003344:	00f73023          	sd	a5,0(a4)
                        new_free_segment->prev=tmp;
    80003348:	00e7b423          	sd	a4,8(a5)
                        return 0;
    8000334c:	00000513          	li	a0,0
    80003350:	0980006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
                    length = length + (uint64)(MEM_BLOCK_SIZE);
    80003354:	04080693          	addi	a3,a6,64
                    FreeSegment* prev_node = tmp->prev;
    80003358:	00873503          	ld	a0,8(a4)
                    FreeSegment* next_node = tmp->next;
    8000335c:	00073883          	ld	a7,0(a4)
                        if ((uint64) tmp == new_free_segment_addr+length)
    80003360:	00d60633          	add	a2,a2,a3
    80003364:	02c70063          	beq	a4,a2,80003384 <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
                            if (prev_node== nullptr)
    80003368:	04050c63          	beqz	a0,800033c0 <_ZN15MemoryAllocator8mem_freeEPv+0x1b8>
                                prev_node->next=new_free_segment;
    8000336c:	00f53023          	sd	a5,0(a0)
                            tmp->prev=new_free_segment;
    80003370:	00f73423          	sd	a5,8(a4)
                            new_free_segment->prev=prev_node;
    80003374:	00a7b423          	sd	a0,8(a5)
                            new_free_segment->next=tmp;
    80003378:	00e7b023          	sd	a4,0(a5)
                            return 0;
    8000337c:	00000513          	li	a0,0
    80003380:	0680006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
                            uint64 new_length =  (uint64)(new_free_segment->size) + (uint64)tmp->size + (uint64)MEM_BLOCK_SIZE;
    80003384:	01073703          	ld	a4,16(a4)
    80003388:	00e80733          	add	a4,a6,a4
    8000338c:	04070713          	addi	a4,a4,64
                            new_free_segment->size=new_length;
    80003390:	00e7b823          	sd	a4,16(a5)
                            if (prev_node== nullptr)
    80003394:	02050063          	beqz	a0,800033b4 <_ZN15MemoryAllocator8mem_freeEPv+0x1ac>
                                prev_node->next=new_free_segment;
    80003398:	00f53023          	sd	a5,0(a0)
                            if (next_node!= nullptr)
    8000339c:	00088463          	beqz	a7,800033a4 <_ZN15MemoryAllocator8mem_freeEPv+0x19c>
                                next_node->prev=new_free_segment;
    800033a0:	00f8b423          	sd	a5,8(a7)
                            new_free_segment->prev=prev_node;
    800033a4:	00a7b423          	sd	a0,8(a5)
                            new_free_segment->next=next_node;
    800033a8:	0117b023          	sd	a7,0(a5)
                            return 0;
    800033ac:	00000513          	li	a0,0
    800033b0:	0380006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
                                free_head=new_free_segment;
    800033b4:	0000a717          	auipc	a4,0xa
    800033b8:	86f73a23          	sd	a5,-1932(a4) # 8000cc28 <_ZN15MemoryAllocator9free_headE>
    800033bc:	fe1ff06f          	j	8000339c <_ZN15MemoryAllocator8mem_freeEPv+0x194>
                                free_head=new_free_segment;
    800033c0:	0000a697          	auipc	a3,0xa
    800033c4:	86f6b423          	sd	a5,-1944(a3) # 8000cc28 <_ZN15MemoryAllocator9free_headE>
    800033c8:	fa9ff06f          	j	80003370 <_ZN15MemoryAllocator8mem_freeEPv+0x168>
    if (initialized == false)return -4;
    800033cc:	ffc00513          	li	a0,-4
    800033d0:	0180006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
    if ((uint64)adr < checker_adr) return -1;
    800033d4:	fff00513          	li	a0,-1
    800033d8:	0100006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
    if ((uint64)adr >= checker_end_adr) return -2;
    800033dc:	ffe00513          	li	a0,-2
    800033e0:	0080006f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
    }

    //Nije pronadjen korisceni segment!

    return -3;
    800033e4:	ffd00513          	li	a0,-3


}
    800033e8:	00813403          	ld	s0,8(sp)
    800033ec:	01010113          	addi	sp,sp,16
    800033f0:	00008067          	ret
            return 0;
    800033f4:	00000513          	li	a0,0
    800033f8:	ff1ff06f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>
                            return 0;
    800033fc:	00000513          	li	a0,0
    80003400:	fe9ff06f          	j	800033e8 <_ZN15MemoryAllocator8mem_freeEPv+0x1e0>

0000000080003404 <_ZN12SleepingList8add_nodeEP3TCBm>:

#include "../h/sleeping_list.hpp"
#include "../lib/console.h"
time_t SleepingList::First_remaining_time=0;

void SleepingList::add_node(TCB *thread, time_t vreme) {
    80003404:	fd010113          	addi	sp,sp,-48
    80003408:	02113423          	sd	ra,40(sp)
    8000340c:	02813023          	sd	s0,32(sp)
    80003410:	00913c23          	sd	s1,24(sp)
    80003414:	01213823          	sd	s2,16(sp)
    80003418:	01313423          	sd	s3,8(sp)
    8000341c:	03010413          	addi	s0,sp,48
    80003420:	00050993          	mv	s3,a0
    80003424:	00058913          	mv	s2,a1
    80003428:	00060493          	mv	s1,a2
        Elem* next;
        Elem(TCB* thread,time_t time,Elem* sledeci= nullptr):nit(thread),remaining_time(time),next(sledeci){}

        void *operator new(size_t size) {
            size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
            void* pointer = MemoryAllocator::mem_alloc(block);
    8000342c:	00100513          	li	a0,1
    80003430:	00000097          	auipc	ra,0x0
    80003434:	c8c080e7          	jalr	-884(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
        Elem(TCB* thread,time_t time,Elem* sledeci= nullptr):nit(thread),remaining_time(time),next(sledeci){}
    80003438:	01253023          	sd	s2,0(a0)
    8000343c:	00953423          	sd	s1,8(a0)
    80003440:	00053823          	sd	zero,16(a0)
    void setBlocked (bool value) { blocked=value; }
    80003444:	00100793          	li	a5,1
    80003448:	02f908a3          	sb	a5,49(s2)
    Elem* node = new Elem(thread,vreme);
    thread->setBlocked(true);   //Blokiranje niti, jer je stavljena na cekanje potrebnog vremena otkucaja tajmera!
    if (head== nullptr)
    8000344c:	0009b683          	ld	a3,0(s3)
    80003450:	02068a63          	beqz	a3,80003484 <_ZN12SleepingList8add_nodeEP3TCBm+0x80>
        First_remaining_time = vreme;
        node->remaining_time=0;
        node->next= nullptr;
        return;
    }
    if (First_remaining_time==vreme)
    80003454:	00009717          	auipc	a4,0x9
    80003458:	7e473703          	ld	a4,2020(a4) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>
    8000345c:	04970063          	beq	a4,s1,8000349c <_ZN12SleepingList8add_nodeEP3TCBm+0x98>
        First_remaining_time = vreme;
        node->remaining_time=0; // Za prvog u listi je 0 u odnosu na First_remaining_time!


    }
    else if (First_remaining_time>vreme)
    80003460:	06e4f863          	bgeu	s1,a4,800034d0 <_ZN12SleepingList8add_nodeEP3TCBm+0xcc>
    {
        // Ukoliko je vreme uspavljivanja manje od  trenutnog preostalog vremena prvog!
        node->next = head;
    80003464:	00d53823          	sd	a3,16(a0)
        head->remaining_time = First_remaining_time - vreme;
    80003468:	40970733          	sub	a4,a4,s1
    8000346c:	00e6b423          	sd	a4,8(a3)
        First_remaining_time = vreme;
    80003470:	00009797          	auipc	a5,0x9
    80003474:	7c97b423          	sd	s1,1992(a5) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>
        node->remaining_time=0; // Za prvog u listi je 0 u odnosu na First_remaining_time!
    80003478:	00053423          	sd	zero,8(a0)
        head = node;
    8000347c:	00a9b023          	sd	a0,0(s3)
    80003480:	0340006f          	j	800034b4 <_ZN12SleepingList8add_nodeEP3TCBm+0xb0>
        head = node;
    80003484:	00a9b023          	sd	a0,0(s3)
        First_remaining_time = vreme;
    80003488:	00009797          	auipc	a5,0x9
    8000348c:	7a97b823          	sd	s1,1968(a5) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>
        node->remaining_time=0;
    80003490:	00053423          	sd	zero,8(a0)
        node->next= nullptr;
    80003494:	00053823          	sd	zero,16(a0)
        return;
    80003498:	01c0006f          	j	800034b4 <_ZN12SleepingList8add_nodeEP3TCBm+0xb0>
        node->next = head;
    8000349c:	00d53823          	sd	a3,16(a0)
        head->remaining_time = 0; // Preostalo u odnosu na node!
    800034a0:	0006b423          	sd	zero,8(a3)
        head = node;
    800034a4:	00a9b023          	sd	a0,0(s3)
        First_remaining_time = vreme;
    800034a8:	00009797          	auipc	a5,0x9
    800034ac:	7897b823          	sd	s1,1936(a5) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>
        node->remaining_time=0; // Za prvog u listi je 0 u odnosu na First_remaining_time!
    800034b0:	00053423          	sd	zero,8(a0)
        prev->next=node;
        node->remaining_time = node->remaining_time-current;

    }

}
    800034b4:	02813083          	ld	ra,40(sp)
    800034b8:	02013403          	ld	s0,32(sp)
    800034bc:	01813483          	ld	s1,24(sp)
    800034c0:	01013903          	ld	s2,16(sp)
    800034c4:	00813983          	ld	s3,8(sp)
    800034c8:	03010113          	addi	sp,sp,48
    800034cc:	00008067          	ret
        Elem* trenutni = head->next;
    800034d0:	0106b783          	ld	a5,16(a3)
        while (trenutni != nullptr)
    800034d4:	04078463          	beqz	a5,8000351c <_ZN12SleepingList8add_nodeEP3TCBm+0x118>
            current+= trenutni->remaining_time;
    800034d8:	0087b603          	ld	a2,8(a5)
    800034dc:	00c70733          	add	a4,a4,a2
            if (current>=vreme)
    800034e0:	00977863          	bgeu	a4,s1,800034f0 <_ZN12SleepingList8add_nodeEP3TCBm+0xec>
            prev=trenutni;
    800034e4:	00078693          	mv	a3,a5
            trenutni=trenutni->next;
    800034e8:	0107b783          	ld	a5,16(a5)
        while (trenutni != nullptr)
    800034ec:	fe9ff06f          	j	800034d4 <_ZN12SleepingList8add_nodeEP3TCBm+0xd0>
                prev->next = node;
    800034f0:	00a6b823          	sd	a0,16(a3)
                node->next=trenutni;
    800034f4:	00f53823          	sd	a5,16(a0)
                time_t staro_vreme = current - trenutni->remaining_time;
    800034f8:	0087b683          	ld	a3,8(a5)
                trenutni->remaining_time= current - node->remaining_time;
    800034fc:	00853603          	ld	a2,8(a0)
    80003500:	40c70633          	sub	a2,a4,a2
    80003504:	00c7b423          	sd	a2,8(a5)
                node->remaining_time=node->remaining_time-staro_vreme;
    80003508:	00853783          	ld	a5,8(a0)
    8000350c:	40e68733          	sub	a4,a3,a4
    80003510:	00f70733          	add	a4,a4,a5
    80003514:	00e53423          	sd	a4,8(a0)
                return;
    80003518:	f9dff06f          	j	800034b4 <_ZN12SleepingList8add_nodeEP3TCBm+0xb0>
        prev->next=node;
    8000351c:	00a6b823          	sd	a0,16(a3)
        node->remaining_time = node->remaining_time-current;
    80003520:	00853783          	ld	a5,8(a0)
    80003524:	40e78733          	sub	a4,a5,a4
    80003528:	00e53423          	sd	a4,8(a0)
    8000352c:	f89ff06f          	j	800034b4 <_ZN12SleepingList8add_nodeEP3TCBm+0xb0>

0000000080003530 <_ZN12SleepingList8get_nodeEv>:
         get_node();
    }

}

void SleepingList::get_node() {
    80003530:	fd010113          	addi	sp,sp,-48
    80003534:	02113423          	sd	ra,40(sp)
    80003538:	02813023          	sd	s0,32(sp)
    8000353c:	00913c23          	sd	s1,24(sp)
    80003540:	01213823          	sd	s2,16(sp)
    80003544:	01313423          	sd	s3,8(sp)
    80003548:	03010413          	addi	s0,sp,48
    8000354c:	00050993          	mv	s3,a0

    Elem* current = head;
    80003550:	00053483          	ld	s1,0(a0)
    80003554:	0400006f          	j	80003594 <_ZN12SleepingList8get_nodeEv+0x64>
    while (current!= nullptr)
    {
        if (current->remaining_time!=0)
        {
            head = current;
    80003558:	0099b023          	sd	s1,0(s3)
            First_remaining_time = head->remaining_time;
    8000355c:	0084b783          	ld	a5,8(s1)
    80003560:	00009717          	auipc	a4,0x9
    80003564:	6cf73c23          	sd	a5,1752(a4) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>
            head->remaining_time=0;
    80003568:	0009b783          	ld	a5,0(s3)
    8000356c:	0007b423          	sd	zero,8(a5)
            return;
    80003570:	0580006f          	j	800035c8 <_ZN12SleepingList8get_nodeEv+0x98>
        if (current->nit!= nullptr)
        {
            current->nit->setBlocked(false);
            if (current->nit->isFinished()== false)
            {
                Scheduler::put(current->nit);
    80003574:	fffff097          	auipc	ra,0xfffff
    80003578:	840080e7          	jalr	-1984(ra) # 80001db4 <_ZN9Scheduler3putEP3TCB>
            }

        }
        current=current->next;
    8000357c:	0104b903          	ld	s2,16(s1)
        delete old;
    80003580:	00048863          	beqz	s1,80003590 <_ZN12SleepingList8get_nodeEv+0x60>
            return pointer;
        }

        void operator delete(void *adress) {

            MemoryAllocator::mem_free(adress);
    80003584:	00048513          	mv	a0,s1
    80003588:	00000097          	auipc	ra,0x0
    8000358c:	c80080e7          	jalr	-896(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
void SleepingList::get_node() {
    80003590:	00090493          	mv	s1,s2
    while (current!= nullptr)
    80003594:	02048463          	beqz	s1,800035bc <_ZN12SleepingList8get_nodeEv+0x8c>
        if (current->remaining_time!=0)
    80003598:	0084b783          	ld	a5,8(s1)
    8000359c:	fa079ee3          	bnez	a5,80003558 <_ZN12SleepingList8get_nodeEv+0x28>
        if (current->nit!= nullptr)
    800035a0:	0004b783          	ld	a5,0(s1)
    800035a4:	fc078ce3          	beqz	a5,8000357c <_ZN12SleepingList8get_nodeEv+0x4c>
    800035a8:	020788a3          	sb	zero,49(a5)
            if (current->nit->isFinished()== false)
    800035ac:	0004b503          	ld	a0,0(s1)
    bool isFinished() const { return finished; }
    800035b0:	03054783          	lbu	a5,48(a0)
    800035b4:	fc0794e3          	bnez	a5,8000357c <_ZN12SleepingList8get_nodeEv+0x4c>
    800035b8:	fbdff06f          	j	80003574 <_ZN12SleepingList8get_nodeEv+0x44>

    }
    // Slucaj kada uzmemo sve elemente liste i lista postane prazna!
    head = nullptr;
    800035bc:	0009b023          	sd	zero,0(s3)
    First_remaining_time=0;
    800035c0:	00009797          	auipc	a5,0x9
    800035c4:	6607bc23          	sd	zero,1656(a5) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>

}
    800035c8:	02813083          	ld	ra,40(sp)
    800035cc:	02013403          	ld	s0,32(sp)
    800035d0:	01813483          	ld	s1,24(sp)
    800035d4:	01013903          	ld	s2,16(sp)
    800035d8:	00813983          	ld	s3,8(sp)
    800035dc:	03010113          	addi	sp,sp,48
    800035e0:	00008067          	ret

00000000800035e4 <_ZN12SleepingList7otkucajEv>:
    if (First_remaining_time>0)
    800035e4:	00009797          	auipc	a5,0x9
    800035e8:	6547b783          	ld	a5,1620(a5) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>
    800035ec:	00078a63          	beqz	a5,80003600 <_ZN12SleepingList7otkucajEv+0x1c>
        First_remaining_time--;
    800035f0:	fff78793          	addi	a5,a5,-1
    800035f4:	00009717          	auipc	a4,0x9
    800035f8:	64f73223          	sd	a5,1604(a4) # 8000cc38 <_ZN12SleepingList20First_remaining_timeE>
        if (First_remaining_time==0)
    800035fc:	00078463          	beqz	a5,80003604 <_ZN12SleepingList7otkucajEv+0x20>
    80003600:	00008067          	ret
void SleepingList::otkucaj() {
    80003604:	ff010113          	addi	sp,sp,-16
    80003608:	00113423          	sd	ra,8(sp)
    8000360c:	00813023          	sd	s0,0(sp)
    80003610:	01010413          	addi	s0,sp,16
         get_node();
    80003614:	00000097          	auipc	ra,0x0
    80003618:	f1c080e7          	jalr	-228(ra) # 80003530 <_ZN12SleepingList8get_nodeEv>
}
    8000361c:	00813083          	ld	ra,8(sp)
    80003620:	00013403          	ld	s0,0(sp)
    80003624:	01010113          	addi	sp,sp,16
    80003628:	00008067          	ret

000000008000362c <_ZN12SleepingListdlEPv>:

void SleepingList::operator delete(void *adress) {
    8000362c:	ff010113          	addi	sp,sp,-16
    80003630:	00113423          	sd	ra,8(sp)
    80003634:	00813023          	sd	s0,0(sp)
    80003638:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(adress);
    8000363c:	00000097          	auipc	ra,0x0
    80003640:	bcc080e7          	jalr	-1076(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003644:	00813083          	ld	ra,8(sp)
    80003648:	00013403          	ld	s0,0(sp)
    8000364c:	01010113          	addi	sp,sp,16
    80003650:	00008067          	ret

0000000080003654 <_ZN12SleepingListnwEm>:

void *SleepingList::operator new(size_t size) {
    80003654:	ff010113          	addi	sp,sp,-16
    80003658:	00113423          	sd	ra,8(sp)
    8000365c:	00813023          	sd	s0,0(sp)
    80003660:	01010413          	addi	s0,sp,16
    size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    80003664:	03f50513          	addi	a0,a0,63
    void* pointer = MemoryAllocator::mem_alloc(block);
    80003668:	00655513          	srli	a0,a0,0x6
    8000366c:	00000097          	auipc	ra,0x0
    80003670:	a50080e7          	jalr	-1456(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    return pointer;
}
    80003674:	00813083          	ld	ra,8(sp)
    80003678:	00013403          	ld	s0,0(sp)
    8000367c:	01010113          	addi	sp,sp,16
    80003680:	00008067          	ret

0000000080003684 <_ZN7_BuffernwEm>:
//

#include "../h/_Buffer.hpp"


void *_Buffer::operator new(size_t size) {
    80003684:	ff010113          	addi	sp,sp,-16
    80003688:	00113423          	sd	ra,8(sp)
    8000368c:	00813023          	sd	s0,0(sp)
    80003690:	01010413          	addi	s0,sp,16


    size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    80003694:	03f50513          	addi	a0,a0,63
    void* pointer = MemoryAllocator::mem_alloc(block);
    80003698:	00655513          	srli	a0,a0,0x6
    8000369c:	00000097          	auipc	ra,0x0
    800036a0:	a20080e7          	jalr	-1504(ra) # 800030bc <_ZN15MemoryAllocator9mem_allocEm>
    return pointer;
}
    800036a4:	00813083          	ld	ra,8(sp)
    800036a8:	00013403          	ld	s0,0(sp)
    800036ac:	01010113          	addi	sp,sp,16
    800036b0:	00008067          	ret

00000000800036b4 <_ZN7_BufferD1Ev>:


_Buffer::~_Buffer()
    800036b4:	fe010113          	addi	sp,sp,-32
    800036b8:	00113c23          	sd	ra,24(sp)
    800036bc:	00813823          	sd	s0,16(sp)
    800036c0:	00913423          	sd	s1,8(sp)
    800036c4:	01213023          	sd	s2,0(sp)
    800036c8:	02010413          	addi	s0,sp,32
    800036cc:	00050493          	mv	s1,a0
{
    delete mutex;
    800036d0:	11053903          	ld	s2,272(a0)
    800036d4:	00090e63          	beqz	s2,800036f0 <_ZN7_BufferD1Ev+0x3c>
    800036d8:	00090513          	mv	a0,s2
    800036dc:	00000097          	auipc	ra,0x0
    800036e0:	970080e7          	jalr	-1680(ra) # 8000304c <_ZN4_semD1Ev>
    800036e4:	00090513          	mv	a0,s2
    800036e8:	fffff097          	auipc	ra,0xfffff
    800036ec:	734080e7          	jalr	1844(ra) # 80002e1c <_ZN4_semdlEPv>
    delete space_available;
    800036f0:	1184b903          	ld	s2,280(s1)
    800036f4:	00090e63          	beqz	s2,80003710 <_ZN7_BufferD1Ev+0x5c>
    800036f8:	00090513          	mv	a0,s2
    800036fc:	00000097          	auipc	ra,0x0
    80003700:	950080e7          	jalr	-1712(ra) # 8000304c <_ZN4_semD1Ev>
    80003704:	00090513          	mv	a0,s2
    80003708:	fffff097          	auipc	ra,0xfffff
    8000370c:	714080e7          	jalr	1812(ra) # 80002e1c <_ZN4_semdlEPv>
    delete item_available;
    80003710:	1204b483          	ld	s1,288(s1)
    80003714:	00048e63          	beqz	s1,80003730 <_ZN7_BufferD1Ev+0x7c>
    80003718:	00048513          	mv	a0,s1
    8000371c:	00000097          	auipc	ra,0x0
    80003720:	930080e7          	jalr	-1744(ra) # 8000304c <_ZN4_semD1Ev>
    80003724:	00048513          	mv	a0,s1
    80003728:	fffff097          	auipc	ra,0xfffff
    8000372c:	6f4080e7          	jalr	1780(ra) # 80002e1c <_ZN4_semdlEPv>
}
    80003730:	01813083          	ld	ra,24(sp)
    80003734:	01013403          	ld	s0,16(sp)
    80003738:	00813483          	ld	s1,8(sp)
    8000373c:	00013903          	ld	s2,0(sp)
    80003740:	02010113          	addi	sp,sp,32
    80003744:	00008067          	ret

0000000080003748 <_ZN7_BufferdlEPv>:

void _Buffer::operator delete(void *adress) {
    80003748:	ff010113          	addi	sp,sp,-16
    8000374c:	00113423          	sd	ra,8(sp)
    80003750:	00813023          	sd	s0,0(sp)
    80003754:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(adress);
    80003758:	00000097          	auipc	ra,0x0
    8000375c:	ab0080e7          	jalr	-1360(ra) # 80003208 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003760:	00813083          	ld	ra,8(sp)
    80003764:	00013403          	ld	s0,0(sp)
    80003768:	01010113          	addi	sp,sp,16
    8000376c:	00008067          	ret

0000000080003770 <_ZN7_BufferC1Ev>:

_Buffer::_Buffer():head(0),tail(0),size(0) {
    80003770:	fe010113          	addi	sp,sp,-32
    80003774:	00113c23          	sd	ra,24(sp)
    80003778:	00813823          	sd	s0,16(sp)
    8000377c:	00913423          	sd	s1,8(sp)
    80003780:	02010413          	addi	s0,sp,32
    80003784:	00050493          	mv	s1,a0
    80003788:	00052023          	sw	zero,0(a0)
    8000378c:	00052223          	sw	zero,4(a0)
    80003790:	00052423          	sw	zero,8(a0)
    mutex = _sem::createSemaphore(1);
    80003794:	00100513          	li	a0,1
    80003798:	00000097          	auipc	ra,0x0
    8000379c:	8dc080e7          	jalr	-1828(ra) # 80003074 <_ZN4_sem15createSemaphoreEj>
    800037a0:	10a4b823          	sd	a0,272(s1)
    space_available = _sem::createSemaphore(256);
    800037a4:	10000513          	li	a0,256
    800037a8:	00000097          	auipc	ra,0x0
    800037ac:	8cc080e7          	jalr	-1844(ra) # 80003074 <_ZN4_sem15createSemaphoreEj>
    800037b0:	10a4bc23          	sd	a0,280(s1)
    item_available = _sem::createSemaphore(0);
    800037b4:	00000513          	li	a0,0
    800037b8:	00000097          	auipc	ra,0x0
    800037bc:	8bc080e7          	jalr	-1860(ra) # 80003074 <_ZN4_sem15createSemaphoreEj>
    800037c0:	12a4b023          	sd	a0,288(s1)
}
    800037c4:	01813083          	ld	ra,24(sp)
    800037c8:	01013403          	ld	s0,16(sp)
    800037cc:	00813483          	ld	s1,8(sp)
    800037d0:	02010113          	addi	sp,sp,32
    800037d4:	00008067          	ret

00000000800037d8 <_ZN7_Buffer3putEc>:



void _Buffer::put(char c) {
    800037d8:	fe010113          	addi	sp,sp,-32
    800037dc:	00113c23          	sd	ra,24(sp)
    800037e0:	00813823          	sd	s0,16(sp)
    800037e4:	00913423          	sd	s1,8(sp)
    800037e8:	01213023          	sd	s2,0(sp)
    800037ec:	02010413          	addi	s0,sp,32
    800037f0:	00050493          	mv	s1,a0
    800037f4:	00058913          	mv	s2,a1
    space_available->wait();
    800037f8:	11853503          	ld	a0,280(a0)
    800037fc:	fffff097          	auipc	ra,0xfffff
    80003800:	6b8080e7          	jalr	1720(ra) # 80002eb4 <_ZN4_sem4waitEv>
    mutex->wait();
    80003804:	1104b503          	ld	a0,272(s1)
    80003808:	fffff097          	auipc	ra,0xfffff
    8000380c:	6ac080e7          	jalr	1708(ra) # 80002eb4 <_ZN4_sem4waitEv>
    niz[tail] = c;
    80003810:	0044a783          	lw	a5,4(s1)
    80003814:	00f48733          	add	a4,s1,a5
    80003818:	01270623          	sb	s2,12(a4)
    tail = (tail + 1) % 256;
    8000381c:	0017879b          	addiw	a5,a5,1
    80003820:	41f7d71b          	sraiw	a4,a5,0x1f
    80003824:	0187571b          	srliw	a4,a4,0x18
    80003828:	00e787bb          	addw	a5,a5,a4
    8000382c:	0ff7f793          	andi	a5,a5,255
    80003830:	40e787bb          	subw	a5,a5,a4
    80003834:	00f4a223          	sw	a5,4(s1)
    size++;
    80003838:	0084a783          	lw	a5,8(s1)
    8000383c:	0017879b          	addiw	a5,a5,1
    80003840:	00f4a423          	sw	a5,8(s1)
    mutex->signal();
    80003844:	1104b503          	ld	a0,272(s1)
    80003848:	fffff097          	auipc	ra,0xfffff
    8000384c:	734080e7          	jalr	1844(ra) # 80002f7c <_ZN4_sem6signalEv>
    item_available->signal();
    80003850:	1204b503          	ld	a0,288(s1)
    80003854:	fffff097          	auipc	ra,0xfffff
    80003858:	728080e7          	jalr	1832(ra) # 80002f7c <_ZN4_sem6signalEv>
}
    8000385c:	01813083          	ld	ra,24(sp)
    80003860:	01013403          	ld	s0,16(sp)
    80003864:	00813483          	ld	s1,8(sp)
    80003868:	00013903          	ld	s2,0(sp)
    8000386c:	02010113          	addi	sp,sp,32
    80003870:	00008067          	ret

0000000080003874 <_ZN7_Buffer3getEv>:

char _Buffer::get()
{
    80003874:	fe010113          	addi	sp,sp,-32
    80003878:	00113c23          	sd	ra,24(sp)
    8000387c:	00813823          	sd	s0,16(sp)
    80003880:	00913423          	sd	s1,8(sp)
    80003884:	01213023          	sd	s2,0(sp)
    80003888:	02010413          	addi	s0,sp,32
    8000388c:	00050493          	mv	s1,a0
        item_available->wait();
    80003890:	12053503          	ld	a0,288(a0)
    80003894:	fffff097          	auipc	ra,0xfffff
    80003898:	620080e7          	jalr	1568(ra) # 80002eb4 <_ZN4_sem4waitEv>
        mutex->wait();
    8000389c:	1104b503          	ld	a0,272(s1)
    800038a0:	fffff097          	auipc	ra,0xfffff
    800038a4:	614080e7          	jalr	1556(ra) # 80002eb4 <_ZN4_sem4waitEv>
        char c = niz[head];
    800038a8:	0004a783          	lw	a5,0(s1)
    800038ac:	00f48733          	add	a4,s1,a5
    800038b0:	00c74903          	lbu	s2,12(a4)
        head = (head + 1) % 256;
    800038b4:	0017879b          	addiw	a5,a5,1
    800038b8:	41f7d71b          	sraiw	a4,a5,0x1f
    800038bc:	0187571b          	srliw	a4,a4,0x18
    800038c0:	00e787bb          	addw	a5,a5,a4
    800038c4:	0ff7f793          	andi	a5,a5,255
    800038c8:	40e787bb          	subw	a5,a5,a4
    800038cc:	00f4a023          	sw	a5,0(s1)
        size--;
    800038d0:	0084a783          	lw	a5,8(s1)
    800038d4:	fff7879b          	addiw	a5,a5,-1
    800038d8:	00f4a423          	sw	a5,8(s1)
        mutex->signal();
    800038dc:	1104b503          	ld	a0,272(s1)
    800038e0:	fffff097          	auipc	ra,0xfffff
    800038e4:	69c080e7          	jalr	1692(ra) # 80002f7c <_ZN4_sem6signalEv>
        space_available->signal();
    800038e8:	1184b503          	ld	a0,280(s1)
    800038ec:	fffff097          	auipc	ra,0xfffff
    800038f0:	690080e7          	jalr	1680(ra) # 80002f7c <_ZN4_sem6signalEv>
        return c;
}
    800038f4:	00090513          	mv	a0,s2
    800038f8:	01813083          	ld	ra,24(sp)
    800038fc:	01013403          	ld	s0,16(sp)
    80003900:	00813483          	ld	s1,8(sp)
    80003904:	00013903          	ld	s2,0(sp)
    80003908:	02010113          	addi	sp,sp,32
    8000390c:	00008067          	ret

0000000080003910 <_ZN7_Buffer5countEv>:

int _Buffer::count() {
    80003910:	ff010113          	addi	sp,sp,-16
    80003914:	00813423          	sd	s0,8(sp)
    80003918:	01010413          	addi	s0,sp,16
    return size;
}
    8000391c:	00852503          	lw	a0,8(a0)
    80003920:	00813403          	ld	s0,8(sp)
    80003924:	01010113          	addi	sp,sp,16
    80003928:	00008067          	ret

000000008000392c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000392c:	fe010113          	addi	sp,sp,-32
    80003930:	00113c23          	sd	ra,24(sp)
    80003934:	00813823          	sd	s0,16(sp)
    80003938:	00913423          	sd	s1,8(sp)
    8000393c:	01213023          	sd	s2,0(sp)
    80003940:	02010413          	addi	s0,sp,32
    80003944:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003948:	00000913          	li	s2,0
    8000394c:	00c0006f          	j	80003958 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003950:	ffffe097          	auipc	ra,0xffffe
    80003954:	a80080e7          	jalr	-1408(ra) # 800013d0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003958:	ffffe097          	auipc	ra,0xffffe
    8000395c:	d0c080e7          	jalr	-756(ra) # 80001664 <_Z4getcv>
    80003960:	0005059b          	sext.w	a1,a0
    80003964:	01b00793          	li	a5,27
    80003968:	02f58a63          	beq	a1,a5,8000399c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000396c:	0084b503          	ld	a0,8(s1)
    80003970:	00003097          	auipc	ra,0x3
    80003974:	40c080e7          	jalr	1036(ra) # 80006d7c <_ZN6Buffer3putEi>
        i++;
    80003978:	0019071b          	addiw	a4,s2,1
    8000397c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003980:	0004a683          	lw	a3,0(s1)
    80003984:	0026979b          	slliw	a5,a3,0x2
    80003988:	00d787bb          	addw	a5,a5,a3
    8000398c:	0017979b          	slliw	a5,a5,0x1
    80003990:	02f767bb          	remw	a5,a4,a5
    80003994:	fc0792e3          	bnez	a5,80003958 <_ZL16producerKeyboardPv+0x2c>
    80003998:	fb9ff06f          	j	80003950 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000399c:	00100793          	li	a5,1
    800039a0:	00009717          	auipc	a4,0x9
    800039a4:	2af72023          	sw	a5,672(a4) # 8000cc40 <_ZL9threadEnd>
    data->buffer->put('!');
    800039a8:	02100593          	li	a1,33
    800039ac:	0084b503          	ld	a0,8(s1)
    800039b0:	00003097          	auipc	ra,0x3
    800039b4:	3cc080e7          	jalr	972(ra) # 80006d7c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800039b8:	0104b503          	ld	a0,16(s1)
    800039bc:	ffffe097          	auipc	ra,0xffffe
    800039c0:	c34080e7          	jalr	-972(ra) # 800015f0 <_Z10sem_signalP4_sem>
}
    800039c4:	01813083          	ld	ra,24(sp)
    800039c8:	01013403          	ld	s0,16(sp)
    800039cc:	00813483          	ld	s1,8(sp)
    800039d0:	00013903          	ld	s2,0(sp)
    800039d4:	02010113          	addi	sp,sp,32
    800039d8:	00008067          	ret

00000000800039dc <_ZL8producerPv>:

static void producer(void *arg) {
    800039dc:	fe010113          	addi	sp,sp,-32
    800039e0:	00113c23          	sd	ra,24(sp)
    800039e4:	00813823          	sd	s0,16(sp)
    800039e8:	00913423          	sd	s1,8(sp)
    800039ec:	01213023          	sd	s2,0(sp)
    800039f0:	02010413          	addi	s0,sp,32
    800039f4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800039f8:	00000913          	li	s2,0
    800039fc:	00c0006f          	j	80003a08 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003a00:	ffffe097          	auipc	ra,0xffffe
    80003a04:	9d0080e7          	jalr	-1584(ra) # 800013d0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003a08:	00009797          	auipc	a5,0x9
    80003a0c:	2387a783          	lw	a5,568(a5) # 8000cc40 <_ZL9threadEnd>
    80003a10:	02079e63          	bnez	a5,80003a4c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003a14:	0004a583          	lw	a1,0(s1)
    80003a18:	0305859b          	addiw	a1,a1,48
    80003a1c:	0084b503          	ld	a0,8(s1)
    80003a20:	00003097          	auipc	ra,0x3
    80003a24:	35c080e7          	jalr	860(ra) # 80006d7c <_ZN6Buffer3putEi>
        i++;
    80003a28:	0019071b          	addiw	a4,s2,1
    80003a2c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003a30:	0004a683          	lw	a3,0(s1)
    80003a34:	0026979b          	slliw	a5,a3,0x2
    80003a38:	00d787bb          	addw	a5,a5,a3
    80003a3c:	0017979b          	slliw	a5,a5,0x1
    80003a40:	02f767bb          	remw	a5,a4,a5
    80003a44:	fc0792e3          	bnez	a5,80003a08 <_ZL8producerPv+0x2c>
    80003a48:	fb9ff06f          	j	80003a00 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003a4c:	0104b503          	ld	a0,16(s1)
    80003a50:	ffffe097          	auipc	ra,0xffffe
    80003a54:	ba0080e7          	jalr	-1120(ra) # 800015f0 <_Z10sem_signalP4_sem>
}
    80003a58:	01813083          	ld	ra,24(sp)
    80003a5c:	01013403          	ld	s0,16(sp)
    80003a60:	00813483          	ld	s1,8(sp)
    80003a64:	00013903          	ld	s2,0(sp)
    80003a68:	02010113          	addi	sp,sp,32
    80003a6c:	00008067          	ret

0000000080003a70 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003a70:	fd010113          	addi	sp,sp,-48
    80003a74:	02113423          	sd	ra,40(sp)
    80003a78:	02813023          	sd	s0,32(sp)
    80003a7c:	00913c23          	sd	s1,24(sp)
    80003a80:	01213823          	sd	s2,16(sp)
    80003a84:	01313423          	sd	s3,8(sp)
    80003a88:	03010413          	addi	s0,sp,48
    80003a8c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003a90:	00000993          	li	s3,0
    80003a94:	01c0006f          	j	80003ab0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003a98:	ffffe097          	auipc	ra,0xffffe
    80003a9c:	938080e7          	jalr	-1736(ra) # 800013d0 <_Z15thread_dispatchv>
    80003aa0:	0500006f          	j	80003af0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003aa4:	00a00513          	li	a0,10
    80003aa8:	ffffe097          	auipc	ra,0xffffe
    80003aac:	be8080e7          	jalr	-1048(ra) # 80001690 <_Z4putcc>
    while (!threadEnd) {
    80003ab0:	00009797          	auipc	a5,0x9
    80003ab4:	1907a783          	lw	a5,400(a5) # 8000cc40 <_ZL9threadEnd>
    80003ab8:	06079063          	bnez	a5,80003b18 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003abc:	00893503          	ld	a0,8(s2)
    80003ac0:	00003097          	auipc	ra,0x3
    80003ac4:	34c080e7          	jalr	844(ra) # 80006e0c <_ZN6Buffer3getEv>
        i++;
    80003ac8:	0019849b          	addiw	s1,s3,1
    80003acc:	0004899b          	sext.w	s3,s1
        putc(key);
    80003ad0:	0ff57513          	andi	a0,a0,255
    80003ad4:	ffffe097          	auipc	ra,0xffffe
    80003ad8:	bbc080e7          	jalr	-1092(ra) # 80001690 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003adc:	00092703          	lw	a4,0(s2)
    80003ae0:	0027179b          	slliw	a5,a4,0x2
    80003ae4:	00e787bb          	addw	a5,a5,a4
    80003ae8:	02f4e7bb          	remw	a5,s1,a5
    80003aec:	fa0786e3          	beqz	a5,80003a98 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003af0:	05000793          	li	a5,80
    80003af4:	02f4e4bb          	remw	s1,s1,a5
    80003af8:	fa049ce3          	bnez	s1,80003ab0 <_ZL8consumerPv+0x40>
    80003afc:	fa9ff06f          	j	80003aa4 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003b00:	00893503          	ld	a0,8(s2)
    80003b04:	00003097          	auipc	ra,0x3
    80003b08:	308080e7          	jalr	776(ra) # 80006e0c <_ZN6Buffer3getEv>
        putc(key);
    80003b0c:	0ff57513          	andi	a0,a0,255
    80003b10:	ffffe097          	auipc	ra,0xffffe
    80003b14:	b80080e7          	jalr	-1152(ra) # 80001690 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003b18:	00893503          	ld	a0,8(s2)
    80003b1c:	00003097          	auipc	ra,0x3
    80003b20:	37c080e7          	jalr	892(ra) # 80006e98 <_ZN6Buffer6getCntEv>
    80003b24:	fca04ee3          	bgtz	a0,80003b00 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003b28:	01093503          	ld	a0,16(s2)
    80003b2c:	ffffe097          	auipc	ra,0xffffe
    80003b30:	ac4080e7          	jalr	-1340(ra) # 800015f0 <_Z10sem_signalP4_sem>
}
    80003b34:	02813083          	ld	ra,40(sp)
    80003b38:	02013403          	ld	s0,32(sp)
    80003b3c:	01813483          	ld	s1,24(sp)
    80003b40:	01013903          	ld	s2,16(sp)
    80003b44:	00813983          	ld	s3,8(sp)
    80003b48:	03010113          	addi	sp,sp,48
    80003b4c:	00008067          	ret

0000000080003b50 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003b50:	f9010113          	addi	sp,sp,-112
    80003b54:	06113423          	sd	ra,104(sp)
    80003b58:	06813023          	sd	s0,96(sp)
    80003b5c:	04913c23          	sd	s1,88(sp)
    80003b60:	05213823          	sd	s2,80(sp)
    80003b64:	05313423          	sd	s3,72(sp)
    80003b68:	05413023          	sd	s4,64(sp)
    80003b6c:	03513c23          	sd	s5,56(sp)
    80003b70:	03613823          	sd	s6,48(sp)
    80003b74:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003b78:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003b7c:	00006517          	auipc	a0,0x6
    80003b80:	63c50513          	addi	a0,a0,1596 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    80003b84:	00002097          	auipc	ra,0x2
    80003b88:	220080e7          	jalr	544(ra) # 80005da4 <_Z11printStringPKc>
    getString(input, 30);
    80003b8c:	01e00593          	li	a1,30
    80003b90:	fa040493          	addi	s1,s0,-96
    80003b94:	00048513          	mv	a0,s1
    80003b98:	00002097          	auipc	ra,0x2
    80003b9c:	294080e7          	jalr	660(ra) # 80005e2c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003ba0:	00048513          	mv	a0,s1
    80003ba4:	00002097          	auipc	ra,0x2
    80003ba8:	36c080e7          	jalr	876(ra) # 80005f10 <_Z11stringToIntPKc>
    80003bac:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003bb0:	00006517          	auipc	a0,0x6
    80003bb4:	62850513          	addi	a0,a0,1576 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80003bb8:	00002097          	auipc	ra,0x2
    80003bbc:	1ec080e7          	jalr	492(ra) # 80005da4 <_Z11printStringPKc>
    getString(input, 30);
    80003bc0:	01e00593          	li	a1,30
    80003bc4:	00048513          	mv	a0,s1
    80003bc8:	00002097          	auipc	ra,0x2
    80003bcc:	264080e7          	jalr	612(ra) # 80005e2c <_Z9getStringPci>
    n = stringToInt(input);
    80003bd0:	00048513          	mv	a0,s1
    80003bd4:	00002097          	auipc	ra,0x2
    80003bd8:	33c080e7          	jalr	828(ra) # 80005f10 <_Z11stringToIntPKc>
    80003bdc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003be0:	00006517          	auipc	a0,0x6
    80003be4:	61850513          	addi	a0,a0,1560 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80003be8:	00002097          	auipc	ra,0x2
    80003bec:	1bc080e7          	jalr	444(ra) # 80005da4 <_Z11printStringPKc>
    80003bf0:	00000613          	li	a2,0
    80003bf4:	00a00593          	li	a1,10
    80003bf8:	00090513          	mv	a0,s2
    80003bfc:	00002097          	auipc	ra,0x2
    80003c00:	364080e7          	jalr	868(ra) # 80005f60 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003c04:	00006517          	auipc	a0,0x6
    80003c08:	60c50513          	addi	a0,a0,1548 # 8000a210 <CONSOLE_STATUS+0x200>
    80003c0c:	00002097          	auipc	ra,0x2
    80003c10:	198080e7          	jalr	408(ra) # 80005da4 <_Z11printStringPKc>
    80003c14:	00000613          	li	a2,0
    80003c18:	00a00593          	li	a1,10
    80003c1c:	00048513          	mv	a0,s1
    80003c20:	00002097          	auipc	ra,0x2
    80003c24:	340080e7          	jalr	832(ra) # 80005f60 <_Z8printIntiii>
    printString(".\n");
    80003c28:	00006517          	auipc	a0,0x6
    80003c2c:	60050513          	addi	a0,a0,1536 # 8000a228 <CONSOLE_STATUS+0x218>
    80003c30:	00002097          	auipc	ra,0x2
    80003c34:	174080e7          	jalr	372(ra) # 80005da4 <_Z11printStringPKc>
    if(threadNum > n) {
    80003c38:	0324c463          	blt	s1,s2,80003c60 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003c3c:	03205c63          	blez	s2,80003c74 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003c40:	03800513          	li	a0,56
    80003c44:	ffffe097          	auipc	ra,0xffffe
    80003c48:	50c080e7          	jalr	1292(ra) # 80002150 <_Znwm>
    80003c4c:	00050a13          	mv	s4,a0
    80003c50:	00048593          	mv	a1,s1
    80003c54:	00003097          	auipc	ra,0x3
    80003c58:	08c080e7          	jalr	140(ra) # 80006ce0 <_ZN6BufferC1Ei>
    80003c5c:	0300006f          	j	80003c8c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003c60:	00006517          	auipc	a0,0x6
    80003c64:	5d050513          	addi	a0,a0,1488 # 8000a230 <CONSOLE_STATUS+0x220>
    80003c68:	00002097          	auipc	ra,0x2
    80003c6c:	13c080e7          	jalr	316(ra) # 80005da4 <_Z11printStringPKc>
        return;
    80003c70:	0140006f          	j	80003c84 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003c74:	00006517          	auipc	a0,0x6
    80003c78:	5fc50513          	addi	a0,a0,1532 # 8000a270 <CONSOLE_STATUS+0x260>
    80003c7c:	00002097          	auipc	ra,0x2
    80003c80:	128080e7          	jalr	296(ra) # 80005da4 <_Z11printStringPKc>
        return;
    80003c84:	000b0113          	mv	sp,s6
    80003c88:	1500006f          	j	80003dd8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003c8c:	00000593          	li	a1,0
    80003c90:	00009517          	auipc	a0,0x9
    80003c94:	fb850513          	addi	a0,a0,-72 # 8000cc48 <_ZL10waitForAll>
    80003c98:	ffffe097          	auipc	ra,0xffffe
    80003c9c:	894080e7          	jalr	-1900(ra) # 8000152c <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80003ca0:	00391793          	slli	a5,s2,0x3
    80003ca4:	00f78793          	addi	a5,a5,15
    80003ca8:	ff07f793          	andi	a5,a5,-16
    80003cac:	40f10133          	sub	sp,sp,a5
    80003cb0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003cb4:	0019071b          	addiw	a4,s2,1
    80003cb8:	00171793          	slli	a5,a4,0x1
    80003cbc:	00e787b3          	add	a5,a5,a4
    80003cc0:	00379793          	slli	a5,a5,0x3
    80003cc4:	00f78793          	addi	a5,a5,15
    80003cc8:	ff07f793          	andi	a5,a5,-16
    80003ccc:	40f10133          	sub	sp,sp,a5
    80003cd0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003cd4:	00191613          	slli	a2,s2,0x1
    80003cd8:	012607b3          	add	a5,a2,s2
    80003cdc:	00379793          	slli	a5,a5,0x3
    80003ce0:	00f987b3          	add	a5,s3,a5
    80003ce4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003ce8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003cec:	00009717          	auipc	a4,0x9
    80003cf0:	f5c73703          	ld	a4,-164(a4) # 8000cc48 <_ZL10waitForAll>
    80003cf4:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003cf8:	00078613          	mv	a2,a5
    80003cfc:	00000597          	auipc	a1,0x0
    80003d00:	d7458593          	addi	a1,a1,-652 # 80003a70 <_ZL8consumerPv>
    80003d04:	f9840513          	addi	a0,s0,-104
    80003d08:	ffffd097          	auipc	ra,0xffffd
    80003d0c:	5f8080e7          	jalr	1528(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003d10:	00000493          	li	s1,0
    80003d14:	0280006f          	j	80003d3c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003d18:	00000597          	auipc	a1,0x0
    80003d1c:	c1458593          	addi	a1,a1,-1004 # 8000392c <_ZL16producerKeyboardPv>
                      data + i);
    80003d20:	00179613          	slli	a2,a5,0x1
    80003d24:	00f60633          	add	a2,a2,a5
    80003d28:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003d2c:	00c98633          	add	a2,s3,a2
    80003d30:	ffffd097          	auipc	ra,0xffffd
    80003d34:	5d0080e7          	jalr	1488(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003d38:	0014849b          	addiw	s1,s1,1
    80003d3c:	0524d263          	bge	s1,s2,80003d80 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003d40:	00149793          	slli	a5,s1,0x1
    80003d44:	009787b3          	add	a5,a5,s1
    80003d48:	00379793          	slli	a5,a5,0x3
    80003d4c:	00f987b3          	add	a5,s3,a5
    80003d50:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003d54:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003d58:	00009717          	auipc	a4,0x9
    80003d5c:	ef073703          	ld	a4,-272(a4) # 8000cc48 <_ZL10waitForAll>
    80003d60:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003d64:	00048793          	mv	a5,s1
    80003d68:	00349513          	slli	a0,s1,0x3
    80003d6c:	00aa8533          	add	a0,s5,a0
    80003d70:	fa9054e3          	blez	s1,80003d18 <_Z22producerConsumer_C_APIv+0x1c8>
    80003d74:	00000597          	auipc	a1,0x0
    80003d78:	c6858593          	addi	a1,a1,-920 # 800039dc <_ZL8producerPv>
    80003d7c:	fa5ff06f          	j	80003d20 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003d80:	ffffd097          	auipc	ra,0xffffd
    80003d84:	650080e7          	jalr	1616(ra) # 800013d0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003d88:	00000493          	li	s1,0
    80003d8c:	00994e63          	blt	s2,s1,80003da8 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003d90:	00009517          	auipc	a0,0x9
    80003d94:	eb853503          	ld	a0,-328(a0) # 8000cc48 <_ZL10waitForAll>
    80003d98:	ffffe097          	auipc	ra,0xffffe
    80003d9c:	81c080e7          	jalr	-2020(ra) # 800015b4 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80003da0:	0014849b          	addiw	s1,s1,1
    80003da4:	fe9ff06f          	j	80003d8c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003da8:	00009517          	auipc	a0,0x9
    80003dac:	ea053503          	ld	a0,-352(a0) # 8000cc48 <_ZL10waitForAll>
    80003db0:	ffffd097          	auipc	ra,0xffffd
    80003db4:	7c8080e7          	jalr	1992(ra) # 80001578 <_Z9sem_closeP4_sem>
    delete buffer;
    80003db8:	000a0e63          	beqz	s4,80003dd4 <_Z22producerConsumer_C_APIv+0x284>
    80003dbc:	000a0513          	mv	a0,s4
    80003dc0:	00003097          	auipc	ra,0x3
    80003dc4:	160080e7          	jalr	352(ra) # 80006f20 <_ZN6BufferD1Ev>
    80003dc8:	000a0513          	mv	a0,s4
    80003dcc:	ffffe097          	auipc	ra,0xffffe
    80003dd0:	3d4080e7          	jalr	980(ra) # 800021a0 <_ZdlPv>
    80003dd4:	000b0113          	mv	sp,s6

}
    80003dd8:	f9040113          	addi	sp,s0,-112
    80003ddc:	06813083          	ld	ra,104(sp)
    80003de0:	06013403          	ld	s0,96(sp)
    80003de4:	05813483          	ld	s1,88(sp)
    80003de8:	05013903          	ld	s2,80(sp)
    80003dec:	04813983          	ld	s3,72(sp)
    80003df0:	04013a03          	ld	s4,64(sp)
    80003df4:	03813a83          	ld	s5,56(sp)
    80003df8:	03013b03          	ld	s6,48(sp)
    80003dfc:	07010113          	addi	sp,sp,112
    80003e00:	00008067          	ret
    80003e04:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003e08:	000a0513          	mv	a0,s4
    80003e0c:	ffffe097          	auipc	ra,0xffffe
    80003e10:	394080e7          	jalr	916(ra) # 800021a0 <_ZdlPv>
    80003e14:	00048513          	mv	a0,s1
    80003e18:	0000a097          	auipc	ra,0xa
    80003e1c:	f40080e7          	jalr	-192(ra) # 8000dd58 <_Unwind_Resume>

0000000080003e20 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003e20:	fe010113          	addi	sp,sp,-32
    80003e24:	00113c23          	sd	ra,24(sp)
    80003e28:	00813823          	sd	s0,16(sp)
    80003e2c:	00913423          	sd	s1,8(sp)
    80003e30:	01213023          	sd	s2,0(sp)
    80003e34:	02010413          	addi	s0,sp,32
    80003e38:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003e3c:	00100793          	li	a5,1
    80003e40:	02a7f863          	bgeu	a5,a0,80003e70 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003e44:	00a00793          	li	a5,10
    80003e48:	02f577b3          	remu	a5,a0,a5
    80003e4c:	02078e63          	beqz	a5,80003e88 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003e50:	fff48513          	addi	a0,s1,-1
    80003e54:	00000097          	auipc	ra,0x0
    80003e58:	fcc080e7          	jalr	-52(ra) # 80003e20 <_ZL9fibonaccim>
    80003e5c:	00050913          	mv	s2,a0
    80003e60:	ffe48513          	addi	a0,s1,-2
    80003e64:	00000097          	auipc	ra,0x0
    80003e68:	fbc080e7          	jalr	-68(ra) # 80003e20 <_ZL9fibonaccim>
    80003e6c:	00a90533          	add	a0,s2,a0
}
    80003e70:	01813083          	ld	ra,24(sp)
    80003e74:	01013403          	ld	s0,16(sp)
    80003e78:	00813483          	ld	s1,8(sp)
    80003e7c:	00013903          	ld	s2,0(sp)
    80003e80:	02010113          	addi	sp,sp,32
    80003e84:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003e88:	ffffd097          	auipc	ra,0xffffd
    80003e8c:	548080e7          	jalr	1352(ra) # 800013d0 <_Z15thread_dispatchv>
    80003e90:	fc1ff06f          	j	80003e50 <_ZL9fibonaccim+0x30>

0000000080003e94 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003e94:	fe010113          	addi	sp,sp,-32
    80003e98:	00113c23          	sd	ra,24(sp)
    80003e9c:	00813823          	sd	s0,16(sp)
    80003ea0:	00913423          	sd	s1,8(sp)
    80003ea4:	01213023          	sd	s2,0(sp)
    80003ea8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003eac:	00000913          	li	s2,0
    80003eb0:	0380006f          	j	80003ee8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003eb4:	ffffd097          	auipc	ra,0xffffd
    80003eb8:	51c080e7          	jalr	1308(ra) # 800013d0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ebc:	00148493          	addi	s1,s1,1
    80003ec0:	000027b7          	lui	a5,0x2
    80003ec4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ec8:	0097ee63          	bltu	a5,s1,80003ee4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ecc:	00000713          	li	a4,0
    80003ed0:	000077b7          	lui	a5,0x7
    80003ed4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ed8:	fce7eee3          	bltu	a5,a4,80003eb4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003edc:	00170713          	addi	a4,a4,1
    80003ee0:	ff1ff06f          	j	80003ed0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003ee4:	00190913          	addi	s2,s2,1
    80003ee8:	00900793          	li	a5,9
    80003eec:	0527e063          	bltu	a5,s2,80003f2c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003ef0:	00006517          	auipc	a0,0x6
    80003ef4:	3b050513          	addi	a0,a0,944 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80003ef8:	00002097          	auipc	ra,0x2
    80003efc:	eac080e7          	jalr	-340(ra) # 80005da4 <_Z11printStringPKc>
    80003f00:	00000613          	li	a2,0
    80003f04:	00a00593          	li	a1,10
    80003f08:	0009051b          	sext.w	a0,s2
    80003f0c:	00002097          	auipc	ra,0x2
    80003f10:	054080e7          	jalr	84(ra) # 80005f60 <_Z8printIntiii>
    80003f14:	00006517          	auipc	a0,0x6
    80003f18:	49450513          	addi	a0,a0,1172 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80003f1c:	00002097          	auipc	ra,0x2
    80003f20:	e88080e7          	jalr	-376(ra) # 80005da4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f24:	00000493          	li	s1,0
    80003f28:	f99ff06f          	j	80003ec0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003f2c:	00006517          	auipc	a0,0x6
    80003f30:	37c50513          	addi	a0,a0,892 # 8000a2a8 <CONSOLE_STATUS+0x298>
    80003f34:	00002097          	auipc	ra,0x2
    80003f38:	e70080e7          	jalr	-400(ra) # 80005da4 <_Z11printStringPKc>
    finishedA = true;
    80003f3c:	00100793          	li	a5,1
    80003f40:	00009717          	auipc	a4,0x9
    80003f44:	d0f70823          	sb	a5,-752(a4) # 8000cc50 <_ZL9finishedA>
}
    80003f48:	01813083          	ld	ra,24(sp)
    80003f4c:	01013403          	ld	s0,16(sp)
    80003f50:	00813483          	ld	s1,8(sp)
    80003f54:	00013903          	ld	s2,0(sp)
    80003f58:	02010113          	addi	sp,sp,32
    80003f5c:	00008067          	ret

0000000080003f60 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003f60:	fe010113          	addi	sp,sp,-32
    80003f64:	00113c23          	sd	ra,24(sp)
    80003f68:	00813823          	sd	s0,16(sp)
    80003f6c:	00913423          	sd	s1,8(sp)
    80003f70:	01213023          	sd	s2,0(sp)
    80003f74:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003f78:	00000913          	li	s2,0
    80003f7c:	0380006f          	j	80003fb4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003f80:	ffffd097          	auipc	ra,0xffffd
    80003f84:	450080e7          	jalr	1104(ra) # 800013d0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003f88:	00148493          	addi	s1,s1,1
    80003f8c:	000027b7          	lui	a5,0x2
    80003f90:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003f94:	0097ee63          	bltu	a5,s1,80003fb0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003f98:	00000713          	li	a4,0
    80003f9c:	000077b7          	lui	a5,0x7
    80003fa0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003fa4:	fce7eee3          	bltu	a5,a4,80003f80 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003fa8:	00170713          	addi	a4,a4,1
    80003fac:	ff1ff06f          	j	80003f9c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003fb0:	00190913          	addi	s2,s2,1
    80003fb4:	00f00793          	li	a5,15
    80003fb8:	0527e063          	bltu	a5,s2,80003ff8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003fbc:	00006517          	auipc	a0,0x6
    80003fc0:	2fc50513          	addi	a0,a0,764 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    80003fc4:	00002097          	auipc	ra,0x2
    80003fc8:	de0080e7          	jalr	-544(ra) # 80005da4 <_Z11printStringPKc>
    80003fcc:	00000613          	li	a2,0
    80003fd0:	00a00593          	li	a1,10
    80003fd4:	0009051b          	sext.w	a0,s2
    80003fd8:	00002097          	auipc	ra,0x2
    80003fdc:	f88080e7          	jalr	-120(ra) # 80005f60 <_Z8printIntiii>
    80003fe0:	00006517          	auipc	a0,0x6
    80003fe4:	3c850513          	addi	a0,a0,968 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80003fe8:	00002097          	auipc	ra,0x2
    80003fec:	dbc080e7          	jalr	-580(ra) # 80005da4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ff0:	00000493          	li	s1,0
    80003ff4:	f99ff06f          	j	80003f8c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003ff8:	00006517          	auipc	a0,0x6
    80003ffc:	2c850513          	addi	a0,a0,712 # 8000a2c0 <CONSOLE_STATUS+0x2b0>
    80004000:	00002097          	auipc	ra,0x2
    80004004:	da4080e7          	jalr	-604(ra) # 80005da4 <_Z11printStringPKc>
    finishedB = true;
    80004008:	00100793          	li	a5,1
    8000400c:	00009717          	auipc	a4,0x9
    80004010:	c4f702a3          	sb	a5,-955(a4) # 8000cc51 <_ZL9finishedB>
    thread_dispatch();
    80004014:	ffffd097          	auipc	ra,0xffffd
    80004018:	3bc080e7          	jalr	956(ra) # 800013d0 <_Z15thread_dispatchv>
}
    8000401c:	01813083          	ld	ra,24(sp)
    80004020:	01013403          	ld	s0,16(sp)
    80004024:	00813483          	ld	s1,8(sp)
    80004028:	00013903          	ld	s2,0(sp)
    8000402c:	02010113          	addi	sp,sp,32
    80004030:	00008067          	ret

0000000080004034 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004034:	fe010113          	addi	sp,sp,-32
    80004038:	00113c23          	sd	ra,24(sp)
    8000403c:	00813823          	sd	s0,16(sp)
    80004040:	00913423          	sd	s1,8(sp)
    80004044:	01213023          	sd	s2,0(sp)
    80004048:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000404c:	00000493          	li	s1,0
    80004050:	0400006f          	j	80004090 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004054:	00006517          	auipc	a0,0x6
    80004058:	27c50513          	addi	a0,a0,636 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    8000405c:	00002097          	auipc	ra,0x2
    80004060:	d48080e7          	jalr	-696(ra) # 80005da4 <_Z11printStringPKc>
    80004064:	00000613          	li	a2,0
    80004068:	00a00593          	li	a1,10
    8000406c:	00048513          	mv	a0,s1
    80004070:	00002097          	auipc	ra,0x2
    80004074:	ef0080e7          	jalr	-272(ra) # 80005f60 <_Z8printIntiii>
    80004078:	00006517          	auipc	a0,0x6
    8000407c:	33050513          	addi	a0,a0,816 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004080:	00002097          	auipc	ra,0x2
    80004084:	d24080e7          	jalr	-732(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004088:	0014849b          	addiw	s1,s1,1
    8000408c:	0ff4f493          	andi	s1,s1,255
    80004090:	00200793          	li	a5,2
    80004094:	fc97f0e3          	bgeu	a5,s1,80004054 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004098:	00006517          	auipc	a0,0x6
    8000409c:	24050513          	addi	a0,a0,576 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    800040a0:	00002097          	auipc	ra,0x2
    800040a4:	d04080e7          	jalr	-764(ra) # 80005da4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800040a8:	00700313          	li	t1,7
    thread_dispatch();
    800040ac:	ffffd097          	auipc	ra,0xffffd
    800040b0:	324080e7          	jalr	804(ra) # 800013d0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800040b4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800040b8:	00006517          	auipc	a0,0x6
    800040bc:	23050513          	addi	a0,a0,560 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    800040c0:	00002097          	auipc	ra,0x2
    800040c4:	ce4080e7          	jalr	-796(ra) # 80005da4 <_Z11printStringPKc>
    800040c8:	00000613          	li	a2,0
    800040cc:	00a00593          	li	a1,10
    800040d0:	0009051b          	sext.w	a0,s2
    800040d4:	00002097          	auipc	ra,0x2
    800040d8:	e8c080e7          	jalr	-372(ra) # 80005f60 <_Z8printIntiii>
    800040dc:	00006517          	auipc	a0,0x6
    800040e0:	2cc50513          	addi	a0,a0,716 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800040e4:	00002097          	auipc	ra,0x2
    800040e8:	cc0080e7          	jalr	-832(ra) # 80005da4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800040ec:	00c00513          	li	a0,12
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	d30080e7          	jalr	-720(ra) # 80003e20 <_ZL9fibonaccim>
    800040f8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800040fc:	00006517          	auipc	a0,0x6
    80004100:	1f450513          	addi	a0,a0,500 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80004104:	00002097          	auipc	ra,0x2
    80004108:	ca0080e7          	jalr	-864(ra) # 80005da4 <_Z11printStringPKc>
    8000410c:	00000613          	li	a2,0
    80004110:	00a00593          	li	a1,10
    80004114:	0009051b          	sext.w	a0,s2
    80004118:	00002097          	auipc	ra,0x2
    8000411c:	e48080e7          	jalr	-440(ra) # 80005f60 <_Z8printIntiii>
    80004120:	00006517          	auipc	a0,0x6
    80004124:	28850513          	addi	a0,a0,648 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004128:	00002097          	auipc	ra,0x2
    8000412c:	c7c080e7          	jalr	-900(ra) # 80005da4 <_Z11printStringPKc>
    80004130:	0400006f          	j	80004170 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004134:	00006517          	auipc	a0,0x6
    80004138:	19c50513          	addi	a0,a0,412 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    8000413c:	00002097          	auipc	ra,0x2
    80004140:	c68080e7          	jalr	-920(ra) # 80005da4 <_Z11printStringPKc>
    80004144:	00000613          	li	a2,0
    80004148:	00a00593          	li	a1,10
    8000414c:	00048513          	mv	a0,s1
    80004150:	00002097          	auipc	ra,0x2
    80004154:	e10080e7          	jalr	-496(ra) # 80005f60 <_Z8printIntiii>
    80004158:	00006517          	auipc	a0,0x6
    8000415c:	25050513          	addi	a0,a0,592 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004160:	00002097          	auipc	ra,0x2
    80004164:	c44080e7          	jalr	-956(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004168:	0014849b          	addiw	s1,s1,1
    8000416c:	0ff4f493          	andi	s1,s1,255
    80004170:	00500793          	li	a5,5
    80004174:	fc97f0e3          	bgeu	a5,s1,80004134 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80004178:	00006517          	auipc	a0,0x6
    8000417c:	13050513          	addi	a0,a0,304 # 8000a2a8 <CONSOLE_STATUS+0x298>
    80004180:	00002097          	auipc	ra,0x2
    80004184:	c24080e7          	jalr	-988(ra) # 80005da4 <_Z11printStringPKc>
    finishedC = true;
    80004188:	00100793          	li	a5,1
    8000418c:	00009717          	auipc	a4,0x9
    80004190:	acf70323          	sb	a5,-1338(a4) # 8000cc52 <_ZL9finishedC>
    thread_dispatch();
    80004194:	ffffd097          	auipc	ra,0xffffd
    80004198:	23c080e7          	jalr	572(ra) # 800013d0 <_Z15thread_dispatchv>
}
    8000419c:	01813083          	ld	ra,24(sp)
    800041a0:	01013403          	ld	s0,16(sp)
    800041a4:	00813483          	ld	s1,8(sp)
    800041a8:	00013903          	ld	s2,0(sp)
    800041ac:	02010113          	addi	sp,sp,32
    800041b0:	00008067          	ret

00000000800041b4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800041b4:	fe010113          	addi	sp,sp,-32
    800041b8:	00113c23          	sd	ra,24(sp)
    800041bc:	00813823          	sd	s0,16(sp)
    800041c0:	00913423          	sd	s1,8(sp)
    800041c4:	01213023          	sd	s2,0(sp)
    800041c8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800041cc:	00a00493          	li	s1,10
    800041d0:	0400006f          	j	80004210 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800041d4:	00006517          	auipc	a0,0x6
    800041d8:	12c50513          	addi	a0,a0,300 # 8000a300 <CONSOLE_STATUS+0x2f0>
    800041dc:	00002097          	auipc	ra,0x2
    800041e0:	bc8080e7          	jalr	-1080(ra) # 80005da4 <_Z11printStringPKc>
    800041e4:	00000613          	li	a2,0
    800041e8:	00a00593          	li	a1,10
    800041ec:	00048513          	mv	a0,s1
    800041f0:	00002097          	auipc	ra,0x2
    800041f4:	d70080e7          	jalr	-656(ra) # 80005f60 <_Z8printIntiii>
    800041f8:	00006517          	auipc	a0,0x6
    800041fc:	1b050513          	addi	a0,a0,432 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004200:	00002097          	auipc	ra,0x2
    80004204:	ba4080e7          	jalr	-1116(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004208:	0014849b          	addiw	s1,s1,1
    8000420c:	0ff4f493          	andi	s1,s1,255
    80004210:	00c00793          	li	a5,12
    80004214:	fc97f0e3          	bgeu	a5,s1,800041d4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004218:	00006517          	auipc	a0,0x6
    8000421c:	0f050513          	addi	a0,a0,240 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80004220:	00002097          	auipc	ra,0x2
    80004224:	b84080e7          	jalr	-1148(ra) # 80005da4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004228:	00500313          	li	t1,5
    thread_dispatch();
    8000422c:	ffffd097          	auipc	ra,0xffffd
    80004230:	1a4080e7          	jalr	420(ra) # 800013d0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004234:	01000513          	li	a0,16
    80004238:	00000097          	auipc	ra,0x0
    8000423c:	be8080e7          	jalr	-1048(ra) # 80003e20 <_ZL9fibonaccim>
    80004240:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004244:	00006517          	auipc	a0,0x6
    80004248:	0d450513          	addi	a0,a0,212 # 8000a318 <CONSOLE_STATUS+0x308>
    8000424c:	00002097          	auipc	ra,0x2
    80004250:	b58080e7          	jalr	-1192(ra) # 80005da4 <_Z11printStringPKc>
    80004254:	00000613          	li	a2,0
    80004258:	00a00593          	li	a1,10
    8000425c:	0009051b          	sext.w	a0,s2
    80004260:	00002097          	auipc	ra,0x2
    80004264:	d00080e7          	jalr	-768(ra) # 80005f60 <_Z8printIntiii>
    80004268:	00006517          	auipc	a0,0x6
    8000426c:	14050513          	addi	a0,a0,320 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004270:	00002097          	auipc	ra,0x2
    80004274:	b34080e7          	jalr	-1228(ra) # 80005da4 <_Z11printStringPKc>
    80004278:	0400006f          	j	800042b8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000427c:	00006517          	auipc	a0,0x6
    80004280:	08450513          	addi	a0,a0,132 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80004284:	00002097          	auipc	ra,0x2
    80004288:	b20080e7          	jalr	-1248(ra) # 80005da4 <_Z11printStringPKc>
    8000428c:	00000613          	li	a2,0
    80004290:	00a00593          	li	a1,10
    80004294:	00048513          	mv	a0,s1
    80004298:	00002097          	auipc	ra,0x2
    8000429c:	cc8080e7          	jalr	-824(ra) # 80005f60 <_Z8printIntiii>
    800042a0:	00006517          	auipc	a0,0x6
    800042a4:	10850513          	addi	a0,a0,264 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800042a8:	00002097          	auipc	ra,0x2
    800042ac:	afc080e7          	jalr	-1284(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800042b0:	0014849b          	addiw	s1,s1,1
    800042b4:	0ff4f493          	andi	s1,s1,255
    800042b8:	00f00793          	li	a5,15
    800042bc:	fc97f0e3          	bgeu	a5,s1,8000427c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800042c0:	00006517          	auipc	a0,0x6
    800042c4:	06850513          	addi	a0,a0,104 # 8000a328 <CONSOLE_STATUS+0x318>
    800042c8:	00002097          	auipc	ra,0x2
    800042cc:	adc080e7          	jalr	-1316(ra) # 80005da4 <_Z11printStringPKc>
    finishedD = true;
    800042d0:	00100793          	li	a5,1
    800042d4:	00009717          	auipc	a4,0x9
    800042d8:	96f70fa3          	sb	a5,-1665(a4) # 8000cc53 <_ZL9finishedD>
    thread_dispatch();
    800042dc:	ffffd097          	auipc	ra,0xffffd
    800042e0:	0f4080e7          	jalr	244(ra) # 800013d0 <_Z15thread_dispatchv>
}
    800042e4:	01813083          	ld	ra,24(sp)
    800042e8:	01013403          	ld	s0,16(sp)
    800042ec:	00813483          	ld	s1,8(sp)
    800042f0:	00013903          	ld	s2,0(sp)
    800042f4:	02010113          	addi	sp,sp,32
    800042f8:	00008067          	ret

00000000800042fc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800042fc:	fc010113          	addi	sp,sp,-64
    80004300:	02113c23          	sd	ra,56(sp)
    80004304:	02813823          	sd	s0,48(sp)
    80004308:	02913423          	sd	s1,40(sp)
    8000430c:	03213023          	sd	s2,32(sp)
    80004310:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004314:	02000513          	li	a0,32
    80004318:	ffffe097          	auipc	ra,0xffffe
    8000431c:	e38080e7          	jalr	-456(ra) # 80002150 <_Znwm>
    80004320:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	948080e7          	jalr	-1720(ra) # 80001c6c <_ZN6ThreadC1Ev>
    8000432c:	00008797          	auipc	a5,0x8
    80004330:	64478793          	addi	a5,a5,1604 # 8000c970 <_ZTV7WorkerA+0x10>
    80004334:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004338:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000433c:	00006517          	auipc	a0,0x6
    80004340:	ffc50513          	addi	a0,a0,-4 # 8000a338 <CONSOLE_STATUS+0x328>
    80004344:	00002097          	auipc	ra,0x2
    80004348:	a60080e7          	jalr	-1440(ra) # 80005da4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000434c:	02000513          	li	a0,32
    80004350:	ffffe097          	auipc	ra,0xffffe
    80004354:	e00080e7          	jalr	-512(ra) # 80002150 <_Znwm>
    80004358:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000435c:	ffffe097          	auipc	ra,0xffffe
    80004360:	910080e7          	jalr	-1776(ra) # 80001c6c <_ZN6ThreadC1Ev>
    80004364:	00008797          	auipc	a5,0x8
    80004368:	63478793          	addi	a5,a5,1588 # 8000c998 <_ZTV7WorkerB+0x10>
    8000436c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004370:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004374:	00006517          	auipc	a0,0x6
    80004378:	fdc50513          	addi	a0,a0,-36 # 8000a350 <CONSOLE_STATUS+0x340>
    8000437c:	00002097          	auipc	ra,0x2
    80004380:	a28080e7          	jalr	-1496(ra) # 80005da4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004384:	02000513          	li	a0,32
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	dc8080e7          	jalr	-568(ra) # 80002150 <_Znwm>
    80004390:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004394:	ffffe097          	auipc	ra,0xffffe
    80004398:	8d8080e7          	jalr	-1832(ra) # 80001c6c <_ZN6ThreadC1Ev>
    8000439c:	00008797          	auipc	a5,0x8
    800043a0:	62478793          	addi	a5,a5,1572 # 8000c9c0 <_ZTV7WorkerC+0x10>
    800043a4:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800043a8:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800043ac:	00006517          	auipc	a0,0x6
    800043b0:	fbc50513          	addi	a0,a0,-68 # 8000a368 <CONSOLE_STATUS+0x358>
    800043b4:	00002097          	auipc	ra,0x2
    800043b8:	9f0080e7          	jalr	-1552(ra) # 80005da4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800043bc:	02000513          	li	a0,32
    800043c0:	ffffe097          	auipc	ra,0xffffe
    800043c4:	d90080e7          	jalr	-624(ra) # 80002150 <_Znwm>
    800043c8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800043cc:	ffffe097          	auipc	ra,0xffffe
    800043d0:	8a0080e7          	jalr	-1888(ra) # 80001c6c <_ZN6ThreadC1Ev>
    800043d4:	00008797          	auipc	a5,0x8
    800043d8:	61478793          	addi	a5,a5,1556 # 8000c9e8 <_ZTV7WorkerD+0x10>
    800043dc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800043e0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800043e4:	00006517          	auipc	a0,0x6
    800043e8:	f9c50513          	addi	a0,a0,-100 # 8000a380 <CONSOLE_STATUS+0x370>
    800043ec:	00002097          	auipc	ra,0x2
    800043f0:	9b8080e7          	jalr	-1608(ra) # 80005da4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800043f4:	00000493          	li	s1,0
    800043f8:	00300793          	li	a5,3
    800043fc:	0297c663          	blt	a5,s1,80004428 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004400:	00349793          	slli	a5,s1,0x3
    80004404:	fe040713          	addi	a4,s0,-32
    80004408:	00f707b3          	add	a5,a4,a5
    8000440c:	fe07b503          	ld	a0,-32(a5)
    80004410:	ffffe097          	auipc	ra,0xffffe
    80004414:	890080e7          	jalr	-1904(ra) # 80001ca0 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004418:	0014849b          	addiw	s1,s1,1
    8000441c:	fddff06f          	j	800043f8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004420:	ffffe097          	auipc	ra,0xffffe
    80004424:	8d8080e7          	jalr	-1832(ra) # 80001cf8 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004428:	00009797          	auipc	a5,0x9
    8000442c:	8287c783          	lbu	a5,-2008(a5) # 8000cc50 <_ZL9finishedA>
    80004430:	fe0788e3          	beqz	a5,80004420 <_Z20Threads_CPP_API_testv+0x124>
    80004434:	00009797          	auipc	a5,0x9
    80004438:	81d7c783          	lbu	a5,-2019(a5) # 8000cc51 <_ZL9finishedB>
    8000443c:	fe0782e3          	beqz	a5,80004420 <_Z20Threads_CPP_API_testv+0x124>
    80004440:	00009797          	auipc	a5,0x9
    80004444:	8127c783          	lbu	a5,-2030(a5) # 8000cc52 <_ZL9finishedC>
    80004448:	fc078ce3          	beqz	a5,80004420 <_Z20Threads_CPP_API_testv+0x124>
    8000444c:	00009797          	auipc	a5,0x9
    80004450:	8077c783          	lbu	a5,-2041(a5) # 8000cc53 <_ZL9finishedD>
    80004454:	fc0786e3          	beqz	a5,80004420 <_Z20Threads_CPP_API_testv+0x124>
    80004458:	fc040493          	addi	s1,s0,-64
    8000445c:	0080006f          	j	80004464 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80004460:	00848493          	addi	s1,s1,8
    80004464:	fe040793          	addi	a5,s0,-32
    80004468:	08f48663          	beq	s1,a5,800044f4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000446c:	0004b503          	ld	a0,0(s1)
    80004470:	fe0508e3          	beqz	a0,80004460 <_Z20Threads_CPP_API_testv+0x164>
    80004474:	00053783          	ld	a5,0(a0)
    80004478:	0087b783          	ld	a5,8(a5)
    8000447c:	000780e7          	jalr	a5
    80004480:	fe1ff06f          	j	80004460 <_Z20Threads_CPP_API_testv+0x164>
    80004484:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004488:	00048513          	mv	a0,s1
    8000448c:	ffffe097          	auipc	ra,0xffffe
    80004490:	d14080e7          	jalr	-748(ra) # 800021a0 <_ZdlPv>
    80004494:	00090513          	mv	a0,s2
    80004498:	0000a097          	auipc	ra,0xa
    8000449c:	8c0080e7          	jalr	-1856(ra) # 8000dd58 <_Unwind_Resume>
    800044a0:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800044a4:	00048513          	mv	a0,s1
    800044a8:	ffffe097          	auipc	ra,0xffffe
    800044ac:	cf8080e7          	jalr	-776(ra) # 800021a0 <_ZdlPv>
    800044b0:	00090513          	mv	a0,s2
    800044b4:	0000a097          	auipc	ra,0xa
    800044b8:	8a4080e7          	jalr	-1884(ra) # 8000dd58 <_Unwind_Resume>
    800044bc:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800044c0:	00048513          	mv	a0,s1
    800044c4:	ffffe097          	auipc	ra,0xffffe
    800044c8:	cdc080e7          	jalr	-804(ra) # 800021a0 <_ZdlPv>
    800044cc:	00090513          	mv	a0,s2
    800044d0:	0000a097          	auipc	ra,0xa
    800044d4:	888080e7          	jalr	-1912(ra) # 8000dd58 <_Unwind_Resume>
    800044d8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800044dc:	00048513          	mv	a0,s1
    800044e0:	ffffe097          	auipc	ra,0xffffe
    800044e4:	cc0080e7          	jalr	-832(ra) # 800021a0 <_ZdlPv>
    800044e8:	00090513          	mv	a0,s2
    800044ec:	0000a097          	auipc	ra,0xa
    800044f0:	86c080e7          	jalr	-1940(ra) # 8000dd58 <_Unwind_Resume>
}
    800044f4:	03813083          	ld	ra,56(sp)
    800044f8:	03013403          	ld	s0,48(sp)
    800044fc:	02813483          	ld	s1,40(sp)
    80004500:	02013903          	ld	s2,32(sp)
    80004504:	04010113          	addi	sp,sp,64
    80004508:	00008067          	ret

000000008000450c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000450c:	ff010113          	addi	sp,sp,-16
    80004510:	00113423          	sd	ra,8(sp)
    80004514:	00813023          	sd	s0,0(sp)
    80004518:	01010413          	addi	s0,sp,16
    8000451c:	00008797          	auipc	a5,0x8
    80004520:	45478793          	addi	a5,a5,1108 # 8000c970 <_ZTV7WorkerA+0x10>
    80004524:	00f53023          	sd	a5,0(a0)
    80004528:	ffffd097          	auipc	ra,0xffffd
    8000452c:	674080e7          	jalr	1652(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004530:	00813083          	ld	ra,8(sp)
    80004534:	00013403          	ld	s0,0(sp)
    80004538:	01010113          	addi	sp,sp,16
    8000453c:	00008067          	ret

0000000080004540 <_ZN7WorkerAD0Ev>:
    80004540:	fe010113          	addi	sp,sp,-32
    80004544:	00113c23          	sd	ra,24(sp)
    80004548:	00813823          	sd	s0,16(sp)
    8000454c:	00913423          	sd	s1,8(sp)
    80004550:	02010413          	addi	s0,sp,32
    80004554:	00050493          	mv	s1,a0
    80004558:	00008797          	auipc	a5,0x8
    8000455c:	41878793          	addi	a5,a5,1048 # 8000c970 <_ZTV7WorkerA+0x10>
    80004560:	00f53023          	sd	a5,0(a0)
    80004564:	ffffd097          	auipc	ra,0xffffd
    80004568:	638080e7          	jalr	1592(ra) # 80001b9c <_ZN6ThreadD1Ev>
    8000456c:	00048513          	mv	a0,s1
    80004570:	ffffe097          	auipc	ra,0xffffe
    80004574:	c30080e7          	jalr	-976(ra) # 800021a0 <_ZdlPv>
    80004578:	01813083          	ld	ra,24(sp)
    8000457c:	01013403          	ld	s0,16(sp)
    80004580:	00813483          	ld	s1,8(sp)
    80004584:	02010113          	addi	sp,sp,32
    80004588:	00008067          	ret

000000008000458c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000458c:	ff010113          	addi	sp,sp,-16
    80004590:	00113423          	sd	ra,8(sp)
    80004594:	00813023          	sd	s0,0(sp)
    80004598:	01010413          	addi	s0,sp,16
    8000459c:	00008797          	auipc	a5,0x8
    800045a0:	3fc78793          	addi	a5,a5,1020 # 8000c998 <_ZTV7WorkerB+0x10>
    800045a4:	00f53023          	sd	a5,0(a0)
    800045a8:	ffffd097          	auipc	ra,0xffffd
    800045ac:	5f4080e7          	jalr	1524(ra) # 80001b9c <_ZN6ThreadD1Ev>
    800045b0:	00813083          	ld	ra,8(sp)
    800045b4:	00013403          	ld	s0,0(sp)
    800045b8:	01010113          	addi	sp,sp,16
    800045bc:	00008067          	ret

00000000800045c0 <_ZN7WorkerBD0Ev>:
    800045c0:	fe010113          	addi	sp,sp,-32
    800045c4:	00113c23          	sd	ra,24(sp)
    800045c8:	00813823          	sd	s0,16(sp)
    800045cc:	00913423          	sd	s1,8(sp)
    800045d0:	02010413          	addi	s0,sp,32
    800045d4:	00050493          	mv	s1,a0
    800045d8:	00008797          	auipc	a5,0x8
    800045dc:	3c078793          	addi	a5,a5,960 # 8000c998 <_ZTV7WorkerB+0x10>
    800045e0:	00f53023          	sd	a5,0(a0)
    800045e4:	ffffd097          	auipc	ra,0xffffd
    800045e8:	5b8080e7          	jalr	1464(ra) # 80001b9c <_ZN6ThreadD1Ev>
    800045ec:	00048513          	mv	a0,s1
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	bb0080e7          	jalr	-1104(ra) # 800021a0 <_ZdlPv>
    800045f8:	01813083          	ld	ra,24(sp)
    800045fc:	01013403          	ld	s0,16(sp)
    80004600:	00813483          	ld	s1,8(sp)
    80004604:	02010113          	addi	sp,sp,32
    80004608:	00008067          	ret

000000008000460c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000460c:	ff010113          	addi	sp,sp,-16
    80004610:	00113423          	sd	ra,8(sp)
    80004614:	00813023          	sd	s0,0(sp)
    80004618:	01010413          	addi	s0,sp,16
    8000461c:	00008797          	auipc	a5,0x8
    80004620:	3a478793          	addi	a5,a5,932 # 8000c9c0 <_ZTV7WorkerC+0x10>
    80004624:	00f53023          	sd	a5,0(a0)
    80004628:	ffffd097          	auipc	ra,0xffffd
    8000462c:	574080e7          	jalr	1396(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004630:	00813083          	ld	ra,8(sp)
    80004634:	00013403          	ld	s0,0(sp)
    80004638:	01010113          	addi	sp,sp,16
    8000463c:	00008067          	ret

0000000080004640 <_ZN7WorkerCD0Ev>:
    80004640:	fe010113          	addi	sp,sp,-32
    80004644:	00113c23          	sd	ra,24(sp)
    80004648:	00813823          	sd	s0,16(sp)
    8000464c:	00913423          	sd	s1,8(sp)
    80004650:	02010413          	addi	s0,sp,32
    80004654:	00050493          	mv	s1,a0
    80004658:	00008797          	auipc	a5,0x8
    8000465c:	36878793          	addi	a5,a5,872 # 8000c9c0 <_ZTV7WorkerC+0x10>
    80004660:	00f53023          	sd	a5,0(a0)
    80004664:	ffffd097          	auipc	ra,0xffffd
    80004668:	538080e7          	jalr	1336(ra) # 80001b9c <_ZN6ThreadD1Ev>
    8000466c:	00048513          	mv	a0,s1
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	b30080e7          	jalr	-1232(ra) # 800021a0 <_ZdlPv>
    80004678:	01813083          	ld	ra,24(sp)
    8000467c:	01013403          	ld	s0,16(sp)
    80004680:	00813483          	ld	s1,8(sp)
    80004684:	02010113          	addi	sp,sp,32
    80004688:	00008067          	ret

000000008000468c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000468c:	ff010113          	addi	sp,sp,-16
    80004690:	00113423          	sd	ra,8(sp)
    80004694:	00813023          	sd	s0,0(sp)
    80004698:	01010413          	addi	s0,sp,16
    8000469c:	00008797          	auipc	a5,0x8
    800046a0:	34c78793          	addi	a5,a5,844 # 8000c9e8 <_ZTV7WorkerD+0x10>
    800046a4:	00f53023          	sd	a5,0(a0)
    800046a8:	ffffd097          	auipc	ra,0xffffd
    800046ac:	4f4080e7          	jalr	1268(ra) # 80001b9c <_ZN6ThreadD1Ev>
    800046b0:	00813083          	ld	ra,8(sp)
    800046b4:	00013403          	ld	s0,0(sp)
    800046b8:	01010113          	addi	sp,sp,16
    800046bc:	00008067          	ret

00000000800046c0 <_ZN7WorkerDD0Ev>:
    800046c0:	fe010113          	addi	sp,sp,-32
    800046c4:	00113c23          	sd	ra,24(sp)
    800046c8:	00813823          	sd	s0,16(sp)
    800046cc:	00913423          	sd	s1,8(sp)
    800046d0:	02010413          	addi	s0,sp,32
    800046d4:	00050493          	mv	s1,a0
    800046d8:	00008797          	auipc	a5,0x8
    800046dc:	31078793          	addi	a5,a5,784 # 8000c9e8 <_ZTV7WorkerD+0x10>
    800046e0:	00f53023          	sd	a5,0(a0)
    800046e4:	ffffd097          	auipc	ra,0xffffd
    800046e8:	4b8080e7          	jalr	1208(ra) # 80001b9c <_ZN6ThreadD1Ev>
    800046ec:	00048513          	mv	a0,s1
    800046f0:	ffffe097          	auipc	ra,0xffffe
    800046f4:	ab0080e7          	jalr	-1360(ra) # 800021a0 <_ZdlPv>
    800046f8:	01813083          	ld	ra,24(sp)
    800046fc:	01013403          	ld	s0,16(sp)
    80004700:	00813483          	ld	s1,8(sp)
    80004704:	02010113          	addi	sp,sp,32
    80004708:	00008067          	ret

000000008000470c <_ZN7WorkerA3runEv>:
    void run() override {
    8000470c:	ff010113          	addi	sp,sp,-16
    80004710:	00113423          	sd	ra,8(sp)
    80004714:	00813023          	sd	s0,0(sp)
    80004718:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000471c:	00000593          	li	a1,0
    80004720:	fffff097          	auipc	ra,0xfffff
    80004724:	774080e7          	jalr	1908(ra) # 80003e94 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004728:	00813083          	ld	ra,8(sp)
    8000472c:	00013403          	ld	s0,0(sp)
    80004730:	01010113          	addi	sp,sp,16
    80004734:	00008067          	ret

0000000080004738 <_ZN7WorkerB3runEv>:
    void run() override {
    80004738:	ff010113          	addi	sp,sp,-16
    8000473c:	00113423          	sd	ra,8(sp)
    80004740:	00813023          	sd	s0,0(sp)
    80004744:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004748:	00000593          	li	a1,0
    8000474c:	00000097          	auipc	ra,0x0
    80004750:	814080e7          	jalr	-2028(ra) # 80003f60 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004754:	00813083          	ld	ra,8(sp)
    80004758:	00013403          	ld	s0,0(sp)
    8000475c:	01010113          	addi	sp,sp,16
    80004760:	00008067          	ret

0000000080004764 <_ZN7WorkerC3runEv>:
    void run() override {
    80004764:	ff010113          	addi	sp,sp,-16
    80004768:	00113423          	sd	ra,8(sp)
    8000476c:	00813023          	sd	s0,0(sp)
    80004770:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004774:	00000593          	li	a1,0
    80004778:	00000097          	auipc	ra,0x0
    8000477c:	8bc080e7          	jalr	-1860(ra) # 80004034 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004780:	00813083          	ld	ra,8(sp)
    80004784:	00013403          	ld	s0,0(sp)
    80004788:	01010113          	addi	sp,sp,16
    8000478c:	00008067          	ret

0000000080004790 <_ZN7WorkerD3runEv>:
    void run() override {
    80004790:	ff010113          	addi	sp,sp,-16
    80004794:	00113423          	sd	ra,8(sp)
    80004798:	00813023          	sd	s0,0(sp)
    8000479c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800047a0:	00000593          	li	a1,0
    800047a4:	00000097          	auipc	ra,0x0
    800047a8:	a10080e7          	jalr	-1520(ra) # 800041b4 <_ZN7WorkerD11workerBodyDEPv>
    }
    800047ac:	00813083          	ld	ra,8(sp)
    800047b0:	00013403          	ld	s0,0(sp)
    800047b4:	01010113          	addi	sp,sp,16
    800047b8:	00008067          	ret

00000000800047bc <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800047bc:	f8010113          	addi	sp,sp,-128
    800047c0:	06113c23          	sd	ra,120(sp)
    800047c4:	06813823          	sd	s0,112(sp)
    800047c8:	06913423          	sd	s1,104(sp)
    800047cc:	07213023          	sd	s2,96(sp)
    800047d0:	05313c23          	sd	s3,88(sp)
    800047d4:	05413823          	sd	s4,80(sp)
    800047d8:	05513423          	sd	s5,72(sp)
    800047dc:	05613023          	sd	s6,64(sp)
    800047e0:	03713c23          	sd	s7,56(sp)
    800047e4:	03813823          	sd	s8,48(sp)
    800047e8:	03913423          	sd	s9,40(sp)
    800047ec:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800047f0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800047f4:	00006517          	auipc	a0,0x6
    800047f8:	9c450513          	addi	a0,a0,-1596 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    800047fc:	00001097          	auipc	ra,0x1
    80004800:	5a8080e7          	jalr	1448(ra) # 80005da4 <_Z11printStringPKc>
    getString(input, 30);
    80004804:	01e00593          	li	a1,30
    80004808:	f8040493          	addi	s1,s0,-128
    8000480c:	00048513          	mv	a0,s1
    80004810:	00001097          	auipc	ra,0x1
    80004814:	61c080e7          	jalr	1564(ra) # 80005e2c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004818:	00048513          	mv	a0,s1
    8000481c:	00001097          	auipc	ra,0x1
    80004820:	6f4080e7          	jalr	1780(ra) # 80005f10 <_Z11stringToIntPKc>
    80004824:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004828:	00006517          	auipc	a0,0x6
    8000482c:	9b050513          	addi	a0,a0,-1616 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80004830:	00001097          	auipc	ra,0x1
    80004834:	574080e7          	jalr	1396(ra) # 80005da4 <_Z11printStringPKc>
    getString(input, 30);
    80004838:	01e00593          	li	a1,30
    8000483c:	00048513          	mv	a0,s1
    80004840:	00001097          	auipc	ra,0x1
    80004844:	5ec080e7          	jalr	1516(ra) # 80005e2c <_Z9getStringPci>
    n = stringToInt(input);
    80004848:	00048513          	mv	a0,s1
    8000484c:	00001097          	auipc	ra,0x1
    80004850:	6c4080e7          	jalr	1732(ra) # 80005f10 <_Z11stringToIntPKc>
    80004854:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004858:	00006517          	auipc	a0,0x6
    8000485c:	9a050513          	addi	a0,a0,-1632 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80004860:	00001097          	auipc	ra,0x1
    80004864:	544080e7          	jalr	1348(ra) # 80005da4 <_Z11printStringPKc>
    printInt(threadNum);
    80004868:	00000613          	li	a2,0
    8000486c:	00a00593          	li	a1,10
    80004870:	00098513          	mv	a0,s3
    80004874:	00001097          	auipc	ra,0x1
    80004878:	6ec080e7          	jalr	1772(ra) # 80005f60 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000487c:	00006517          	auipc	a0,0x6
    80004880:	99450513          	addi	a0,a0,-1644 # 8000a210 <CONSOLE_STATUS+0x200>
    80004884:	00001097          	auipc	ra,0x1
    80004888:	520080e7          	jalr	1312(ra) # 80005da4 <_Z11printStringPKc>
    printInt(n);
    8000488c:	00000613          	li	a2,0
    80004890:	00a00593          	li	a1,10
    80004894:	00048513          	mv	a0,s1
    80004898:	00001097          	auipc	ra,0x1
    8000489c:	6c8080e7          	jalr	1736(ra) # 80005f60 <_Z8printIntiii>
    printString(".\n");
    800048a0:	00006517          	auipc	a0,0x6
    800048a4:	98850513          	addi	a0,a0,-1656 # 8000a228 <CONSOLE_STATUS+0x218>
    800048a8:	00001097          	auipc	ra,0x1
    800048ac:	4fc080e7          	jalr	1276(ra) # 80005da4 <_Z11printStringPKc>
    if (threadNum > n) {
    800048b0:	0334c463          	blt	s1,s3,800048d8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800048b4:	03305c63          	blez	s3,800048ec <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800048b8:	03800513          	li	a0,56
    800048bc:	ffffe097          	auipc	ra,0xffffe
    800048c0:	894080e7          	jalr	-1900(ra) # 80002150 <_Znwm>
    800048c4:	00050a93          	mv	s5,a0
    800048c8:	00048593          	mv	a1,s1
    800048cc:	00001097          	auipc	ra,0x1
    800048d0:	7b4080e7          	jalr	1972(ra) # 80006080 <_ZN9BufferCPPC1Ei>
    800048d4:	0300006f          	j	80004904 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800048d8:	00006517          	auipc	a0,0x6
    800048dc:	95850513          	addi	a0,a0,-1704 # 8000a230 <CONSOLE_STATUS+0x220>
    800048e0:	00001097          	auipc	ra,0x1
    800048e4:	4c4080e7          	jalr	1220(ra) # 80005da4 <_Z11printStringPKc>
        return;
    800048e8:	0140006f          	j	800048fc <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800048ec:	00006517          	auipc	a0,0x6
    800048f0:	98450513          	addi	a0,a0,-1660 # 8000a270 <CONSOLE_STATUS+0x260>
    800048f4:	00001097          	auipc	ra,0x1
    800048f8:	4b0080e7          	jalr	1200(ra) # 80005da4 <_Z11printStringPKc>
        return;
    800048fc:	000c0113          	mv	sp,s8
    80004900:	2140006f          	j	80004b14 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004904:	01000513          	li	a0,16
    80004908:	ffffe097          	auipc	ra,0xffffe
    8000490c:	848080e7          	jalr	-1976(ra) # 80002150 <_Znwm>
    80004910:	00050913          	mv	s2,a0
    80004914:	00000593          	li	a1,0
    80004918:	ffffd097          	auipc	ra,0xffffd
    8000491c:	eec080e7          	jalr	-276(ra) # 80001804 <_ZN9SemaphoreC1Ej>
    80004920:	00008797          	auipc	a5,0x8
    80004924:	3527b023          	sd	s2,832(a5) # 8000cc60 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004928:	00399793          	slli	a5,s3,0x3
    8000492c:	00f78793          	addi	a5,a5,15
    80004930:	ff07f793          	andi	a5,a5,-16
    80004934:	40f10133          	sub	sp,sp,a5
    80004938:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000493c:	0019871b          	addiw	a4,s3,1
    80004940:	00171793          	slli	a5,a4,0x1
    80004944:	00e787b3          	add	a5,a5,a4
    80004948:	00379793          	slli	a5,a5,0x3
    8000494c:	00f78793          	addi	a5,a5,15
    80004950:	ff07f793          	andi	a5,a5,-16
    80004954:	40f10133          	sub	sp,sp,a5
    80004958:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000495c:	00199493          	slli	s1,s3,0x1
    80004960:	013484b3          	add	s1,s1,s3
    80004964:	00349493          	slli	s1,s1,0x3
    80004968:	009b04b3          	add	s1,s6,s1
    8000496c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004970:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004974:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004978:	02800513          	li	a0,40
    8000497c:	ffffd097          	auipc	ra,0xffffd
    80004980:	7d4080e7          	jalr	2004(ra) # 80002150 <_Znwm>
    80004984:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004988:	ffffd097          	auipc	ra,0xffffd
    8000498c:	2e4080e7          	jalr	740(ra) # 80001c6c <_ZN6ThreadC1Ev>
    80004990:	00008797          	auipc	a5,0x8
    80004994:	0d078793          	addi	a5,a5,208 # 8000ca60 <_ZTV8Consumer+0x10>
    80004998:	00fbb023          	sd	a5,0(s7)
    8000499c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800049a0:	000b8513          	mv	a0,s7
    800049a4:	ffffd097          	auipc	ra,0xffffd
    800049a8:	2fc080e7          	jalr	764(ra) # 80001ca0 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800049ac:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800049b0:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800049b4:	00008797          	auipc	a5,0x8
    800049b8:	2ac7b783          	ld	a5,684(a5) # 8000cc60 <_ZL10waitForAll>
    800049bc:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800049c0:	02800513          	li	a0,40
    800049c4:	ffffd097          	auipc	ra,0xffffd
    800049c8:	78c080e7          	jalr	1932(ra) # 80002150 <_Znwm>
    800049cc:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800049d0:	ffffd097          	auipc	ra,0xffffd
    800049d4:	29c080e7          	jalr	668(ra) # 80001c6c <_ZN6ThreadC1Ev>
    800049d8:	00008797          	auipc	a5,0x8
    800049dc:	03878793          	addi	a5,a5,56 # 8000ca10 <_ZTV16ProducerKeyborad+0x10>
    800049e0:	00f4b023          	sd	a5,0(s1)
    800049e4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800049e8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800049ec:	00048513          	mv	a0,s1
    800049f0:	ffffd097          	auipc	ra,0xffffd
    800049f4:	2b0080e7          	jalr	688(ra) # 80001ca0 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800049f8:	00100913          	li	s2,1
    800049fc:	0300006f          	j	80004a2c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004a00:	00008797          	auipc	a5,0x8
    80004a04:	03878793          	addi	a5,a5,56 # 8000ca38 <_ZTV8Producer+0x10>
    80004a08:	00fcb023          	sd	a5,0(s9)
    80004a0c:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004a10:	00391793          	slli	a5,s2,0x3
    80004a14:	00fa07b3          	add	a5,s4,a5
    80004a18:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004a1c:	000c8513          	mv	a0,s9
    80004a20:	ffffd097          	auipc	ra,0xffffd
    80004a24:	280080e7          	jalr	640(ra) # 80001ca0 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004a28:	0019091b          	addiw	s2,s2,1
    80004a2c:	05395263          	bge	s2,s3,80004a70 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004a30:	00191493          	slli	s1,s2,0x1
    80004a34:	012484b3          	add	s1,s1,s2
    80004a38:	00349493          	slli	s1,s1,0x3
    80004a3c:	009b04b3          	add	s1,s6,s1
    80004a40:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004a44:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004a48:	00008797          	auipc	a5,0x8
    80004a4c:	2187b783          	ld	a5,536(a5) # 8000cc60 <_ZL10waitForAll>
    80004a50:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004a54:	02800513          	li	a0,40
    80004a58:	ffffd097          	auipc	ra,0xffffd
    80004a5c:	6f8080e7          	jalr	1784(ra) # 80002150 <_Znwm>
    80004a60:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004a64:	ffffd097          	auipc	ra,0xffffd
    80004a68:	208080e7          	jalr	520(ra) # 80001c6c <_ZN6ThreadC1Ev>
    80004a6c:	f95ff06f          	j	80004a00 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004a70:	ffffd097          	auipc	ra,0xffffd
    80004a74:	288080e7          	jalr	648(ra) # 80001cf8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004a78:	00000493          	li	s1,0
    80004a7c:	0099ce63          	blt	s3,s1,80004a98 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004a80:	00008517          	auipc	a0,0x8
    80004a84:	1e053503          	ld	a0,480(a0) # 8000cc60 <_ZL10waitForAll>
    80004a88:	ffffd097          	auipc	ra,0xffffd
    80004a8c:	db8080e7          	jalr	-584(ra) # 80001840 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004a90:	0014849b          	addiw	s1,s1,1
    80004a94:	fe9ff06f          	j	80004a7c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004a98:	00008517          	auipc	a0,0x8
    80004a9c:	1c853503          	ld	a0,456(a0) # 8000cc60 <_ZL10waitForAll>
    80004aa0:	00050863          	beqz	a0,80004ab0 <_Z20testConsumerProducerv+0x2f4>
    80004aa4:	00053783          	ld	a5,0(a0)
    80004aa8:	0087b783          	ld	a5,8(a5)
    80004aac:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004ab0:	00000493          	li	s1,0
    80004ab4:	0080006f          	j	80004abc <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004ab8:	0014849b          	addiw	s1,s1,1
    80004abc:	0334d263          	bge	s1,s3,80004ae0 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004ac0:	00349793          	slli	a5,s1,0x3
    80004ac4:	00fa07b3          	add	a5,s4,a5
    80004ac8:	0007b503          	ld	a0,0(a5)
    80004acc:	fe0506e3          	beqz	a0,80004ab8 <_Z20testConsumerProducerv+0x2fc>
    80004ad0:	00053783          	ld	a5,0(a0)
    80004ad4:	0087b783          	ld	a5,8(a5)
    80004ad8:	000780e7          	jalr	a5
    80004adc:	fddff06f          	j	80004ab8 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004ae0:	000b8a63          	beqz	s7,80004af4 <_Z20testConsumerProducerv+0x338>
    80004ae4:	000bb783          	ld	a5,0(s7)
    80004ae8:	0087b783          	ld	a5,8(a5)
    80004aec:	000b8513          	mv	a0,s7
    80004af0:	000780e7          	jalr	a5
    delete buffer;
    80004af4:	000a8e63          	beqz	s5,80004b10 <_Z20testConsumerProducerv+0x354>
    80004af8:	000a8513          	mv	a0,s5
    80004afc:	00002097          	auipc	ra,0x2
    80004b00:	87c080e7          	jalr	-1924(ra) # 80006378 <_ZN9BufferCPPD1Ev>
    80004b04:	000a8513          	mv	a0,s5
    80004b08:	ffffd097          	auipc	ra,0xffffd
    80004b0c:	698080e7          	jalr	1688(ra) # 800021a0 <_ZdlPv>
    80004b10:	000c0113          	mv	sp,s8
}
    80004b14:	f8040113          	addi	sp,s0,-128
    80004b18:	07813083          	ld	ra,120(sp)
    80004b1c:	07013403          	ld	s0,112(sp)
    80004b20:	06813483          	ld	s1,104(sp)
    80004b24:	06013903          	ld	s2,96(sp)
    80004b28:	05813983          	ld	s3,88(sp)
    80004b2c:	05013a03          	ld	s4,80(sp)
    80004b30:	04813a83          	ld	s5,72(sp)
    80004b34:	04013b03          	ld	s6,64(sp)
    80004b38:	03813b83          	ld	s7,56(sp)
    80004b3c:	03013c03          	ld	s8,48(sp)
    80004b40:	02813c83          	ld	s9,40(sp)
    80004b44:	08010113          	addi	sp,sp,128
    80004b48:	00008067          	ret
    80004b4c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004b50:	000a8513          	mv	a0,s5
    80004b54:	ffffd097          	auipc	ra,0xffffd
    80004b58:	64c080e7          	jalr	1612(ra) # 800021a0 <_ZdlPv>
    80004b5c:	00048513          	mv	a0,s1
    80004b60:	00009097          	auipc	ra,0x9
    80004b64:	1f8080e7          	jalr	504(ra) # 8000dd58 <_Unwind_Resume>
    80004b68:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004b6c:	00090513          	mv	a0,s2
    80004b70:	ffffd097          	auipc	ra,0xffffd
    80004b74:	630080e7          	jalr	1584(ra) # 800021a0 <_ZdlPv>
    80004b78:	00048513          	mv	a0,s1
    80004b7c:	00009097          	auipc	ra,0x9
    80004b80:	1dc080e7          	jalr	476(ra) # 8000dd58 <_Unwind_Resume>
    80004b84:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004b88:	000b8513          	mv	a0,s7
    80004b8c:	ffffd097          	auipc	ra,0xffffd
    80004b90:	614080e7          	jalr	1556(ra) # 800021a0 <_ZdlPv>
    80004b94:	00048513          	mv	a0,s1
    80004b98:	00009097          	auipc	ra,0x9
    80004b9c:	1c0080e7          	jalr	448(ra) # 8000dd58 <_Unwind_Resume>
    80004ba0:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004ba4:	00048513          	mv	a0,s1
    80004ba8:	ffffd097          	auipc	ra,0xffffd
    80004bac:	5f8080e7          	jalr	1528(ra) # 800021a0 <_ZdlPv>
    80004bb0:	00090513          	mv	a0,s2
    80004bb4:	00009097          	auipc	ra,0x9
    80004bb8:	1a4080e7          	jalr	420(ra) # 8000dd58 <_Unwind_Resume>
    80004bbc:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004bc0:	000c8513          	mv	a0,s9
    80004bc4:	ffffd097          	auipc	ra,0xffffd
    80004bc8:	5dc080e7          	jalr	1500(ra) # 800021a0 <_ZdlPv>
    80004bcc:	00048513          	mv	a0,s1
    80004bd0:	00009097          	auipc	ra,0x9
    80004bd4:	188080e7          	jalr	392(ra) # 8000dd58 <_Unwind_Resume>

0000000080004bd8 <_ZN8Consumer3runEv>:
    void run() override {
    80004bd8:	fd010113          	addi	sp,sp,-48
    80004bdc:	02113423          	sd	ra,40(sp)
    80004be0:	02813023          	sd	s0,32(sp)
    80004be4:	00913c23          	sd	s1,24(sp)
    80004be8:	01213823          	sd	s2,16(sp)
    80004bec:	01313423          	sd	s3,8(sp)
    80004bf0:	03010413          	addi	s0,sp,48
    80004bf4:	00050913          	mv	s2,a0
        int i = 0;
    80004bf8:	00000993          	li	s3,0
    80004bfc:	0100006f          	j	80004c0c <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004c00:	00a00513          	li	a0,10
    80004c04:	ffffd097          	auipc	ra,0xffffd
    80004c08:	244080e7          	jalr	580(ra) # 80001e48 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004c0c:	00008797          	auipc	a5,0x8
    80004c10:	04c7a783          	lw	a5,76(a5) # 8000cc58 <_ZL9threadEnd>
    80004c14:	04079a63          	bnez	a5,80004c68 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004c18:	02093783          	ld	a5,32(s2)
    80004c1c:	0087b503          	ld	a0,8(a5)
    80004c20:	00001097          	auipc	ra,0x1
    80004c24:	644080e7          	jalr	1604(ra) # 80006264 <_ZN9BufferCPP3getEv>
            i++;
    80004c28:	0019849b          	addiw	s1,s3,1
    80004c2c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004c30:	0ff57513          	andi	a0,a0,255
    80004c34:	ffffd097          	auipc	ra,0xffffd
    80004c38:	214080e7          	jalr	532(ra) # 80001e48 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004c3c:	05000793          	li	a5,80
    80004c40:	02f4e4bb          	remw	s1,s1,a5
    80004c44:	fc0494e3          	bnez	s1,80004c0c <_ZN8Consumer3runEv+0x34>
    80004c48:	fb9ff06f          	j	80004c00 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004c4c:	02093783          	ld	a5,32(s2)
    80004c50:	0087b503          	ld	a0,8(a5)
    80004c54:	00001097          	auipc	ra,0x1
    80004c58:	610080e7          	jalr	1552(ra) # 80006264 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004c5c:	0ff57513          	andi	a0,a0,255
    80004c60:	ffffd097          	auipc	ra,0xffffd
    80004c64:	1e8080e7          	jalr	488(ra) # 80001e48 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004c68:	02093783          	ld	a5,32(s2)
    80004c6c:	0087b503          	ld	a0,8(a5)
    80004c70:	00001097          	auipc	ra,0x1
    80004c74:	680080e7          	jalr	1664(ra) # 800062f0 <_ZN9BufferCPP6getCntEv>
    80004c78:	fca04ae3          	bgtz	a0,80004c4c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004c7c:	02093783          	ld	a5,32(s2)
    80004c80:	0107b503          	ld	a0,16(a5)
    80004c84:	ffffd097          	auipc	ra,0xffffd
    80004c88:	be8080e7          	jalr	-1048(ra) # 8000186c <_ZN9Semaphore6signalEv>
    }
    80004c8c:	02813083          	ld	ra,40(sp)
    80004c90:	02013403          	ld	s0,32(sp)
    80004c94:	01813483          	ld	s1,24(sp)
    80004c98:	01013903          	ld	s2,16(sp)
    80004c9c:	00813983          	ld	s3,8(sp)
    80004ca0:	03010113          	addi	sp,sp,48
    80004ca4:	00008067          	ret

0000000080004ca8 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004ca8:	ff010113          	addi	sp,sp,-16
    80004cac:	00113423          	sd	ra,8(sp)
    80004cb0:	00813023          	sd	s0,0(sp)
    80004cb4:	01010413          	addi	s0,sp,16
    80004cb8:	00008797          	auipc	a5,0x8
    80004cbc:	da878793          	addi	a5,a5,-600 # 8000ca60 <_ZTV8Consumer+0x10>
    80004cc0:	00f53023          	sd	a5,0(a0)
    80004cc4:	ffffd097          	auipc	ra,0xffffd
    80004cc8:	ed8080e7          	jalr	-296(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004ccc:	00813083          	ld	ra,8(sp)
    80004cd0:	00013403          	ld	s0,0(sp)
    80004cd4:	01010113          	addi	sp,sp,16
    80004cd8:	00008067          	ret

0000000080004cdc <_ZN8ConsumerD0Ev>:
    80004cdc:	fe010113          	addi	sp,sp,-32
    80004ce0:	00113c23          	sd	ra,24(sp)
    80004ce4:	00813823          	sd	s0,16(sp)
    80004ce8:	00913423          	sd	s1,8(sp)
    80004cec:	02010413          	addi	s0,sp,32
    80004cf0:	00050493          	mv	s1,a0
    80004cf4:	00008797          	auipc	a5,0x8
    80004cf8:	d6c78793          	addi	a5,a5,-660 # 8000ca60 <_ZTV8Consumer+0x10>
    80004cfc:	00f53023          	sd	a5,0(a0)
    80004d00:	ffffd097          	auipc	ra,0xffffd
    80004d04:	e9c080e7          	jalr	-356(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004d08:	00048513          	mv	a0,s1
    80004d0c:	ffffd097          	auipc	ra,0xffffd
    80004d10:	494080e7          	jalr	1172(ra) # 800021a0 <_ZdlPv>
    80004d14:	01813083          	ld	ra,24(sp)
    80004d18:	01013403          	ld	s0,16(sp)
    80004d1c:	00813483          	ld	s1,8(sp)
    80004d20:	02010113          	addi	sp,sp,32
    80004d24:	00008067          	ret

0000000080004d28 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004d28:	ff010113          	addi	sp,sp,-16
    80004d2c:	00113423          	sd	ra,8(sp)
    80004d30:	00813023          	sd	s0,0(sp)
    80004d34:	01010413          	addi	s0,sp,16
    80004d38:	00008797          	auipc	a5,0x8
    80004d3c:	cd878793          	addi	a5,a5,-808 # 8000ca10 <_ZTV16ProducerKeyborad+0x10>
    80004d40:	00f53023          	sd	a5,0(a0)
    80004d44:	ffffd097          	auipc	ra,0xffffd
    80004d48:	e58080e7          	jalr	-424(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004d4c:	00813083          	ld	ra,8(sp)
    80004d50:	00013403          	ld	s0,0(sp)
    80004d54:	01010113          	addi	sp,sp,16
    80004d58:	00008067          	ret

0000000080004d5c <_ZN16ProducerKeyboradD0Ev>:
    80004d5c:	fe010113          	addi	sp,sp,-32
    80004d60:	00113c23          	sd	ra,24(sp)
    80004d64:	00813823          	sd	s0,16(sp)
    80004d68:	00913423          	sd	s1,8(sp)
    80004d6c:	02010413          	addi	s0,sp,32
    80004d70:	00050493          	mv	s1,a0
    80004d74:	00008797          	auipc	a5,0x8
    80004d78:	c9c78793          	addi	a5,a5,-868 # 8000ca10 <_ZTV16ProducerKeyborad+0x10>
    80004d7c:	00f53023          	sd	a5,0(a0)
    80004d80:	ffffd097          	auipc	ra,0xffffd
    80004d84:	e1c080e7          	jalr	-484(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004d88:	00048513          	mv	a0,s1
    80004d8c:	ffffd097          	auipc	ra,0xffffd
    80004d90:	414080e7          	jalr	1044(ra) # 800021a0 <_ZdlPv>
    80004d94:	01813083          	ld	ra,24(sp)
    80004d98:	01013403          	ld	s0,16(sp)
    80004d9c:	00813483          	ld	s1,8(sp)
    80004da0:	02010113          	addi	sp,sp,32
    80004da4:	00008067          	ret

0000000080004da8 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004da8:	ff010113          	addi	sp,sp,-16
    80004dac:	00113423          	sd	ra,8(sp)
    80004db0:	00813023          	sd	s0,0(sp)
    80004db4:	01010413          	addi	s0,sp,16
    80004db8:	00008797          	auipc	a5,0x8
    80004dbc:	c8078793          	addi	a5,a5,-896 # 8000ca38 <_ZTV8Producer+0x10>
    80004dc0:	00f53023          	sd	a5,0(a0)
    80004dc4:	ffffd097          	auipc	ra,0xffffd
    80004dc8:	dd8080e7          	jalr	-552(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004dcc:	00813083          	ld	ra,8(sp)
    80004dd0:	00013403          	ld	s0,0(sp)
    80004dd4:	01010113          	addi	sp,sp,16
    80004dd8:	00008067          	ret

0000000080004ddc <_ZN8ProducerD0Ev>:
    80004ddc:	fe010113          	addi	sp,sp,-32
    80004de0:	00113c23          	sd	ra,24(sp)
    80004de4:	00813823          	sd	s0,16(sp)
    80004de8:	00913423          	sd	s1,8(sp)
    80004dec:	02010413          	addi	s0,sp,32
    80004df0:	00050493          	mv	s1,a0
    80004df4:	00008797          	auipc	a5,0x8
    80004df8:	c4478793          	addi	a5,a5,-956 # 8000ca38 <_ZTV8Producer+0x10>
    80004dfc:	00f53023          	sd	a5,0(a0)
    80004e00:	ffffd097          	auipc	ra,0xffffd
    80004e04:	d9c080e7          	jalr	-612(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80004e08:	00048513          	mv	a0,s1
    80004e0c:	ffffd097          	auipc	ra,0xffffd
    80004e10:	394080e7          	jalr	916(ra) # 800021a0 <_ZdlPv>
    80004e14:	01813083          	ld	ra,24(sp)
    80004e18:	01013403          	ld	s0,16(sp)
    80004e1c:	00813483          	ld	s1,8(sp)
    80004e20:	02010113          	addi	sp,sp,32
    80004e24:	00008067          	ret

0000000080004e28 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004e28:	fe010113          	addi	sp,sp,-32
    80004e2c:	00113c23          	sd	ra,24(sp)
    80004e30:	00813823          	sd	s0,16(sp)
    80004e34:	00913423          	sd	s1,8(sp)
    80004e38:	02010413          	addi	s0,sp,32
    80004e3c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004e40:	ffffd097          	auipc	ra,0xffffd
    80004e44:	824080e7          	jalr	-2012(ra) # 80001664 <_Z4getcv>
    80004e48:	0005059b          	sext.w	a1,a0
    80004e4c:	01b00793          	li	a5,27
    80004e50:	00f58c63          	beq	a1,a5,80004e68 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004e54:	0204b783          	ld	a5,32(s1)
    80004e58:	0087b503          	ld	a0,8(a5)
    80004e5c:	00001097          	auipc	ra,0x1
    80004e60:	378080e7          	jalr	888(ra) # 800061d4 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004e64:	fddff06f          	j	80004e40 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004e68:	00100793          	li	a5,1
    80004e6c:	00008717          	auipc	a4,0x8
    80004e70:	def72623          	sw	a5,-532(a4) # 8000cc58 <_ZL9threadEnd>
        td->buffer->put('!');
    80004e74:	0204b783          	ld	a5,32(s1)
    80004e78:	02100593          	li	a1,33
    80004e7c:	0087b503          	ld	a0,8(a5)
    80004e80:	00001097          	auipc	ra,0x1
    80004e84:	354080e7          	jalr	852(ra) # 800061d4 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004e88:	0204b783          	ld	a5,32(s1)
    80004e8c:	0107b503          	ld	a0,16(a5)
    80004e90:	ffffd097          	auipc	ra,0xffffd
    80004e94:	9dc080e7          	jalr	-1572(ra) # 8000186c <_ZN9Semaphore6signalEv>
    }
    80004e98:	01813083          	ld	ra,24(sp)
    80004e9c:	01013403          	ld	s0,16(sp)
    80004ea0:	00813483          	ld	s1,8(sp)
    80004ea4:	02010113          	addi	sp,sp,32
    80004ea8:	00008067          	ret

0000000080004eac <_ZN8Producer3runEv>:
    void run() override {
    80004eac:	fe010113          	addi	sp,sp,-32
    80004eb0:	00113c23          	sd	ra,24(sp)
    80004eb4:	00813823          	sd	s0,16(sp)
    80004eb8:	00913423          	sd	s1,8(sp)
    80004ebc:	01213023          	sd	s2,0(sp)
    80004ec0:	02010413          	addi	s0,sp,32
    80004ec4:	00050493          	mv	s1,a0
        int i = 0;
    80004ec8:	00000913          	li	s2,0
        while (!threadEnd) {
    80004ecc:	00008797          	auipc	a5,0x8
    80004ed0:	d8c7a783          	lw	a5,-628(a5) # 8000cc58 <_ZL9threadEnd>
    80004ed4:	04079263          	bnez	a5,80004f18 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004ed8:	0204b783          	ld	a5,32(s1)
    80004edc:	0007a583          	lw	a1,0(a5)
    80004ee0:	0305859b          	addiw	a1,a1,48
    80004ee4:	0087b503          	ld	a0,8(a5)
    80004ee8:	00001097          	auipc	ra,0x1
    80004eec:	2ec080e7          	jalr	748(ra) # 800061d4 <_ZN9BufferCPP3putEi>
            i++;
    80004ef0:	0019071b          	addiw	a4,s2,1
    80004ef4:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004ef8:	0204b783          	ld	a5,32(s1)
    80004efc:	0007a783          	lw	a5,0(a5)
    80004f00:	00e787bb          	addw	a5,a5,a4
    80004f04:	00500513          	li	a0,5
    80004f08:	02a7e53b          	remw	a0,a5,a0
    80004f0c:	ffffd097          	auipc	ra,0xffffd
    80004f10:	e14080e7          	jalr	-492(ra) # 80001d20 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004f14:	fb9ff06f          	j	80004ecc <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004f18:	0204b783          	ld	a5,32(s1)
    80004f1c:	0107b503          	ld	a0,16(a5)
    80004f20:	ffffd097          	auipc	ra,0xffffd
    80004f24:	94c080e7          	jalr	-1716(ra) # 8000186c <_ZN9Semaphore6signalEv>
    }
    80004f28:	01813083          	ld	ra,24(sp)
    80004f2c:	01013403          	ld	s0,16(sp)
    80004f30:	00813483          	ld	s1,8(sp)
    80004f34:	00013903          	ld	s2,0(sp)
    80004f38:	02010113          	addi	sp,sp,32
    80004f3c:	00008067          	ret

0000000080004f40 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004f40:	fe010113          	addi	sp,sp,-32
    80004f44:	00113c23          	sd	ra,24(sp)
    80004f48:	00813823          	sd	s0,16(sp)
    80004f4c:	00913423          	sd	s1,8(sp)
    80004f50:	01213023          	sd	s2,0(sp)
    80004f54:	02010413          	addi	s0,sp,32
    80004f58:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004f5c:	00100793          	li	a5,1
    80004f60:	02a7f863          	bgeu	a5,a0,80004f90 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004f64:	00a00793          	li	a5,10
    80004f68:	02f577b3          	remu	a5,a0,a5
    80004f6c:	02078e63          	beqz	a5,80004fa8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004f70:	fff48513          	addi	a0,s1,-1
    80004f74:	00000097          	auipc	ra,0x0
    80004f78:	fcc080e7          	jalr	-52(ra) # 80004f40 <_ZL9fibonaccim>
    80004f7c:	00050913          	mv	s2,a0
    80004f80:	ffe48513          	addi	a0,s1,-2
    80004f84:	00000097          	auipc	ra,0x0
    80004f88:	fbc080e7          	jalr	-68(ra) # 80004f40 <_ZL9fibonaccim>
    80004f8c:	00a90533          	add	a0,s2,a0
}
    80004f90:	01813083          	ld	ra,24(sp)
    80004f94:	01013403          	ld	s0,16(sp)
    80004f98:	00813483          	ld	s1,8(sp)
    80004f9c:	00013903          	ld	s2,0(sp)
    80004fa0:	02010113          	addi	sp,sp,32
    80004fa4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004fa8:	ffffc097          	auipc	ra,0xffffc
    80004fac:	428080e7          	jalr	1064(ra) # 800013d0 <_Z15thread_dispatchv>
    80004fb0:	fc1ff06f          	j	80004f70 <_ZL9fibonaccim+0x30>

0000000080004fb4 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004fb4:	fe010113          	addi	sp,sp,-32
    80004fb8:	00113c23          	sd	ra,24(sp)
    80004fbc:	00813823          	sd	s0,16(sp)
    80004fc0:	00913423          	sd	s1,8(sp)
    80004fc4:	01213023          	sd	s2,0(sp)
    80004fc8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004fcc:	00a00493          	li	s1,10
    80004fd0:	0400006f          	j	80005010 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004fd4:	00005517          	auipc	a0,0x5
    80004fd8:	32c50513          	addi	a0,a0,812 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80004fdc:	00001097          	auipc	ra,0x1
    80004fe0:	dc8080e7          	jalr	-568(ra) # 80005da4 <_Z11printStringPKc>
    80004fe4:	00000613          	li	a2,0
    80004fe8:	00a00593          	li	a1,10
    80004fec:	00048513          	mv	a0,s1
    80004ff0:	00001097          	auipc	ra,0x1
    80004ff4:	f70080e7          	jalr	-144(ra) # 80005f60 <_Z8printIntiii>
    80004ff8:	00005517          	auipc	a0,0x5
    80004ffc:	3b050513          	addi	a0,a0,944 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005000:	00001097          	auipc	ra,0x1
    80005004:	da4080e7          	jalr	-604(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005008:	0014849b          	addiw	s1,s1,1
    8000500c:	0ff4f493          	andi	s1,s1,255
    80005010:	00c00793          	li	a5,12
    80005014:	fc97f0e3          	bgeu	a5,s1,80004fd4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005018:	00005517          	auipc	a0,0x5
    8000501c:	2f050513          	addi	a0,a0,752 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80005020:	00001097          	auipc	ra,0x1
    80005024:	d84080e7          	jalr	-636(ra) # 80005da4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005028:	00500313          	li	t1,5
    thread_dispatch();
    8000502c:	ffffc097          	auipc	ra,0xffffc
    80005030:	3a4080e7          	jalr	932(ra) # 800013d0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005034:	01000513          	li	a0,16
    80005038:	00000097          	auipc	ra,0x0
    8000503c:	f08080e7          	jalr	-248(ra) # 80004f40 <_ZL9fibonaccim>
    80005040:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005044:	00005517          	auipc	a0,0x5
    80005048:	2d450513          	addi	a0,a0,724 # 8000a318 <CONSOLE_STATUS+0x308>
    8000504c:	00001097          	auipc	ra,0x1
    80005050:	d58080e7          	jalr	-680(ra) # 80005da4 <_Z11printStringPKc>
    80005054:	00000613          	li	a2,0
    80005058:	00a00593          	li	a1,10
    8000505c:	0009051b          	sext.w	a0,s2
    80005060:	00001097          	auipc	ra,0x1
    80005064:	f00080e7          	jalr	-256(ra) # 80005f60 <_Z8printIntiii>
    80005068:	00005517          	auipc	a0,0x5
    8000506c:	34050513          	addi	a0,a0,832 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005070:	00001097          	auipc	ra,0x1
    80005074:	d34080e7          	jalr	-716(ra) # 80005da4 <_Z11printStringPKc>
    80005078:	0400006f          	j	800050b8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000507c:	00005517          	auipc	a0,0x5
    80005080:	28450513          	addi	a0,a0,644 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80005084:	00001097          	auipc	ra,0x1
    80005088:	d20080e7          	jalr	-736(ra) # 80005da4 <_Z11printStringPKc>
    8000508c:	00000613          	li	a2,0
    80005090:	00a00593          	li	a1,10
    80005094:	00048513          	mv	a0,s1
    80005098:	00001097          	auipc	ra,0x1
    8000509c:	ec8080e7          	jalr	-312(ra) # 80005f60 <_Z8printIntiii>
    800050a0:	00005517          	auipc	a0,0x5
    800050a4:	30850513          	addi	a0,a0,776 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800050a8:	00001097          	auipc	ra,0x1
    800050ac:	cfc080e7          	jalr	-772(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800050b0:	0014849b          	addiw	s1,s1,1
    800050b4:	0ff4f493          	andi	s1,s1,255
    800050b8:	00f00793          	li	a5,15
    800050bc:	fc97f0e3          	bgeu	a5,s1,8000507c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800050c0:	00005517          	auipc	a0,0x5
    800050c4:	26850513          	addi	a0,a0,616 # 8000a328 <CONSOLE_STATUS+0x318>
    800050c8:	00001097          	auipc	ra,0x1
    800050cc:	cdc080e7          	jalr	-804(ra) # 80005da4 <_Z11printStringPKc>
    finishedD = true;
    800050d0:	00100793          	li	a5,1
    800050d4:	00008717          	auipc	a4,0x8
    800050d8:	b8f70a23          	sb	a5,-1132(a4) # 8000cc68 <_ZL9finishedD>
    thread_dispatch();
    800050dc:	ffffc097          	auipc	ra,0xffffc
    800050e0:	2f4080e7          	jalr	756(ra) # 800013d0 <_Z15thread_dispatchv>
}
    800050e4:	01813083          	ld	ra,24(sp)
    800050e8:	01013403          	ld	s0,16(sp)
    800050ec:	00813483          	ld	s1,8(sp)
    800050f0:	00013903          	ld	s2,0(sp)
    800050f4:	02010113          	addi	sp,sp,32
    800050f8:	00008067          	ret

00000000800050fc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800050fc:	fe010113          	addi	sp,sp,-32
    80005100:	00113c23          	sd	ra,24(sp)
    80005104:	00813823          	sd	s0,16(sp)
    80005108:	00913423          	sd	s1,8(sp)
    8000510c:	01213023          	sd	s2,0(sp)
    80005110:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005114:	00000493          	li	s1,0
    80005118:	0400006f          	j	80005158 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000511c:	00005517          	auipc	a0,0x5
    80005120:	1b450513          	addi	a0,a0,436 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    80005124:	00001097          	auipc	ra,0x1
    80005128:	c80080e7          	jalr	-896(ra) # 80005da4 <_Z11printStringPKc>
    8000512c:	00000613          	li	a2,0
    80005130:	00a00593          	li	a1,10
    80005134:	00048513          	mv	a0,s1
    80005138:	00001097          	auipc	ra,0x1
    8000513c:	e28080e7          	jalr	-472(ra) # 80005f60 <_Z8printIntiii>
    80005140:	00005517          	auipc	a0,0x5
    80005144:	26850513          	addi	a0,a0,616 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005148:	00001097          	auipc	ra,0x1
    8000514c:	c5c080e7          	jalr	-932(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005150:	0014849b          	addiw	s1,s1,1
    80005154:	0ff4f493          	andi	s1,s1,255
    80005158:	00200793          	li	a5,2
    8000515c:	fc97f0e3          	bgeu	a5,s1,8000511c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005160:	00005517          	auipc	a0,0x5
    80005164:	17850513          	addi	a0,a0,376 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    80005168:	00001097          	auipc	ra,0x1
    8000516c:	c3c080e7          	jalr	-964(ra) # 80005da4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005170:	00700313          	li	t1,7
    thread_dispatch();
    80005174:	ffffc097          	auipc	ra,0xffffc
    80005178:	25c080e7          	jalr	604(ra) # 800013d0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000517c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005180:	00005517          	auipc	a0,0x5
    80005184:	16850513          	addi	a0,a0,360 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80005188:	00001097          	auipc	ra,0x1
    8000518c:	c1c080e7          	jalr	-996(ra) # 80005da4 <_Z11printStringPKc>
    80005190:	00000613          	li	a2,0
    80005194:	00a00593          	li	a1,10
    80005198:	0009051b          	sext.w	a0,s2
    8000519c:	00001097          	auipc	ra,0x1
    800051a0:	dc4080e7          	jalr	-572(ra) # 80005f60 <_Z8printIntiii>
    800051a4:	00005517          	auipc	a0,0x5
    800051a8:	20450513          	addi	a0,a0,516 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800051ac:	00001097          	auipc	ra,0x1
    800051b0:	bf8080e7          	jalr	-1032(ra) # 80005da4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800051b4:	00c00513          	li	a0,12
    800051b8:	00000097          	auipc	ra,0x0
    800051bc:	d88080e7          	jalr	-632(ra) # 80004f40 <_ZL9fibonaccim>
    800051c0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800051c4:	00005517          	auipc	a0,0x5
    800051c8:	12c50513          	addi	a0,a0,300 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    800051cc:	00001097          	auipc	ra,0x1
    800051d0:	bd8080e7          	jalr	-1064(ra) # 80005da4 <_Z11printStringPKc>
    800051d4:	00000613          	li	a2,0
    800051d8:	00a00593          	li	a1,10
    800051dc:	0009051b          	sext.w	a0,s2
    800051e0:	00001097          	auipc	ra,0x1
    800051e4:	d80080e7          	jalr	-640(ra) # 80005f60 <_Z8printIntiii>
    800051e8:	00005517          	auipc	a0,0x5
    800051ec:	1c050513          	addi	a0,a0,448 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800051f0:	00001097          	auipc	ra,0x1
    800051f4:	bb4080e7          	jalr	-1100(ra) # 80005da4 <_Z11printStringPKc>
    800051f8:	0400006f          	j	80005238 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800051fc:	00005517          	auipc	a0,0x5
    80005200:	0d450513          	addi	a0,a0,212 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    80005204:	00001097          	auipc	ra,0x1
    80005208:	ba0080e7          	jalr	-1120(ra) # 80005da4 <_Z11printStringPKc>
    8000520c:	00000613          	li	a2,0
    80005210:	00a00593          	li	a1,10
    80005214:	00048513          	mv	a0,s1
    80005218:	00001097          	auipc	ra,0x1
    8000521c:	d48080e7          	jalr	-696(ra) # 80005f60 <_Z8printIntiii>
    80005220:	00005517          	auipc	a0,0x5
    80005224:	18850513          	addi	a0,a0,392 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005228:	00001097          	auipc	ra,0x1
    8000522c:	b7c080e7          	jalr	-1156(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005230:	0014849b          	addiw	s1,s1,1
    80005234:	0ff4f493          	andi	s1,s1,255
    80005238:	00500793          	li	a5,5
    8000523c:	fc97f0e3          	bgeu	a5,s1,800051fc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005240:	00005517          	auipc	a0,0x5
    80005244:	06850513          	addi	a0,a0,104 # 8000a2a8 <CONSOLE_STATUS+0x298>
    80005248:	00001097          	auipc	ra,0x1
    8000524c:	b5c080e7          	jalr	-1188(ra) # 80005da4 <_Z11printStringPKc>
    finishedC = true;
    80005250:	00100793          	li	a5,1
    80005254:	00008717          	auipc	a4,0x8
    80005258:	a0f70aa3          	sb	a5,-1515(a4) # 8000cc69 <_ZL9finishedC>
    thread_dispatch();
    8000525c:	ffffc097          	auipc	ra,0xffffc
    80005260:	174080e7          	jalr	372(ra) # 800013d0 <_Z15thread_dispatchv>
}
    80005264:	01813083          	ld	ra,24(sp)
    80005268:	01013403          	ld	s0,16(sp)
    8000526c:	00813483          	ld	s1,8(sp)
    80005270:	00013903          	ld	s2,0(sp)
    80005274:	02010113          	addi	sp,sp,32
    80005278:	00008067          	ret

000000008000527c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000527c:	fe010113          	addi	sp,sp,-32
    80005280:	00113c23          	sd	ra,24(sp)
    80005284:	00813823          	sd	s0,16(sp)
    80005288:	00913423          	sd	s1,8(sp)
    8000528c:	01213023          	sd	s2,0(sp)
    80005290:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005294:	00000913          	li	s2,0
    80005298:	0380006f          	j	800052d0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000529c:	ffffc097          	auipc	ra,0xffffc
    800052a0:	134080e7          	jalr	308(ra) # 800013d0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800052a4:	00148493          	addi	s1,s1,1
    800052a8:	000027b7          	lui	a5,0x2
    800052ac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800052b0:	0097ee63          	bltu	a5,s1,800052cc <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800052b4:	00000713          	li	a4,0
    800052b8:	000077b7          	lui	a5,0x7
    800052bc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800052c0:	fce7eee3          	bltu	a5,a4,8000529c <_ZL11workerBodyBPv+0x20>
    800052c4:	00170713          	addi	a4,a4,1
    800052c8:	ff1ff06f          	j	800052b8 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800052cc:	00190913          	addi	s2,s2,1
    800052d0:	00f00793          	li	a5,15
    800052d4:	0527e063          	bltu	a5,s2,80005314 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800052d8:	00005517          	auipc	a0,0x5
    800052dc:	fe050513          	addi	a0,a0,-32 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	ac4080e7          	jalr	-1340(ra) # 80005da4 <_Z11printStringPKc>
    800052e8:	00000613          	li	a2,0
    800052ec:	00a00593          	li	a1,10
    800052f0:	0009051b          	sext.w	a0,s2
    800052f4:	00001097          	auipc	ra,0x1
    800052f8:	c6c080e7          	jalr	-916(ra) # 80005f60 <_Z8printIntiii>
    800052fc:	00005517          	auipc	a0,0x5
    80005300:	0ac50513          	addi	a0,a0,172 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005304:	00001097          	auipc	ra,0x1
    80005308:	aa0080e7          	jalr	-1376(ra) # 80005da4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000530c:	00000493          	li	s1,0
    80005310:	f99ff06f          	j	800052a8 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005314:	00005517          	auipc	a0,0x5
    80005318:	fac50513          	addi	a0,a0,-84 # 8000a2c0 <CONSOLE_STATUS+0x2b0>
    8000531c:	00001097          	auipc	ra,0x1
    80005320:	a88080e7          	jalr	-1400(ra) # 80005da4 <_Z11printStringPKc>
    finishedB = true;
    80005324:	00100793          	li	a5,1
    80005328:	00008717          	auipc	a4,0x8
    8000532c:	94f70123          	sb	a5,-1726(a4) # 8000cc6a <_ZL9finishedB>
    thread_dispatch();
    80005330:	ffffc097          	auipc	ra,0xffffc
    80005334:	0a0080e7          	jalr	160(ra) # 800013d0 <_Z15thread_dispatchv>
}
    80005338:	01813083          	ld	ra,24(sp)
    8000533c:	01013403          	ld	s0,16(sp)
    80005340:	00813483          	ld	s1,8(sp)
    80005344:	00013903          	ld	s2,0(sp)
    80005348:	02010113          	addi	sp,sp,32
    8000534c:	00008067          	ret

0000000080005350 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005350:	fe010113          	addi	sp,sp,-32
    80005354:	00113c23          	sd	ra,24(sp)
    80005358:	00813823          	sd	s0,16(sp)
    8000535c:	00913423          	sd	s1,8(sp)
    80005360:	01213023          	sd	s2,0(sp)
    80005364:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005368:	00000913          	li	s2,0
    8000536c:	0380006f          	j	800053a4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005370:	ffffc097          	auipc	ra,0xffffc
    80005374:	060080e7          	jalr	96(ra) # 800013d0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005378:	00148493          	addi	s1,s1,1
    8000537c:	000027b7          	lui	a5,0x2
    80005380:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005384:	0097ee63          	bltu	a5,s1,800053a0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005388:	00000713          	li	a4,0
    8000538c:	000077b7          	lui	a5,0x7
    80005390:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005394:	fce7eee3          	bltu	a5,a4,80005370 <_ZL11workerBodyAPv+0x20>
    80005398:	00170713          	addi	a4,a4,1
    8000539c:	ff1ff06f          	j	8000538c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800053a0:	00190913          	addi	s2,s2,1
    800053a4:	00900793          	li	a5,9
    800053a8:	0527e063          	bltu	a5,s2,800053e8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800053ac:	00005517          	auipc	a0,0x5
    800053b0:	ef450513          	addi	a0,a0,-268 # 8000a2a0 <CONSOLE_STATUS+0x290>
    800053b4:	00001097          	auipc	ra,0x1
    800053b8:	9f0080e7          	jalr	-1552(ra) # 80005da4 <_Z11printStringPKc>
    800053bc:	00000613          	li	a2,0
    800053c0:	00a00593          	li	a1,10
    800053c4:	0009051b          	sext.w	a0,s2
    800053c8:	00001097          	auipc	ra,0x1
    800053cc:	b98080e7          	jalr	-1128(ra) # 80005f60 <_Z8printIntiii>
    800053d0:	00005517          	auipc	a0,0x5
    800053d4:	fd850513          	addi	a0,a0,-40 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800053d8:	00001097          	auipc	ra,0x1
    800053dc:	9cc080e7          	jalr	-1588(ra) # 80005da4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800053e0:	00000493          	li	s1,0
    800053e4:	f99ff06f          	j	8000537c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800053e8:	00005517          	auipc	a0,0x5
    800053ec:	ec050513          	addi	a0,a0,-320 # 8000a2a8 <CONSOLE_STATUS+0x298>
    800053f0:	00001097          	auipc	ra,0x1
    800053f4:	9b4080e7          	jalr	-1612(ra) # 80005da4 <_Z11printStringPKc>
    finishedA = true;
    800053f8:	00100793          	li	a5,1
    800053fc:	00008717          	auipc	a4,0x8
    80005400:	86f707a3          	sb	a5,-1937(a4) # 8000cc6b <_ZL9finishedA>
}
    80005404:	01813083          	ld	ra,24(sp)
    80005408:	01013403          	ld	s0,16(sp)
    8000540c:	00813483          	ld	s1,8(sp)
    80005410:	00013903          	ld	s2,0(sp)
    80005414:	02010113          	addi	sp,sp,32
    80005418:	00008067          	ret

000000008000541c <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    8000541c:	fd010113          	addi	sp,sp,-48
    80005420:	02113423          	sd	ra,40(sp)
    80005424:	02813023          	sd	s0,32(sp)
    80005428:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000542c:	00000613          	li	a2,0
    80005430:	00000597          	auipc	a1,0x0
    80005434:	f2058593          	addi	a1,a1,-224 # 80005350 <_ZL11workerBodyAPv>
    80005438:	fd040513          	addi	a0,s0,-48
    8000543c:	ffffc097          	auipc	ra,0xffffc
    80005440:	ec4080e7          	jalr	-316(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005444:	00005517          	auipc	a0,0x5
    80005448:	ef450513          	addi	a0,a0,-268 # 8000a338 <CONSOLE_STATUS+0x328>
    8000544c:	00001097          	auipc	ra,0x1
    80005450:	958080e7          	jalr	-1704(ra) # 80005da4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005454:	00000613          	li	a2,0
    80005458:	00000597          	auipc	a1,0x0
    8000545c:	e2458593          	addi	a1,a1,-476 # 8000527c <_ZL11workerBodyBPv>
    80005460:	fd840513          	addi	a0,s0,-40
    80005464:	ffffc097          	auipc	ra,0xffffc
    80005468:	e9c080e7          	jalr	-356(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000546c:	00005517          	auipc	a0,0x5
    80005470:	ee450513          	addi	a0,a0,-284 # 8000a350 <CONSOLE_STATUS+0x340>
    80005474:	00001097          	auipc	ra,0x1
    80005478:	930080e7          	jalr	-1744(ra) # 80005da4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000547c:	00000613          	li	a2,0
    80005480:	00000597          	auipc	a1,0x0
    80005484:	c7c58593          	addi	a1,a1,-900 # 800050fc <_ZL11workerBodyCPv>
    80005488:	fe040513          	addi	a0,s0,-32
    8000548c:	ffffc097          	auipc	ra,0xffffc
    80005490:	e74080e7          	jalr	-396(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005494:	00005517          	auipc	a0,0x5
    80005498:	ed450513          	addi	a0,a0,-300 # 8000a368 <CONSOLE_STATUS+0x358>
    8000549c:	00001097          	auipc	ra,0x1
    800054a0:	908080e7          	jalr	-1784(ra) # 80005da4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800054a4:	00000613          	li	a2,0
    800054a8:	00000597          	auipc	a1,0x0
    800054ac:	b0c58593          	addi	a1,a1,-1268 # 80004fb4 <_ZL11workerBodyDPv>
    800054b0:	fe840513          	addi	a0,s0,-24
    800054b4:	ffffc097          	auipc	ra,0xffffc
    800054b8:	e4c080e7          	jalr	-436(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800054bc:	00005517          	auipc	a0,0x5
    800054c0:	ec450513          	addi	a0,a0,-316 # 8000a380 <CONSOLE_STATUS+0x370>
    800054c4:	00001097          	auipc	ra,0x1
    800054c8:	8e0080e7          	jalr	-1824(ra) # 80005da4 <_Z11printStringPKc>
    800054cc:	00c0006f          	j	800054d8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800054d0:	ffffc097          	auipc	ra,0xffffc
    800054d4:	f00080e7          	jalr	-256(ra) # 800013d0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800054d8:	00007797          	auipc	a5,0x7
    800054dc:	7937c783          	lbu	a5,1939(a5) # 8000cc6b <_ZL9finishedA>
    800054e0:	fe0788e3          	beqz	a5,800054d0 <_Z18Threads_C_API_testv+0xb4>
    800054e4:	00007797          	auipc	a5,0x7
    800054e8:	7867c783          	lbu	a5,1926(a5) # 8000cc6a <_ZL9finishedB>
    800054ec:	fe0782e3          	beqz	a5,800054d0 <_Z18Threads_C_API_testv+0xb4>
    800054f0:	00007797          	auipc	a5,0x7
    800054f4:	7797c783          	lbu	a5,1913(a5) # 8000cc69 <_ZL9finishedC>
    800054f8:	fc078ce3          	beqz	a5,800054d0 <_Z18Threads_C_API_testv+0xb4>
    800054fc:	00007797          	auipc	a5,0x7
    80005500:	76c7c783          	lbu	a5,1900(a5) # 8000cc68 <_ZL9finishedD>
    80005504:	fc0786e3          	beqz	a5,800054d0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005508:	02813083          	ld	ra,40(sp)
    8000550c:	02013403          	ld	s0,32(sp)
    80005510:	03010113          	addi	sp,sp,48
    80005514:	00008067          	ret

0000000080005518 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005518:	fd010113          	addi	sp,sp,-48
    8000551c:	02113423          	sd	ra,40(sp)
    80005520:	02813023          	sd	s0,32(sp)
    80005524:	00913c23          	sd	s1,24(sp)
    80005528:	01213823          	sd	s2,16(sp)
    8000552c:	01313423          	sd	s3,8(sp)
    80005530:	03010413          	addi	s0,sp,48
    80005534:	00050993          	mv	s3,a0
    80005538:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000553c:	00000913          	li	s2,0
    80005540:	00c0006f          	j	8000554c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005544:	ffffc097          	auipc	ra,0xffffc
    80005548:	7b4080e7          	jalr	1972(ra) # 80001cf8 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000554c:	ffffc097          	auipc	ra,0xffffc
    80005550:	118080e7          	jalr	280(ra) # 80001664 <_Z4getcv>
    80005554:	0005059b          	sext.w	a1,a0
    80005558:	01b00793          	li	a5,27
    8000555c:	02f58a63          	beq	a1,a5,80005590 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005560:	0084b503          	ld	a0,8(s1)
    80005564:	00001097          	auipc	ra,0x1
    80005568:	c70080e7          	jalr	-912(ra) # 800061d4 <_ZN9BufferCPP3putEi>
        i++;
    8000556c:	0019071b          	addiw	a4,s2,1
    80005570:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005574:	0004a683          	lw	a3,0(s1)
    80005578:	0026979b          	slliw	a5,a3,0x2
    8000557c:	00d787bb          	addw	a5,a5,a3
    80005580:	0017979b          	slliw	a5,a5,0x1
    80005584:	02f767bb          	remw	a5,a4,a5
    80005588:	fc0792e3          	bnez	a5,8000554c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000558c:	fb9ff06f          	j	80005544 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005590:	00100793          	li	a5,1
    80005594:	00007717          	auipc	a4,0x7
    80005598:	6cf72e23          	sw	a5,1756(a4) # 8000cc70 <_ZL9threadEnd>
    td->buffer->put('!');
    8000559c:	0209b783          	ld	a5,32(s3)
    800055a0:	02100593          	li	a1,33
    800055a4:	0087b503          	ld	a0,8(a5)
    800055a8:	00001097          	auipc	ra,0x1
    800055ac:	c2c080e7          	jalr	-980(ra) # 800061d4 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800055b0:	0104b503          	ld	a0,16(s1)
    800055b4:	ffffc097          	auipc	ra,0xffffc
    800055b8:	2b8080e7          	jalr	696(ra) # 8000186c <_ZN9Semaphore6signalEv>
}
    800055bc:	02813083          	ld	ra,40(sp)
    800055c0:	02013403          	ld	s0,32(sp)
    800055c4:	01813483          	ld	s1,24(sp)
    800055c8:	01013903          	ld	s2,16(sp)
    800055cc:	00813983          	ld	s3,8(sp)
    800055d0:	03010113          	addi	sp,sp,48
    800055d4:	00008067          	ret

00000000800055d8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800055d8:	fe010113          	addi	sp,sp,-32
    800055dc:	00113c23          	sd	ra,24(sp)
    800055e0:	00813823          	sd	s0,16(sp)
    800055e4:	00913423          	sd	s1,8(sp)
    800055e8:	01213023          	sd	s2,0(sp)
    800055ec:	02010413          	addi	s0,sp,32
    800055f0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800055f4:	00000913          	li	s2,0
    800055f8:	00c0006f          	j	80005604 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800055fc:	ffffc097          	auipc	ra,0xffffc
    80005600:	6fc080e7          	jalr	1788(ra) # 80001cf8 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005604:	00007797          	auipc	a5,0x7
    80005608:	66c7a783          	lw	a5,1644(a5) # 8000cc70 <_ZL9threadEnd>
    8000560c:	02079e63          	bnez	a5,80005648 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005610:	0004a583          	lw	a1,0(s1)
    80005614:	0305859b          	addiw	a1,a1,48
    80005618:	0084b503          	ld	a0,8(s1)
    8000561c:	00001097          	auipc	ra,0x1
    80005620:	bb8080e7          	jalr	-1096(ra) # 800061d4 <_ZN9BufferCPP3putEi>
        i++;
    80005624:	0019071b          	addiw	a4,s2,1
    80005628:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000562c:	0004a683          	lw	a3,0(s1)
    80005630:	0026979b          	slliw	a5,a3,0x2
    80005634:	00d787bb          	addw	a5,a5,a3
    80005638:	0017979b          	slliw	a5,a5,0x1
    8000563c:	02f767bb          	remw	a5,a4,a5
    80005640:	fc0792e3          	bnez	a5,80005604 <_ZN12ProducerSync8producerEPv+0x2c>
    80005644:	fb9ff06f          	j	800055fc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005648:	0104b503          	ld	a0,16(s1)
    8000564c:	ffffc097          	auipc	ra,0xffffc
    80005650:	220080e7          	jalr	544(ra) # 8000186c <_ZN9Semaphore6signalEv>
}
    80005654:	01813083          	ld	ra,24(sp)
    80005658:	01013403          	ld	s0,16(sp)
    8000565c:	00813483          	ld	s1,8(sp)
    80005660:	00013903          	ld	s2,0(sp)
    80005664:	02010113          	addi	sp,sp,32
    80005668:	00008067          	ret

000000008000566c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000566c:	fd010113          	addi	sp,sp,-48
    80005670:	02113423          	sd	ra,40(sp)
    80005674:	02813023          	sd	s0,32(sp)
    80005678:	00913c23          	sd	s1,24(sp)
    8000567c:	01213823          	sd	s2,16(sp)
    80005680:	01313423          	sd	s3,8(sp)
    80005684:	01413023          	sd	s4,0(sp)
    80005688:	03010413          	addi	s0,sp,48
    8000568c:	00050993          	mv	s3,a0
    80005690:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005694:	00000a13          	li	s4,0
    80005698:	01c0006f          	j	800056b4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000569c:	ffffc097          	auipc	ra,0xffffc
    800056a0:	65c080e7          	jalr	1628(ra) # 80001cf8 <_ZN6Thread8dispatchEv>
    800056a4:	0500006f          	j	800056f4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800056a8:	00a00513          	li	a0,10
    800056ac:	ffffc097          	auipc	ra,0xffffc
    800056b0:	fe4080e7          	jalr	-28(ra) # 80001690 <_Z4putcc>
    while (!threadEnd) {
    800056b4:	00007797          	auipc	a5,0x7
    800056b8:	5bc7a783          	lw	a5,1468(a5) # 8000cc70 <_ZL9threadEnd>
    800056bc:	06079263          	bnez	a5,80005720 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800056c0:	00893503          	ld	a0,8(s2)
    800056c4:	00001097          	auipc	ra,0x1
    800056c8:	ba0080e7          	jalr	-1120(ra) # 80006264 <_ZN9BufferCPP3getEv>
        i++;
    800056cc:	001a049b          	addiw	s1,s4,1
    800056d0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800056d4:	0ff57513          	andi	a0,a0,255
    800056d8:	ffffc097          	auipc	ra,0xffffc
    800056dc:	fb8080e7          	jalr	-72(ra) # 80001690 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800056e0:	00092703          	lw	a4,0(s2)
    800056e4:	0027179b          	slliw	a5,a4,0x2
    800056e8:	00e787bb          	addw	a5,a5,a4
    800056ec:	02f4e7bb          	remw	a5,s1,a5
    800056f0:	fa0786e3          	beqz	a5,8000569c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800056f4:	05000793          	li	a5,80
    800056f8:	02f4e4bb          	remw	s1,s1,a5
    800056fc:	fa049ce3          	bnez	s1,800056b4 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005700:	fa9ff06f          	j	800056a8 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005704:	0209b783          	ld	a5,32(s3)
    80005708:	0087b503          	ld	a0,8(a5)
    8000570c:	00001097          	auipc	ra,0x1
    80005710:	b58080e7          	jalr	-1192(ra) # 80006264 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005714:	0ff57513          	andi	a0,a0,255
    80005718:	ffffc097          	auipc	ra,0xffffc
    8000571c:	730080e7          	jalr	1840(ra) # 80001e48 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005720:	0209b783          	ld	a5,32(s3)
    80005724:	0087b503          	ld	a0,8(a5)
    80005728:	00001097          	auipc	ra,0x1
    8000572c:	bc8080e7          	jalr	-1080(ra) # 800062f0 <_ZN9BufferCPP6getCntEv>
    80005730:	fca04ae3          	bgtz	a0,80005704 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005734:	01093503          	ld	a0,16(s2)
    80005738:	ffffc097          	auipc	ra,0xffffc
    8000573c:	134080e7          	jalr	308(ra) # 8000186c <_ZN9Semaphore6signalEv>
}
    80005740:	02813083          	ld	ra,40(sp)
    80005744:	02013403          	ld	s0,32(sp)
    80005748:	01813483          	ld	s1,24(sp)
    8000574c:	01013903          	ld	s2,16(sp)
    80005750:	00813983          	ld	s3,8(sp)
    80005754:	00013a03          	ld	s4,0(sp)
    80005758:	03010113          	addi	sp,sp,48
    8000575c:	00008067          	ret

0000000080005760 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005760:	f8010113          	addi	sp,sp,-128
    80005764:	06113c23          	sd	ra,120(sp)
    80005768:	06813823          	sd	s0,112(sp)
    8000576c:	06913423          	sd	s1,104(sp)
    80005770:	07213023          	sd	s2,96(sp)
    80005774:	05313c23          	sd	s3,88(sp)
    80005778:	05413823          	sd	s4,80(sp)
    8000577c:	05513423          	sd	s5,72(sp)
    80005780:	05613023          	sd	s6,64(sp)
    80005784:	03713c23          	sd	s7,56(sp)
    80005788:	03813823          	sd	s8,48(sp)
    8000578c:	03913423          	sd	s9,40(sp)
    80005790:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005794:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005798:	00005517          	auipc	a0,0x5
    8000579c:	a2050513          	addi	a0,a0,-1504 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    800057a0:	00000097          	auipc	ra,0x0
    800057a4:	604080e7          	jalr	1540(ra) # 80005da4 <_Z11printStringPKc>
    getString(input, 30);
    800057a8:	01e00593          	li	a1,30
    800057ac:	f8040493          	addi	s1,s0,-128
    800057b0:	00048513          	mv	a0,s1
    800057b4:	00000097          	auipc	ra,0x0
    800057b8:	678080e7          	jalr	1656(ra) # 80005e2c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800057bc:	00048513          	mv	a0,s1
    800057c0:	00000097          	auipc	ra,0x0
    800057c4:	750080e7          	jalr	1872(ra) # 80005f10 <_Z11stringToIntPKc>
    800057c8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800057cc:	00005517          	auipc	a0,0x5
    800057d0:	a0c50513          	addi	a0,a0,-1524 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    800057d4:	00000097          	auipc	ra,0x0
    800057d8:	5d0080e7          	jalr	1488(ra) # 80005da4 <_Z11printStringPKc>
    getString(input, 30);
    800057dc:	01e00593          	li	a1,30
    800057e0:	00048513          	mv	a0,s1
    800057e4:	00000097          	auipc	ra,0x0
    800057e8:	648080e7          	jalr	1608(ra) # 80005e2c <_Z9getStringPci>
    n = stringToInt(input);
    800057ec:	00048513          	mv	a0,s1
    800057f0:	00000097          	auipc	ra,0x0
    800057f4:	720080e7          	jalr	1824(ra) # 80005f10 <_Z11stringToIntPKc>
    800057f8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800057fc:	00005517          	auipc	a0,0x5
    80005800:	9fc50513          	addi	a0,a0,-1540 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80005804:	00000097          	auipc	ra,0x0
    80005808:	5a0080e7          	jalr	1440(ra) # 80005da4 <_Z11printStringPKc>
    8000580c:	00000613          	li	a2,0
    80005810:	00a00593          	li	a1,10
    80005814:	00090513          	mv	a0,s2
    80005818:	00000097          	auipc	ra,0x0
    8000581c:	748080e7          	jalr	1864(ra) # 80005f60 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005820:	00005517          	auipc	a0,0x5
    80005824:	9f050513          	addi	a0,a0,-1552 # 8000a210 <CONSOLE_STATUS+0x200>
    80005828:	00000097          	auipc	ra,0x0
    8000582c:	57c080e7          	jalr	1404(ra) # 80005da4 <_Z11printStringPKc>
    80005830:	00000613          	li	a2,0
    80005834:	00a00593          	li	a1,10
    80005838:	00048513          	mv	a0,s1
    8000583c:	00000097          	auipc	ra,0x0
    80005840:	724080e7          	jalr	1828(ra) # 80005f60 <_Z8printIntiii>
    printString(".\n");
    80005844:	00005517          	auipc	a0,0x5
    80005848:	9e450513          	addi	a0,a0,-1564 # 8000a228 <CONSOLE_STATUS+0x218>
    8000584c:	00000097          	auipc	ra,0x0
    80005850:	558080e7          	jalr	1368(ra) # 80005da4 <_Z11printStringPKc>
    if(threadNum > n) {
    80005854:	0324c463          	blt	s1,s2,8000587c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005858:	03205c63          	blez	s2,80005890 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000585c:	03800513          	li	a0,56
    80005860:	ffffd097          	auipc	ra,0xffffd
    80005864:	8f0080e7          	jalr	-1808(ra) # 80002150 <_Znwm>
    80005868:	00050a93          	mv	s5,a0
    8000586c:	00048593          	mv	a1,s1
    80005870:	00001097          	auipc	ra,0x1
    80005874:	810080e7          	jalr	-2032(ra) # 80006080 <_ZN9BufferCPPC1Ei>
    80005878:	0300006f          	j	800058a8 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000587c:	00005517          	auipc	a0,0x5
    80005880:	9b450513          	addi	a0,a0,-1612 # 8000a230 <CONSOLE_STATUS+0x220>
    80005884:	00000097          	auipc	ra,0x0
    80005888:	520080e7          	jalr	1312(ra) # 80005da4 <_Z11printStringPKc>
        return;
    8000588c:	0140006f          	j	800058a0 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005890:	00005517          	auipc	a0,0x5
    80005894:	9e050513          	addi	a0,a0,-1568 # 8000a270 <CONSOLE_STATUS+0x260>
    80005898:	00000097          	auipc	ra,0x0
    8000589c:	50c080e7          	jalr	1292(ra) # 80005da4 <_Z11printStringPKc>
        return;
    800058a0:	000b8113          	mv	sp,s7
    800058a4:	2380006f          	j	80005adc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800058a8:	01000513          	li	a0,16
    800058ac:	ffffd097          	auipc	ra,0xffffd
    800058b0:	8a4080e7          	jalr	-1884(ra) # 80002150 <_Znwm>
    800058b4:	00050493          	mv	s1,a0
    800058b8:	00000593          	li	a1,0
    800058bc:	ffffc097          	auipc	ra,0xffffc
    800058c0:	f48080e7          	jalr	-184(ra) # 80001804 <_ZN9SemaphoreC1Ej>
    800058c4:	00007797          	auipc	a5,0x7
    800058c8:	3a97ba23          	sd	s1,948(a5) # 8000cc78 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800058cc:	00391793          	slli	a5,s2,0x3
    800058d0:	00f78793          	addi	a5,a5,15
    800058d4:	ff07f793          	andi	a5,a5,-16
    800058d8:	40f10133          	sub	sp,sp,a5
    800058dc:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800058e0:	0019071b          	addiw	a4,s2,1
    800058e4:	00171793          	slli	a5,a4,0x1
    800058e8:	00e787b3          	add	a5,a5,a4
    800058ec:	00379793          	slli	a5,a5,0x3
    800058f0:	00f78793          	addi	a5,a5,15
    800058f4:	ff07f793          	andi	a5,a5,-16
    800058f8:	40f10133          	sub	sp,sp,a5
    800058fc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005900:	00191c13          	slli	s8,s2,0x1
    80005904:	012c07b3          	add	a5,s8,s2
    80005908:	00379793          	slli	a5,a5,0x3
    8000590c:	00fa07b3          	add	a5,s4,a5
    80005910:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005914:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005918:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    8000591c:	02800513          	li	a0,40
    80005920:	ffffd097          	auipc	ra,0xffffd
    80005924:	830080e7          	jalr	-2000(ra) # 80002150 <_Znwm>
    80005928:	00050b13          	mv	s6,a0
    8000592c:	012c0c33          	add	s8,s8,s2
    80005930:	003c1c13          	slli	s8,s8,0x3
    80005934:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005938:	ffffc097          	auipc	ra,0xffffc
    8000593c:	334080e7          	jalr	820(ra) # 80001c6c <_ZN6ThreadC1Ev>
    80005940:	00007797          	auipc	a5,0x7
    80005944:	19878793          	addi	a5,a5,408 # 8000cad8 <_ZTV12ConsumerSync+0x10>
    80005948:	00fb3023          	sd	a5,0(s6)
    8000594c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005950:	000b0513          	mv	a0,s6
    80005954:	ffffc097          	auipc	ra,0xffffc
    80005958:	34c080e7          	jalr	844(ra) # 80001ca0 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000595c:	00000493          	li	s1,0
    80005960:	0380006f          	j	80005998 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005964:	00007797          	auipc	a5,0x7
    80005968:	14c78793          	addi	a5,a5,332 # 8000cab0 <_ZTV12ProducerSync+0x10>
    8000596c:	00fcb023          	sd	a5,0(s9)
    80005970:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005974:	00349793          	slli	a5,s1,0x3
    80005978:	00f987b3          	add	a5,s3,a5
    8000597c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005980:	00349793          	slli	a5,s1,0x3
    80005984:	00f987b3          	add	a5,s3,a5
    80005988:	0007b503          	ld	a0,0(a5)
    8000598c:	ffffc097          	auipc	ra,0xffffc
    80005990:	314080e7          	jalr	788(ra) # 80001ca0 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005994:	0014849b          	addiw	s1,s1,1
    80005998:	0b24d063          	bge	s1,s2,80005a38 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000599c:	00149793          	slli	a5,s1,0x1
    800059a0:	009787b3          	add	a5,a5,s1
    800059a4:	00379793          	slli	a5,a5,0x3
    800059a8:	00fa07b3          	add	a5,s4,a5
    800059ac:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800059b0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800059b4:	00007717          	auipc	a4,0x7
    800059b8:	2c473703          	ld	a4,708(a4) # 8000cc78 <_ZL10waitForAll>
    800059bc:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800059c0:	02905863          	blez	s1,800059f0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800059c4:	02800513          	li	a0,40
    800059c8:	ffffc097          	auipc	ra,0xffffc
    800059cc:	788080e7          	jalr	1928(ra) # 80002150 <_Znwm>
    800059d0:	00050c93          	mv	s9,a0
    800059d4:	00149c13          	slli	s8,s1,0x1
    800059d8:	009c0c33          	add	s8,s8,s1
    800059dc:	003c1c13          	slli	s8,s8,0x3
    800059e0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800059e4:	ffffc097          	auipc	ra,0xffffc
    800059e8:	288080e7          	jalr	648(ra) # 80001c6c <_ZN6ThreadC1Ev>
    800059ec:	f79ff06f          	j	80005964 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800059f0:	02800513          	li	a0,40
    800059f4:	ffffc097          	auipc	ra,0xffffc
    800059f8:	75c080e7          	jalr	1884(ra) # 80002150 <_Znwm>
    800059fc:	00050c93          	mv	s9,a0
    80005a00:	00149c13          	slli	s8,s1,0x1
    80005a04:	009c0c33          	add	s8,s8,s1
    80005a08:	003c1c13          	slli	s8,s8,0x3
    80005a0c:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005a10:	ffffc097          	auipc	ra,0xffffc
    80005a14:	25c080e7          	jalr	604(ra) # 80001c6c <_ZN6ThreadC1Ev>
    80005a18:	00007797          	auipc	a5,0x7
    80005a1c:	07078793          	addi	a5,a5,112 # 8000ca88 <_ZTV16ProducerKeyboard+0x10>
    80005a20:	00fcb023          	sd	a5,0(s9)
    80005a24:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005a28:	00349793          	slli	a5,s1,0x3
    80005a2c:	00f987b3          	add	a5,s3,a5
    80005a30:	0197b023          	sd	s9,0(a5)
    80005a34:	f4dff06f          	j	80005980 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005a38:	ffffc097          	auipc	ra,0xffffc
    80005a3c:	2c0080e7          	jalr	704(ra) # 80001cf8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005a40:	00000493          	li	s1,0
    80005a44:	00994e63          	blt	s2,s1,80005a60 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005a48:	00007517          	auipc	a0,0x7
    80005a4c:	23053503          	ld	a0,560(a0) # 8000cc78 <_ZL10waitForAll>
    80005a50:	ffffc097          	auipc	ra,0xffffc
    80005a54:	df0080e7          	jalr	-528(ra) # 80001840 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005a58:	0014849b          	addiw	s1,s1,1
    80005a5c:	fe9ff06f          	j	80005a44 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005a60:	00000493          	li	s1,0
    80005a64:	0080006f          	j	80005a6c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005a68:	0014849b          	addiw	s1,s1,1
    80005a6c:	0324d263          	bge	s1,s2,80005a90 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005a70:	00349793          	slli	a5,s1,0x3
    80005a74:	00f987b3          	add	a5,s3,a5
    80005a78:	0007b503          	ld	a0,0(a5)
    80005a7c:	fe0506e3          	beqz	a0,80005a68 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005a80:	00053783          	ld	a5,0(a0)
    80005a84:	0087b783          	ld	a5,8(a5)
    80005a88:	000780e7          	jalr	a5
    80005a8c:	fddff06f          	j	80005a68 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005a90:	000b0a63          	beqz	s6,80005aa4 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005a94:	000b3783          	ld	a5,0(s6)
    80005a98:	0087b783          	ld	a5,8(a5)
    80005a9c:	000b0513          	mv	a0,s6
    80005aa0:	000780e7          	jalr	a5
    delete waitForAll;
    80005aa4:	00007517          	auipc	a0,0x7
    80005aa8:	1d453503          	ld	a0,468(a0) # 8000cc78 <_ZL10waitForAll>
    80005aac:	00050863          	beqz	a0,80005abc <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005ab0:	00053783          	ld	a5,0(a0)
    80005ab4:	0087b783          	ld	a5,8(a5)
    80005ab8:	000780e7          	jalr	a5
    delete buffer;
    80005abc:	000a8e63          	beqz	s5,80005ad8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005ac0:	000a8513          	mv	a0,s5
    80005ac4:	00001097          	auipc	ra,0x1
    80005ac8:	8b4080e7          	jalr	-1868(ra) # 80006378 <_ZN9BufferCPPD1Ev>
    80005acc:	000a8513          	mv	a0,s5
    80005ad0:	ffffc097          	auipc	ra,0xffffc
    80005ad4:	6d0080e7          	jalr	1744(ra) # 800021a0 <_ZdlPv>
    80005ad8:	000b8113          	mv	sp,s7

}
    80005adc:	f8040113          	addi	sp,s0,-128
    80005ae0:	07813083          	ld	ra,120(sp)
    80005ae4:	07013403          	ld	s0,112(sp)
    80005ae8:	06813483          	ld	s1,104(sp)
    80005aec:	06013903          	ld	s2,96(sp)
    80005af0:	05813983          	ld	s3,88(sp)
    80005af4:	05013a03          	ld	s4,80(sp)
    80005af8:	04813a83          	ld	s5,72(sp)
    80005afc:	04013b03          	ld	s6,64(sp)
    80005b00:	03813b83          	ld	s7,56(sp)
    80005b04:	03013c03          	ld	s8,48(sp)
    80005b08:	02813c83          	ld	s9,40(sp)
    80005b0c:	08010113          	addi	sp,sp,128
    80005b10:	00008067          	ret
    80005b14:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005b18:	000a8513          	mv	a0,s5
    80005b1c:	ffffc097          	auipc	ra,0xffffc
    80005b20:	684080e7          	jalr	1668(ra) # 800021a0 <_ZdlPv>
    80005b24:	00048513          	mv	a0,s1
    80005b28:	00008097          	auipc	ra,0x8
    80005b2c:	230080e7          	jalr	560(ra) # 8000dd58 <_Unwind_Resume>
    80005b30:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005b34:	00048513          	mv	a0,s1
    80005b38:	ffffc097          	auipc	ra,0xffffc
    80005b3c:	668080e7          	jalr	1640(ra) # 800021a0 <_ZdlPv>
    80005b40:	00090513          	mv	a0,s2
    80005b44:	00008097          	auipc	ra,0x8
    80005b48:	214080e7          	jalr	532(ra) # 8000dd58 <_Unwind_Resume>
    80005b4c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005b50:	000b0513          	mv	a0,s6
    80005b54:	ffffc097          	auipc	ra,0xffffc
    80005b58:	64c080e7          	jalr	1612(ra) # 800021a0 <_ZdlPv>
    80005b5c:	00048513          	mv	a0,s1
    80005b60:	00008097          	auipc	ra,0x8
    80005b64:	1f8080e7          	jalr	504(ra) # 8000dd58 <_Unwind_Resume>
    80005b68:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005b6c:	000c8513          	mv	a0,s9
    80005b70:	ffffc097          	auipc	ra,0xffffc
    80005b74:	630080e7          	jalr	1584(ra) # 800021a0 <_ZdlPv>
    80005b78:	00048513          	mv	a0,s1
    80005b7c:	00008097          	auipc	ra,0x8
    80005b80:	1dc080e7          	jalr	476(ra) # 8000dd58 <_Unwind_Resume>
    80005b84:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005b88:	000c8513          	mv	a0,s9
    80005b8c:	ffffc097          	auipc	ra,0xffffc
    80005b90:	614080e7          	jalr	1556(ra) # 800021a0 <_ZdlPv>
    80005b94:	00048513          	mv	a0,s1
    80005b98:	00008097          	auipc	ra,0x8
    80005b9c:	1c0080e7          	jalr	448(ra) # 8000dd58 <_Unwind_Resume>

0000000080005ba0 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005ba0:	ff010113          	addi	sp,sp,-16
    80005ba4:	00113423          	sd	ra,8(sp)
    80005ba8:	00813023          	sd	s0,0(sp)
    80005bac:	01010413          	addi	s0,sp,16
    80005bb0:	00007797          	auipc	a5,0x7
    80005bb4:	f2878793          	addi	a5,a5,-216 # 8000cad8 <_ZTV12ConsumerSync+0x10>
    80005bb8:	00f53023          	sd	a5,0(a0)
    80005bbc:	ffffc097          	auipc	ra,0xffffc
    80005bc0:	fe0080e7          	jalr	-32(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80005bc4:	00813083          	ld	ra,8(sp)
    80005bc8:	00013403          	ld	s0,0(sp)
    80005bcc:	01010113          	addi	sp,sp,16
    80005bd0:	00008067          	ret

0000000080005bd4 <_ZN12ConsumerSyncD0Ev>:
    80005bd4:	fe010113          	addi	sp,sp,-32
    80005bd8:	00113c23          	sd	ra,24(sp)
    80005bdc:	00813823          	sd	s0,16(sp)
    80005be0:	00913423          	sd	s1,8(sp)
    80005be4:	02010413          	addi	s0,sp,32
    80005be8:	00050493          	mv	s1,a0
    80005bec:	00007797          	auipc	a5,0x7
    80005bf0:	eec78793          	addi	a5,a5,-276 # 8000cad8 <_ZTV12ConsumerSync+0x10>
    80005bf4:	00f53023          	sd	a5,0(a0)
    80005bf8:	ffffc097          	auipc	ra,0xffffc
    80005bfc:	fa4080e7          	jalr	-92(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80005c00:	00048513          	mv	a0,s1
    80005c04:	ffffc097          	auipc	ra,0xffffc
    80005c08:	59c080e7          	jalr	1436(ra) # 800021a0 <_ZdlPv>
    80005c0c:	01813083          	ld	ra,24(sp)
    80005c10:	01013403          	ld	s0,16(sp)
    80005c14:	00813483          	ld	s1,8(sp)
    80005c18:	02010113          	addi	sp,sp,32
    80005c1c:	00008067          	ret

0000000080005c20 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005c20:	ff010113          	addi	sp,sp,-16
    80005c24:	00113423          	sd	ra,8(sp)
    80005c28:	00813023          	sd	s0,0(sp)
    80005c2c:	01010413          	addi	s0,sp,16
    80005c30:	00007797          	auipc	a5,0x7
    80005c34:	e8078793          	addi	a5,a5,-384 # 8000cab0 <_ZTV12ProducerSync+0x10>
    80005c38:	00f53023          	sd	a5,0(a0)
    80005c3c:	ffffc097          	auipc	ra,0xffffc
    80005c40:	f60080e7          	jalr	-160(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80005c44:	00813083          	ld	ra,8(sp)
    80005c48:	00013403          	ld	s0,0(sp)
    80005c4c:	01010113          	addi	sp,sp,16
    80005c50:	00008067          	ret

0000000080005c54 <_ZN12ProducerSyncD0Ev>:
    80005c54:	fe010113          	addi	sp,sp,-32
    80005c58:	00113c23          	sd	ra,24(sp)
    80005c5c:	00813823          	sd	s0,16(sp)
    80005c60:	00913423          	sd	s1,8(sp)
    80005c64:	02010413          	addi	s0,sp,32
    80005c68:	00050493          	mv	s1,a0
    80005c6c:	00007797          	auipc	a5,0x7
    80005c70:	e4478793          	addi	a5,a5,-444 # 8000cab0 <_ZTV12ProducerSync+0x10>
    80005c74:	00f53023          	sd	a5,0(a0)
    80005c78:	ffffc097          	auipc	ra,0xffffc
    80005c7c:	f24080e7          	jalr	-220(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80005c80:	00048513          	mv	a0,s1
    80005c84:	ffffc097          	auipc	ra,0xffffc
    80005c88:	51c080e7          	jalr	1308(ra) # 800021a0 <_ZdlPv>
    80005c8c:	01813083          	ld	ra,24(sp)
    80005c90:	01013403          	ld	s0,16(sp)
    80005c94:	00813483          	ld	s1,8(sp)
    80005c98:	02010113          	addi	sp,sp,32
    80005c9c:	00008067          	ret

0000000080005ca0 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005ca0:	ff010113          	addi	sp,sp,-16
    80005ca4:	00113423          	sd	ra,8(sp)
    80005ca8:	00813023          	sd	s0,0(sp)
    80005cac:	01010413          	addi	s0,sp,16
    80005cb0:	00007797          	auipc	a5,0x7
    80005cb4:	dd878793          	addi	a5,a5,-552 # 8000ca88 <_ZTV16ProducerKeyboard+0x10>
    80005cb8:	00f53023          	sd	a5,0(a0)
    80005cbc:	ffffc097          	auipc	ra,0xffffc
    80005cc0:	ee0080e7          	jalr	-288(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80005cc4:	00813083          	ld	ra,8(sp)
    80005cc8:	00013403          	ld	s0,0(sp)
    80005ccc:	01010113          	addi	sp,sp,16
    80005cd0:	00008067          	ret

0000000080005cd4 <_ZN16ProducerKeyboardD0Ev>:
    80005cd4:	fe010113          	addi	sp,sp,-32
    80005cd8:	00113c23          	sd	ra,24(sp)
    80005cdc:	00813823          	sd	s0,16(sp)
    80005ce0:	00913423          	sd	s1,8(sp)
    80005ce4:	02010413          	addi	s0,sp,32
    80005ce8:	00050493          	mv	s1,a0
    80005cec:	00007797          	auipc	a5,0x7
    80005cf0:	d9c78793          	addi	a5,a5,-612 # 8000ca88 <_ZTV16ProducerKeyboard+0x10>
    80005cf4:	00f53023          	sd	a5,0(a0)
    80005cf8:	ffffc097          	auipc	ra,0xffffc
    80005cfc:	ea4080e7          	jalr	-348(ra) # 80001b9c <_ZN6ThreadD1Ev>
    80005d00:	00048513          	mv	a0,s1
    80005d04:	ffffc097          	auipc	ra,0xffffc
    80005d08:	49c080e7          	jalr	1180(ra) # 800021a0 <_ZdlPv>
    80005d0c:	01813083          	ld	ra,24(sp)
    80005d10:	01013403          	ld	s0,16(sp)
    80005d14:	00813483          	ld	s1,8(sp)
    80005d18:	02010113          	addi	sp,sp,32
    80005d1c:	00008067          	ret

0000000080005d20 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005d20:	ff010113          	addi	sp,sp,-16
    80005d24:	00113423          	sd	ra,8(sp)
    80005d28:	00813023          	sd	s0,0(sp)
    80005d2c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005d30:	02053583          	ld	a1,32(a0)
    80005d34:	fffff097          	auipc	ra,0xfffff
    80005d38:	7e4080e7          	jalr	2020(ra) # 80005518 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005d3c:	00813083          	ld	ra,8(sp)
    80005d40:	00013403          	ld	s0,0(sp)
    80005d44:	01010113          	addi	sp,sp,16
    80005d48:	00008067          	ret

0000000080005d4c <_ZN12ProducerSync3runEv>:
    void run() override {
    80005d4c:	ff010113          	addi	sp,sp,-16
    80005d50:	00113423          	sd	ra,8(sp)
    80005d54:	00813023          	sd	s0,0(sp)
    80005d58:	01010413          	addi	s0,sp,16
        producer(td);
    80005d5c:	02053583          	ld	a1,32(a0)
    80005d60:	00000097          	auipc	ra,0x0
    80005d64:	878080e7          	jalr	-1928(ra) # 800055d8 <_ZN12ProducerSync8producerEPv>
    }
    80005d68:	00813083          	ld	ra,8(sp)
    80005d6c:	00013403          	ld	s0,0(sp)
    80005d70:	01010113          	addi	sp,sp,16
    80005d74:	00008067          	ret

0000000080005d78 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005d78:	ff010113          	addi	sp,sp,-16
    80005d7c:	00113423          	sd	ra,8(sp)
    80005d80:	00813023          	sd	s0,0(sp)
    80005d84:	01010413          	addi	s0,sp,16
        consumer(td);
    80005d88:	02053583          	ld	a1,32(a0)
    80005d8c:	00000097          	auipc	ra,0x0
    80005d90:	8e0080e7          	jalr	-1824(ra) # 8000566c <_ZN12ConsumerSync8consumerEPv>
    }
    80005d94:	00813083          	ld	ra,8(sp)
    80005d98:	00013403          	ld	s0,0(sp)
    80005d9c:	01010113          	addi	sp,sp,16
    80005da0:	00008067          	ret

0000000080005da4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005da4:	fe010113          	addi	sp,sp,-32
    80005da8:	00113c23          	sd	ra,24(sp)
    80005dac:	00813823          	sd	s0,16(sp)
    80005db0:	00913423          	sd	s1,8(sp)
    80005db4:	02010413          	addi	s0,sp,32
    80005db8:	00050493          	mv	s1,a0
    LOCK();
    80005dbc:	00100613          	li	a2,1
    80005dc0:	00000593          	li	a1,0
    80005dc4:	00007517          	auipc	a0,0x7
    80005dc8:	ebc50513          	addi	a0,a0,-324 # 8000cc80 <lockPrint>
    80005dcc:	ffffb097          	auipc	ra,0xffffb
    80005dd0:	4a0080e7          	jalr	1184(ra) # 8000126c <copy_and_swap>
    80005dd4:	00050863          	beqz	a0,80005de4 <_Z11printStringPKc+0x40>
    80005dd8:	ffffb097          	auipc	ra,0xffffb
    80005ddc:	5f8080e7          	jalr	1528(ra) # 800013d0 <_Z15thread_dispatchv>
    80005de0:	fddff06f          	j	80005dbc <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005de4:	0004c503          	lbu	a0,0(s1)
    80005de8:	00050a63          	beqz	a0,80005dfc <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005dec:	ffffc097          	auipc	ra,0xffffc
    80005df0:	8a4080e7          	jalr	-1884(ra) # 80001690 <_Z4putcc>
        string++;
    80005df4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005df8:	fedff06f          	j	80005de4 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005dfc:	00000613          	li	a2,0
    80005e00:	00100593          	li	a1,1
    80005e04:	00007517          	auipc	a0,0x7
    80005e08:	e7c50513          	addi	a0,a0,-388 # 8000cc80 <lockPrint>
    80005e0c:	ffffb097          	auipc	ra,0xffffb
    80005e10:	460080e7          	jalr	1120(ra) # 8000126c <copy_and_swap>
    80005e14:	fe0514e3          	bnez	a0,80005dfc <_Z11printStringPKc+0x58>
}
    80005e18:	01813083          	ld	ra,24(sp)
    80005e1c:	01013403          	ld	s0,16(sp)
    80005e20:	00813483          	ld	s1,8(sp)
    80005e24:	02010113          	addi	sp,sp,32
    80005e28:	00008067          	ret

0000000080005e2c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005e2c:	fd010113          	addi	sp,sp,-48
    80005e30:	02113423          	sd	ra,40(sp)
    80005e34:	02813023          	sd	s0,32(sp)
    80005e38:	00913c23          	sd	s1,24(sp)
    80005e3c:	01213823          	sd	s2,16(sp)
    80005e40:	01313423          	sd	s3,8(sp)
    80005e44:	01413023          	sd	s4,0(sp)
    80005e48:	03010413          	addi	s0,sp,48
    80005e4c:	00050993          	mv	s3,a0
    80005e50:	00058a13          	mv	s4,a1
    LOCK();
    80005e54:	00100613          	li	a2,1
    80005e58:	00000593          	li	a1,0
    80005e5c:	00007517          	auipc	a0,0x7
    80005e60:	e2450513          	addi	a0,a0,-476 # 8000cc80 <lockPrint>
    80005e64:	ffffb097          	auipc	ra,0xffffb
    80005e68:	408080e7          	jalr	1032(ra) # 8000126c <copy_and_swap>
    80005e6c:	00050863          	beqz	a0,80005e7c <_Z9getStringPci+0x50>
    80005e70:	ffffb097          	auipc	ra,0xffffb
    80005e74:	560080e7          	jalr	1376(ra) # 800013d0 <_Z15thread_dispatchv>
    80005e78:	fddff06f          	j	80005e54 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005e7c:	00000493          	li	s1,0
    80005e80:	00048913          	mv	s2,s1
    80005e84:	0014849b          	addiw	s1,s1,1
    80005e88:	0344da63          	bge	s1,s4,80005ebc <_Z9getStringPci+0x90>
        cc = getc();
    80005e8c:	ffffb097          	auipc	ra,0xffffb
    80005e90:	7d8080e7          	jalr	2008(ra) # 80001664 <_Z4getcv>
        if(cc < 1)
    80005e94:	06050a63          	beqz	a0,80005f08 <_Z9getStringPci+0xdc>
            break;
        c = cc;
        buf[i++] = c;
    80005e98:	01298933          	add	s2,s3,s2
    80005e9c:	00a90023          	sb	a0,0(s2)
        if(c == '\n' || c == '\r' || c==' ')
    80005ea0:	00a00793          	li	a5,10
    80005ea4:	00f50e63          	beq	a0,a5,80005ec0 <_Z9getStringPci+0x94>
    80005ea8:	00d00793          	li	a5,13
    80005eac:	00f50a63          	beq	a0,a5,80005ec0 <_Z9getStringPci+0x94>
    80005eb0:	02000793          	li	a5,32
    80005eb4:	fcf516e3          	bne	a0,a5,80005e80 <_Z9getStringPci+0x54>
    80005eb8:	0080006f          	j	80005ec0 <_Z9getStringPci+0x94>
    80005ebc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005ec0:	009984b3          	add	s1,s3,s1
    80005ec4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005ec8:	00000613          	li	a2,0
    80005ecc:	00100593          	li	a1,1
    80005ed0:	00007517          	auipc	a0,0x7
    80005ed4:	db050513          	addi	a0,a0,-592 # 8000cc80 <lockPrint>
    80005ed8:	ffffb097          	auipc	ra,0xffffb
    80005edc:	394080e7          	jalr	916(ra) # 8000126c <copy_and_swap>
    80005ee0:	fe0514e3          	bnez	a0,80005ec8 <_Z9getStringPci+0x9c>
    return buf;
}
    80005ee4:	00098513          	mv	a0,s3
    80005ee8:	02813083          	ld	ra,40(sp)
    80005eec:	02013403          	ld	s0,32(sp)
    80005ef0:	01813483          	ld	s1,24(sp)
    80005ef4:	01013903          	ld	s2,16(sp)
    80005ef8:	00813983          	ld	s3,8(sp)
    80005efc:	00013a03          	ld	s4,0(sp)
    80005f00:	03010113          	addi	sp,sp,48
    80005f04:	00008067          	ret
    80005f08:	00090493          	mv	s1,s2
    80005f0c:	fb5ff06f          	j	80005ec0 <_Z9getStringPci+0x94>

0000000080005f10 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005f10:	ff010113          	addi	sp,sp,-16
    80005f14:	00813423          	sd	s0,8(sp)
    80005f18:	01010413          	addi	s0,sp,16
    80005f1c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005f20:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005f24:	0006c603          	lbu	a2,0(a3)
    80005f28:	fd06071b          	addiw	a4,a2,-48
    80005f2c:	0ff77713          	andi	a4,a4,255
    80005f30:	00900793          	li	a5,9
    80005f34:	02e7e063          	bltu	a5,a4,80005f54 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005f38:	0025179b          	slliw	a5,a0,0x2
    80005f3c:	00a787bb          	addw	a5,a5,a0
    80005f40:	0017979b          	slliw	a5,a5,0x1
    80005f44:	00168693          	addi	a3,a3,1
    80005f48:	00c787bb          	addw	a5,a5,a2
    80005f4c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005f50:	fd5ff06f          	j	80005f24 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005f54:	00813403          	ld	s0,8(sp)
    80005f58:	01010113          	addi	sp,sp,16
    80005f5c:	00008067          	ret

0000000080005f60 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005f60:	fc010113          	addi	sp,sp,-64
    80005f64:	02113c23          	sd	ra,56(sp)
    80005f68:	02813823          	sd	s0,48(sp)
    80005f6c:	02913423          	sd	s1,40(sp)
    80005f70:	03213023          	sd	s2,32(sp)
    80005f74:	01313c23          	sd	s3,24(sp)
    80005f78:	04010413          	addi	s0,sp,64
    80005f7c:	00050493          	mv	s1,a0
    80005f80:	00058913          	mv	s2,a1
    80005f84:	00060993          	mv	s3,a2
    LOCK();
    80005f88:	00100613          	li	a2,1
    80005f8c:	00000593          	li	a1,0
    80005f90:	00007517          	auipc	a0,0x7
    80005f94:	cf050513          	addi	a0,a0,-784 # 8000cc80 <lockPrint>
    80005f98:	ffffb097          	auipc	ra,0xffffb
    80005f9c:	2d4080e7          	jalr	724(ra) # 8000126c <copy_and_swap>
    80005fa0:	00050863          	beqz	a0,80005fb0 <_Z8printIntiii+0x50>
    80005fa4:	ffffb097          	auipc	ra,0xffffb
    80005fa8:	42c080e7          	jalr	1068(ra) # 800013d0 <_Z15thread_dispatchv>
    80005fac:	fddff06f          	j	80005f88 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005fb0:	00098463          	beqz	s3,80005fb8 <_Z8printIntiii+0x58>
    80005fb4:	0804c463          	bltz	s1,8000603c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005fb8:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005fbc:	00000593          	li	a1,0
    }

    i = 0;
    80005fc0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005fc4:	0009079b          	sext.w	a5,s2
    80005fc8:	0325773b          	remuw	a4,a0,s2
    80005fcc:	00048613          	mv	a2,s1
    80005fd0:	0014849b          	addiw	s1,s1,1
    80005fd4:	02071693          	slli	a3,a4,0x20
    80005fd8:	0206d693          	srli	a3,a3,0x20
    80005fdc:	00007717          	auipc	a4,0x7
    80005fe0:	b1470713          	addi	a4,a4,-1260 # 8000caf0 <digits>
    80005fe4:	00d70733          	add	a4,a4,a3
    80005fe8:	00074683          	lbu	a3,0(a4)
    80005fec:	fd040713          	addi	a4,s0,-48
    80005ff0:	00c70733          	add	a4,a4,a2
    80005ff4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005ff8:	0005071b          	sext.w	a4,a0
    80005ffc:	0325553b          	divuw	a0,a0,s2
    80006000:	fcf772e3          	bgeu	a4,a5,80005fc4 <_Z8printIntiii+0x64>
    if(neg)
    80006004:	00058c63          	beqz	a1,8000601c <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80006008:	fd040793          	addi	a5,s0,-48
    8000600c:	009784b3          	add	s1,a5,s1
    80006010:	02d00793          	li	a5,45
    80006014:	fef48823          	sb	a5,-16(s1)
    80006018:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    8000601c:	fff4849b          	addiw	s1,s1,-1
    80006020:	0204c463          	bltz	s1,80006048 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80006024:	fd040793          	addi	a5,s0,-48
    80006028:	009787b3          	add	a5,a5,s1
    8000602c:	ff07c503          	lbu	a0,-16(a5)
    80006030:	ffffb097          	auipc	ra,0xffffb
    80006034:	660080e7          	jalr	1632(ra) # 80001690 <_Z4putcc>
    80006038:	fe5ff06f          	j	8000601c <_Z8printIntiii+0xbc>
        x = -xx;
    8000603c:	4090053b          	negw	a0,s1
        neg = 1;
    80006040:	00100593          	li	a1,1
        x = -xx;
    80006044:	f7dff06f          	j	80005fc0 <_Z8printIntiii+0x60>

    UNLOCK();
    80006048:	00000613          	li	a2,0
    8000604c:	00100593          	li	a1,1
    80006050:	00007517          	auipc	a0,0x7
    80006054:	c3050513          	addi	a0,a0,-976 # 8000cc80 <lockPrint>
    80006058:	ffffb097          	auipc	ra,0xffffb
    8000605c:	214080e7          	jalr	532(ra) # 8000126c <copy_and_swap>
    80006060:	fe0514e3          	bnez	a0,80006048 <_Z8printIntiii+0xe8>
    80006064:	03813083          	ld	ra,56(sp)
    80006068:	03013403          	ld	s0,48(sp)
    8000606c:	02813483          	ld	s1,40(sp)
    80006070:	02013903          	ld	s2,32(sp)
    80006074:	01813983          	ld	s3,24(sp)
    80006078:	04010113          	addi	sp,sp,64
    8000607c:	00008067          	ret

0000000080006080 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006080:	fd010113          	addi	sp,sp,-48
    80006084:	02113423          	sd	ra,40(sp)
    80006088:	02813023          	sd	s0,32(sp)
    8000608c:	00913c23          	sd	s1,24(sp)
    80006090:	01213823          	sd	s2,16(sp)
    80006094:	01313423          	sd	s3,8(sp)
    80006098:	03010413          	addi	s0,sp,48
    8000609c:	00050493          	mv	s1,a0
    800060a0:	00058913          	mv	s2,a1
    800060a4:	0015879b          	addiw	a5,a1,1
    800060a8:	0007851b          	sext.w	a0,a5
    800060ac:	00f4a023          	sw	a5,0(s1)
    800060b0:	0004a823          	sw	zero,16(s1)
    800060b4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800060b8:	00251513          	slli	a0,a0,0x2
    800060bc:	ffffb097          	auipc	ra,0xffffb
    800060c0:	1d0080e7          	jalr	464(ra) # 8000128c <_Z9mem_allocm>
    800060c4:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800060c8:	01000513          	li	a0,16
    800060cc:	ffffc097          	auipc	ra,0xffffc
    800060d0:	084080e7          	jalr	132(ra) # 80002150 <_Znwm>
    800060d4:	00050993          	mv	s3,a0
    800060d8:	00000593          	li	a1,0
    800060dc:	ffffb097          	auipc	ra,0xffffb
    800060e0:	728080e7          	jalr	1832(ra) # 80001804 <_ZN9SemaphoreC1Ej>
    800060e4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800060e8:	01000513          	li	a0,16
    800060ec:	ffffc097          	auipc	ra,0xffffc
    800060f0:	064080e7          	jalr	100(ra) # 80002150 <_Znwm>
    800060f4:	00050993          	mv	s3,a0
    800060f8:	00090593          	mv	a1,s2
    800060fc:	ffffb097          	auipc	ra,0xffffb
    80006100:	708080e7          	jalr	1800(ra) # 80001804 <_ZN9SemaphoreC1Ej>
    80006104:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006108:	01000513          	li	a0,16
    8000610c:	ffffc097          	auipc	ra,0xffffc
    80006110:	044080e7          	jalr	68(ra) # 80002150 <_Znwm>
    80006114:	00050913          	mv	s2,a0
    80006118:	00100593          	li	a1,1
    8000611c:	ffffb097          	auipc	ra,0xffffb
    80006120:	6e8080e7          	jalr	1768(ra) # 80001804 <_ZN9SemaphoreC1Ej>
    80006124:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006128:	01000513          	li	a0,16
    8000612c:	ffffc097          	auipc	ra,0xffffc
    80006130:	024080e7          	jalr	36(ra) # 80002150 <_Znwm>
    80006134:	00050913          	mv	s2,a0
    80006138:	00100593          	li	a1,1
    8000613c:	ffffb097          	auipc	ra,0xffffb
    80006140:	6c8080e7          	jalr	1736(ra) # 80001804 <_ZN9SemaphoreC1Ej>
    80006144:	0324b823          	sd	s2,48(s1)
}
    80006148:	02813083          	ld	ra,40(sp)
    8000614c:	02013403          	ld	s0,32(sp)
    80006150:	01813483          	ld	s1,24(sp)
    80006154:	01013903          	ld	s2,16(sp)
    80006158:	00813983          	ld	s3,8(sp)
    8000615c:	03010113          	addi	sp,sp,48
    80006160:	00008067          	ret
    80006164:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006168:	00098513          	mv	a0,s3
    8000616c:	ffffc097          	auipc	ra,0xffffc
    80006170:	034080e7          	jalr	52(ra) # 800021a0 <_ZdlPv>
    80006174:	00048513          	mv	a0,s1
    80006178:	00008097          	auipc	ra,0x8
    8000617c:	be0080e7          	jalr	-1056(ra) # 8000dd58 <_Unwind_Resume>
    80006180:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006184:	00098513          	mv	a0,s3
    80006188:	ffffc097          	auipc	ra,0xffffc
    8000618c:	018080e7          	jalr	24(ra) # 800021a0 <_ZdlPv>
    80006190:	00048513          	mv	a0,s1
    80006194:	00008097          	auipc	ra,0x8
    80006198:	bc4080e7          	jalr	-1084(ra) # 8000dd58 <_Unwind_Resume>
    8000619c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800061a0:	00090513          	mv	a0,s2
    800061a4:	ffffc097          	auipc	ra,0xffffc
    800061a8:	ffc080e7          	jalr	-4(ra) # 800021a0 <_ZdlPv>
    800061ac:	00048513          	mv	a0,s1
    800061b0:	00008097          	auipc	ra,0x8
    800061b4:	ba8080e7          	jalr	-1112(ra) # 8000dd58 <_Unwind_Resume>
    800061b8:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800061bc:	00090513          	mv	a0,s2
    800061c0:	ffffc097          	auipc	ra,0xffffc
    800061c4:	fe0080e7          	jalr	-32(ra) # 800021a0 <_ZdlPv>
    800061c8:	00048513          	mv	a0,s1
    800061cc:	00008097          	auipc	ra,0x8
    800061d0:	b8c080e7          	jalr	-1140(ra) # 8000dd58 <_Unwind_Resume>

00000000800061d4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800061d4:	fe010113          	addi	sp,sp,-32
    800061d8:	00113c23          	sd	ra,24(sp)
    800061dc:	00813823          	sd	s0,16(sp)
    800061e0:	00913423          	sd	s1,8(sp)
    800061e4:	01213023          	sd	s2,0(sp)
    800061e8:	02010413          	addi	s0,sp,32
    800061ec:	00050493          	mv	s1,a0
    800061f0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800061f4:	01853503          	ld	a0,24(a0)
    800061f8:	ffffb097          	auipc	ra,0xffffb
    800061fc:	648080e7          	jalr	1608(ra) # 80001840 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006200:	0304b503          	ld	a0,48(s1)
    80006204:	ffffb097          	auipc	ra,0xffffb
    80006208:	63c080e7          	jalr	1596(ra) # 80001840 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000620c:	0084b783          	ld	a5,8(s1)
    80006210:	0144a703          	lw	a4,20(s1)
    80006214:	00271713          	slli	a4,a4,0x2
    80006218:	00e787b3          	add	a5,a5,a4
    8000621c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006220:	0144a783          	lw	a5,20(s1)
    80006224:	0017879b          	addiw	a5,a5,1
    80006228:	0004a703          	lw	a4,0(s1)
    8000622c:	02e7e7bb          	remw	a5,a5,a4
    80006230:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006234:	0304b503          	ld	a0,48(s1)
    80006238:	ffffb097          	auipc	ra,0xffffb
    8000623c:	634080e7          	jalr	1588(ra) # 8000186c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006240:	0204b503          	ld	a0,32(s1)
    80006244:	ffffb097          	auipc	ra,0xffffb
    80006248:	628080e7          	jalr	1576(ra) # 8000186c <_ZN9Semaphore6signalEv>

}
    8000624c:	01813083          	ld	ra,24(sp)
    80006250:	01013403          	ld	s0,16(sp)
    80006254:	00813483          	ld	s1,8(sp)
    80006258:	00013903          	ld	s2,0(sp)
    8000625c:	02010113          	addi	sp,sp,32
    80006260:	00008067          	ret

0000000080006264 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006264:	fe010113          	addi	sp,sp,-32
    80006268:	00113c23          	sd	ra,24(sp)
    8000626c:	00813823          	sd	s0,16(sp)
    80006270:	00913423          	sd	s1,8(sp)
    80006274:	01213023          	sd	s2,0(sp)
    80006278:	02010413          	addi	s0,sp,32
    8000627c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006280:	02053503          	ld	a0,32(a0)
    80006284:	ffffb097          	auipc	ra,0xffffb
    80006288:	5bc080e7          	jalr	1468(ra) # 80001840 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000628c:	0284b503          	ld	a0,40(s1)
    80006290:	ffffb097          	auipc	ra,0xffffb
    80006294:	5b0080e7          	jalr	1456(ra) # 80001840 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006298:	0084b703          	ld	a4,8(s1)
    8000629c:	0104a783          	lw	a5,16(s1)
    800062a0:	00279693          	slli	a3,a5,0x2
    800062a4:	00d70733          	add	a4,a4,a3
    800062a8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800062ac:	0017879b          	addiw	a5,a5,1
    800062b0:	0004a703          	lw	a4,0(s1)
    800062b4:	02e7e7bb          	remw	a5,a5,a4
    800062b8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800062bc:	0284b503          	ld	a0,40(s1)
    800062c0:	ffffb097          	auipc	ra,0xffffb
    800062c4:	5ac080e7          	jalr	1452(ra) # 8000186c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800062c8:	0184b503          	ld	a0,24(s1)
    800062cc:	ffffb097          	auipc	ra,0xffffb
    800062d0:	5a0080e7          	jalr	1440(ra) # 8000186c <_ZN9Semaphore6signalEv>

    return ret;
}
    800062d4:	00090513          	mv	a0,s2
    800062d8:	01813083          	ld	ra,24(sp)
    800062dc:	01013403          	ld	s0,16(sp)
    800062e0:	00813483          	ld	s1,8(sp)
    800062e4:	00013903          	ld	s2,0(sp)
    800062e8:	02010113          	addi	sp,sp,32
    800062ec:	00008067          	ret

00000000800062f0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800062f0:	fe010113          	addi	sp,sp,-32
    800062f4:	00113c23          	sd	ra,24(sp)
    800062f8:	00813823          	sd	s0,16(sp)
    800062fc:	00913423          	sd	s1,8(sp)
    80006300:	01213023          	sd	s2,0(sp)
    80006304:	02010413          	addi	s0,sp,32
    80006308:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000630c:	02853503          	ld	a0,40(a0)
    80006310:	ffffb097          	auipc	ra,0xffffb
    80006314:	530080e7          	jalr	1328(ra) # 80001840 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006318:	0304b503          	ld	a0,48(s1)
    8000631c:	ffffb097          	auipc	ra,0xffffb
    80006320:	524080e7          	jalr	1316(ra) # 80001840 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006324:	0144a783          	lw	a5,20(s1)
    80006328:	0104a903          	lw	s2,16(s1)
    8000632c:	0327ce63          	blt	a5,s2,80006368 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006330:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006334:	0304b503          	ld	a0,48(s1)
    80006338:	ffffb097          	auipc	ra,0xffffb
    8000633c:	534080e7          	jalr	1332(ra) # 8000186c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006340:	0284b503          	ld	a0,40(s1)
    80006344:	ffffb097          	auipc	ra,0xffffb
    80006348:	528080e7          	jalr	1320(ra) # 8000186c <_ZN9Semaphore6signalEv>

    return ret;
}
    8000634c:	00090513          	mv	a0,s2
    80006350:	01813083          	ld	ra,24(sp)
    80006354:	01013403          	ld	s0,16(sp)
    80006358:	00813483          	ld	s1,8(sp)
    8000635c:	00013903          	ld	s2,0(sp)
    80006360:	02010113          	addi	sp,sp,32
    80006364:	00008067          	ret
        ret = cap - head + tail;
    80006368:	0004a703          	lw	a4,0(s1)
    8000636c:	4127093b          	subw	s2,a4,s2
    80006370:	00f9093b          	addw	s2,s2,a5
    80006374:	fc1ff06f          	j	80006334 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006378 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006378:	fe010113          	addi	sp,sp,-32
    8000637c:	00113c23          	sd	ra,24(sp)
    80006380:	00813823          	sd	s0,16(sp)
    80006384:	00913423          	sd	s1,8(sp)
    80006388:	02010413          	addi	s0,sp,32
    8000638c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006390:	00a00513          	li	a0,10
    80006394:	ffffc097          	auipc	ra,0xffffc
    80006398:	ab4080e7          	jalr	-1356(ra) # 80001e48 <_ZN7Console4putcEc>
    printString("_Buffer deleted!\n");
    8000639c:	00004517          	auipc	a0,0x4
    800063a0:	ffc50513          	addi	a0,a0,-4 # 8000a398 <CONSOLE_STATUS+0x388>
    800063a4:	00000097          	auipc	ra,0x0
    800063a8:	a00080e7          	jalr	-1536(ra) # 80005da4 <_Z11printStringPKc>
    while (getCnt()) {
    800063ac:	00048513          	mv	a0,s1
    800063b0:	00000097          	auipc	ra,0x0
    800063b4:	f40080e7          	jalr	-192(ra) # 800062f0 <_ZN9BufferCPP6getCntEv>
    800063b8:	02050c63          	beqz	a0,800063f0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800063bc:	0084b783          	ld	a5,8(s1)
    800063c0:	0104a703          	lw	a4,16(s1)
    800063c4:	00271713          	slli	a4,a4,0x2
    800063c8:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800063cc:	0007c503          	lbu	a0,0(a5)
    800063d0:	ffffc097          	auipc	ra,0xffffc
    800063d4:	a78080e7          	jalr	-1416(ra) # 80001e48 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800063d8:	0104a783          	lw	a5,16(s1)
    800063dc:	0017879b          	addiw	a5,a5,1
    800063e0:	0004a703          	lw	a4,0(s1)
    800063e4:	02e7e7bb          	remw	a5,a5,a4
    800063e8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800063ec:	fc1ff06f          	j	800063ac <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800063f0:	02100513          	li	a0,33
    800063f4:	ffffc097          	auipc	ra,0xffffc
    800063f8:	a54080e7          	jalr	-1452(ra) # 80001e48 <_ZN7Console4putcEc>
    Console::putc('\n');
    800063fc:	00a00513          	li	a0,10
    80006400:	ffffc097          	auipc	ra,0xffffc
    80006404:	a48080e7          	jalr	-1464(ra) # 80001e48 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006408:	0084b503          	ld	a0,8(s1)
    8000640c:	ffffb097          	auipc	ra,0xffffb
    80006410:	ec4080e7          	jalr	-316(ra) # 800012d0 <_Z8mem_freePv>
    delete itemAvailable;
    80006414:	0204b503          	ld	a0,32(s1)
    80006418:	00050863          	beqz	a0,80006428 <_ZN9BufferCPPD1Ev+0xb0>
    8000641c:	00053783          	ld	a5,0(a0)
    80006420:	0087b783          	ld	a5,8(a5)
    80006424:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006428:	0184b503          	ld	a0,24(s1)
    8000642c:	00050863          	beqz	a0,8000643c <_ZN9BufferCPPD1Ev+0xc4>
    80006430:	00053783          	ld	a5,0(a0)
    80006434:	0087b783          	ld	a5,8(a5)
    80006438:	000780e7          	jalr	a5
    delete mutexTail;
    8000643c:	0304b503          	ld	a0,48(s1)
    80006440:	00050863          	beqz	a0,80006450 <_ZN9BufferCPPD1Ev+0xd8>
    80006444:	00053783          	ld	a5,0(a0)
    80006448:	0087b783          	ld	a5,8(a5)
    8000644c:	000780e7          	jalr	a5
    delete mutexHead;
    80006450:	0284b503          	ld	a0,40(s1)
    80006454:	00050863          	beqz	a0,80006464 <_ZN9BufferCPPD1Ev+0xec>
    80006458:	00053783          	ld	a5,0(a0)
    8000645c:	0087b783          	ld	a5,8(a5)
    80006460:	000780e7          	jalr	a5
}
    80006464:	01813083          	ld	ra,24(sp)
    80006468:	01013403          	ld	s0,16(sp)
    8000646c:	00813483          	ld	s1,8(sp)
    80006470:	02010113          	addi	sp,sp,32
    80006474:	00008067          	ret

0000000080006478 <_Z8userMainv>:
#include "ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006478:	fe010113          	addi	sp,sp,-32
    8000647c:	00113c23          	sd	ra,24(sp)
    80006480:	00813823          	sd	s0,16(sp)
    80006484:	00913423          	sd	s1,8(sp)
    80006488:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    8000648c:	00004517          	auipc	a0,0x4
    80006490:	f2450513          	addi	a0,a0,-220 # 8000a3b0 <CONSOLE_STATUS+0x3a0>
    80006494:	00000097          	auipc	ra,0x0
    80006498:	910080e7          	jalr	-1776(ra) # 80005da4 <_Z11printStringPKc>
    int test = getc() - '0';
    8000649c:	ffffb097          	auipc	ra,0xffffb
    800064a0:	1c8080e7          	jalr	456(ra) # 80001664 <_Z4getcv>
    800064a4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800064a8:	ffffb097          	auipc	ra,0xffffb
    800064ac:	1bc080e7          	jalr	444(ra) # 80001664 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800064b0:	00700793          	li	a5,7
    800064b4:	1097e263          	bltu	a5,s1,800065b8 <_Z8userMainv+0x140>
    800064b8:	00249493          	slli	s1,s1,0x2
    800064bc:	00004717          	auipc	a4,0x4
    800064c0:	14c70713          	addi	a4,a4,332 # 8000a608 <CONSOLE_STATUS+0x5f8>
    800064c4:	00e484b3          	add	s1,s1,a4
    800064c8:	0004a783          	lw	a5,0(s1)
    800064cc:	00e787b3          	add	a5,a5,a4
    800064d0:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800064d4:	fffff097          	auipc	ra,0xfffff
    800064d8:	f48080e7          	jalr	-184(ra) # 8000541c <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800064dc:	00004517          	auipc	a0,0x4
    800064e0:	ef450513          	addi	a0,a0,-268 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    800064e4:	00000097          	auipc	ra,0x0
    800064e8:	8c0080e7          	jalr	-1856(ra) # 80005da4 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800064ec:	01813083          	ld	ra,24(sp)
    800064f0:	01013403          	ld	s0,16(sp)
    800064f4:	00813483          	ld	s1,8(sp)
    800064f8:	02010113          	addi	sp,sp,32
    800064fc:	00008067          	ret
            Threads_CPP_API_test();
    80006500:	ffffe097          	auipc	ra,0xffffe
    80006504:	dfc080e7          	jalr	-516(ra) # 800042fc <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006508:	00004517          	auipc	a0,0x4
    8000650c:	f0850513          	addi	a0,a0,-248 # 8000a410 <CONSOLE_STATUS+0x400>
    80006510:	00000097          	auipc	ra,0x0
    80006514:	894080e7          	jalr	-1900(ra) # 80005da4 <_Z11printStringPKc>
            break;
    80006518:	fd5ff06f          	j	800064ec <_Z8userMainv+0x74>
            producerConsumer_C_API();
    8000651c:	ffffd097          	auipc	ra,0xffffd
    80006520:	634080e7          	jalr	1588(ra) # 80003b50 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006524:	00004517          	auipc	a0,0x4
    80006528:	f2c50513          	addi	a0,a0,-212 # 8000a450 <CONSOLE_STATUS+0x440>
    8000652c:	00000097          	auipc	ra,0x0
    80006530:	878080e7          	jalr	-1928(ra) # 80005da4 <_Z11printStringPKc>
            break;
    80006534:	fb9ff06f          	j	800064ec <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006538:	fffff097          	auipc	ra,0xfffff
    8000653c:	228080e7          	jalr	552(ra) # 80005760 <_Z29producerConsumer_CPP_Sync_APIv>
           printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006540:	00004517          	auipc	a0,0x4
    80006544:	f6050513          	addi	a0,a0,-160 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80006548:	00000097          	auipc	ra,0x0
    8000654c:	85c080e7          	jalr	-1956(ra) # 80005da4 <_Z11printStringPKc>
            break;
    80006550:	f9dff06f          	j	800064ec <_Z8userMainv+0x74>
            testSleeping();
    80006554:	00000097          	auipc	ra,0x0
    80006558:	11c080e7          	jalr	284(ra) # 80006670 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    8000655c:	00004517          	auipc	a0,0x4
    80006560:	f9c50513          	addi	a0,a0,-100 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    80006564:	00000097          	auipc	ra,0x0
    80006568:	840080e7          	jalr	-1984(ra) # 80005da4 <_Z11printStringPKc>
            break;
    8000656c:	f81ff06f          	j	800064ec <_Z8userMainv+0x74>
            testConsumerProducer();
    80006570:	ffffe097          	auipc	ra,0xffffe
    80006574:	24c080e7          	jalr	588(ra) # 800047bc <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006578:	00004517          	auipc	a0,0x4
    8000657c:	fb050513          	addi	a0,a0,-80 # 8000a528 <CONSOLE_STATUS+0x518>
    80006580:	00000097          	auipc	ra,0x0
    80006584:	824080e7          	jalr	-2012(ra) # 80005da4 <_Z11printStringPKc>
            break;
    80006588:	f65ff06f          	j	800064ec <_Z8userMainv+0x74>
            System_Mode_test();
    8000658c:	00000097          	auipc	ra,0x0
    80006590:	658080e7          	jalr	1624(ra) # 80006be4 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006594:	00004517          	auipc	a0,0x4
    80006598:	fd450513          	addi	a0,a0,-44 # 8000a568 <CONSOLE_STATUS+0x558>
    8000659c:	00000097          	auipc	ra,0x0
    800065a0:	808080e7          	jalr	-2040(ra) # 80005da4 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800065a4:	00004517          	auipc	a0,0x4
    800065a8:	fe450513          	addi	a0,a0,-28 # 8000a588 <CONSOLE_STATUS+0x578>
    800065ac:	fffff097          	auipc	ra,0xfffff
    800065b0:	7f8080e7          	jalr	2040(ra) # 80005da4 <_Z11printStringPKc>
            break;
    800065b4:	f39ff06f          	j	800064ec <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800065b8:	00004517          	auipc	a0,0x4
    800065bc:	02850513          	addi	a0,a0,40 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    800065c0:	fffff097          	auipc	ra,0xfffff
    800065c4:	7e4080e7          	jalr	2020(ra) # 80005da4 <_Z11printStringPKc>
    800065c8:	f25ff06f          	j	800064ec <_Z8userMainv+0x74>

00000000800065cc <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800065cc:	fe010113          	addi	sp,sp,-32
    800065d0:	00113c23          	sd	ra,24(sp)
    800065d4:	00813823          	sd	s0,16(sp)
    800065d8:	00913423          	sd	s1,8(sp)
    800065dc:	01213023          	sd	s2,0(sp)
    800065e0:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800065e4:	00053903          	ld	s2,0(a0)
    int i = 6;
    800065e8:	00600493          	li	s1,6
    while (--i > 0) {
    800065ec:	fff4849b          	addiw	s1,s1,-1
    800065f0:	04905463          	blez	s1,80006638 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800065f4:	00004517          	auipc	a0,0x4
    800065f8:	03450513          	addi	a0,a0,52 # 8000a628 <CONSOLE_STATUS+0x618>
    800065fc:	fffff097          	auipc	ra,0xfffff
    80006600:	7a8080e7          	jalr	1960(ra) # 80005da4 <_Z11printStringPKc>
        printInt(sleep_time);
    80006604:	00000613          	li	a2,0
    80006608:	00a00593          	li	a1,10
    8000660c:	0009051b          	sext.w	a0,s2
    80006610:	00000097          	auipc	ra,0x0
    80006614:	950080e7          	jalr	-1712(ra) # 80005f60 <_Z8printIntiii>
        printString(" !\n");
    80006618:	00004517          	auipc	a0,0x4
    8000661c:	01850513          	addi	a0,a0,24 # 8000a630 <CONSOLE_STATUS+0x620>
    80006620:	fffff097          	auipc	ra,0xfffff
    80006624:	784080e7          	jalr	1924(ra) # 80005da4 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006628:	00090513          	mv	a0,s2
    8000662c:	ffffb097          	auipc	ra,0xffffb
    80006630:	000080e7          	jalr	ra # 8000162c <_Z10time_sleepm>
    while (--i > 0) {
    80006634:	fb9ff06f          	j	800065ec <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006638:	00a00793          	li	a5,10
    8000663c:	02f95933          	divu	s2,s2,a5
    80006640:	fff90913          	addi	s2,s2,-1
    80006644:	00006797          	auipc	a5,0x6
    80006648:	64478793          	addi	a5,a5,1604 # 8000cc88 <_ZL8finished>
    8000664c:	01278933          	add	s2,a5,s2
    80006650:	00100793          	li	a5,1
    80006654:	00f90023          	sb	a5,0(s2)
}
    80006658:	01813083          	ld	ra,24(sp)
    8000665c:	01013403          	ld	s0,16(sp)
    80006660:	00813483          	ld	s1,8(sp)
    80006664:	00013903          	ld	s2,0(sp)
    80006668:	02010113          	addi	sp,sp,32
    8000666c:	00008067          	ret

0000000080006670 <_Z12testSleepingv>:

void testSleeping() {
    80006670:	fc010113          	addi	sp,sp,-64
    80006674:	02113c23          	sd	ra,56(sp)
    80006678:	02813823          	sd	s0,48(sp)
    8000667c:	02913423          	sd	s1,40(sp)
    80006680:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006684:	00a00793          	li	a5,10
    80006688:	fcf43823          	sd	a5,-48(s0)
    8000668c:	01400793          	li	a5,20
    80006690:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006694:	00000493          	li	s1,0
    80006698:	02c0006f          	j	800066c4 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    8000669c:	00349793          	slli	a5,s1,0x3
    800066a0:	fd040613          	addi	a2,s0,-48
    800066a4:	00f60633          	add	a2,a2,a5
    800066a8:	00000597          	auipc	a1,0x0
    800066ac:	f2458593          	addi	a1,a1,-220 # 800065cc <_ZL9sleepyRunPv>
    800066b0:	fc040513          	addi	a0,s0,-64
    800066b4:	00f50533          	add	a0,a0,a5
    800066b8:	ffffb097          	auipc	ra,0xffffb
    800066bc:	c48080e7          	jalr	-952(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800066c0:	0014849b          	addiw	s1,s1,1
    800066c4:	00100793          	li	a5,1
    800066c8:	fc97dae3          	bge	a5,s1,8000669c <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800066cc:	00006797          	auipc	a5,0x6
    800066d0:	5bc7c783          	lbu	a5,1468(a5) # 8000cc88 <_ZL8finished>
    800066d4:	fe078ce3          	beqz	a5,800066cc <_Z12testSleepingv+0x5c>
    800066d8:	00006797          	auipc	a5,0x6
    800066dc:	5b17c783          	lbu	a5,1457(a5) # 8000cc89 <_ZL8finished+0x1>
    800066e0:	fe0786e3          	beqz	a5,800066cc <_Z12testSleepingv+0x5c>
}
    800066e4:	03813083          	ld	ra,56(sp)
    800066e8:	03013403          	ld	s0,48(sp)
    800066ec:	02813483          	ld	s1,40(sp)
    800066f0:	04010113          	addi	sp,sp,64
    800066f4:	00008067          	ret

00000000800066f8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800066f8:	fe010113          	addi	sp,sp,-32
    800066fc:	00113c23          	sd	ra,24(sp)
    80006700:	00813823          	sd	s0,16(sp)
    80006704:	00913423          	sd	s1,8(sp)
    80006708:	01213023          	sd	s2,0(sp)
    8000670c:	02010413          	addi	s0,sp,32
    80006710:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006714:	00100793          	li	a5,1
    80006718:	02a7f863          	bgeu	a5,a0,80006748 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000671c:	00a00793          	li	a5,10
    80006720:	02f577b3          	remu	a5,a0,a5
    80006724:	02078e63          	beqz	a5,80006760 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006728:	fff48513          	addi	a0,s1,-1
    8000672c:	00000097          	auipc	ra,0x0
    80006730:	fcc080e7          	jalr	-52(ra) # 800066f8 <_ZL9fibonaccim>
    80006734:	00050913          	mv	s2,a0
    80006738:	ffe48513          	addi	a0,s1,-2
    8000673c:	00000097          	auipc	ra,0x0
    80006740:	fbc080e7          	jalr	-68(ra) # 800066f8 <_ZL9fibonaccim>
    80006744:	00a90533          	add	a0,s2,a0
}
    80006748:	01813083          	ld	ra,24(sp)
    8000674c:	01013403          	ld	s0,16(sp)
    80006750:	00813483          	ld	s1,8(sp)
    80006754:	00013903          	ld	s2,0(sp)
    80006758:	02010113          	addi	sp,sp,32
    8000675c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006760:	ffffb097          	auipc	ra,0xffffb
    80006764:	c70080e7          	jalr	-912(ra) # 800013d0 <_Z15thread_dispatchv>
    80006768:	fc1ff06f          	j	80006728 <_ZL9fibonaccim+0x30>

000000008000676c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000676c:	fe010113          	addi	sp,sp,-32
    80006770:	00113c23          	sd	ra,24(sp)
    80006774:	00813823          	sd	s0,16(sp)
    80006778:	00913423          	sd	s1,8(sp)
    8000677c:	01213023          	sd	s2,0(sp)
    80006780:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006784:	00a00493          	li	s1,10
    80006788:	0400006f          	j	800067c8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000678c:	00004517          	auipc	a0,0x4
    80006790:	b7450513          	addi	a0,a0,-1164 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80006794:	fffff097          	auipc	ra,0xfffff
    80006798:	610080e7          	jalr	1552(ra) # 80005da4 <_Z11printStringPKc>
    8000679c:	00000613          	li	a2,0
    800067a0:	00a00593          	li	a1,10
    800067a4:	00048513          	mv	a0,s1
    800067a8:	fffff097          	auipc	ra,0xfffff
    800067ac:	7b8080e7          	jalr	1976(ra) # 80005f60 <_Z8printIntiii>
    800067b0:	00004517          	auipc	a0,0x4
    800067b4:	bf850513          	addi	a0,a0,-1032 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800067b8:	fffff097          	auipc	ra,0xfffff
    800067bc:	5ec080e7          	jalr	1516(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800067c0:	0014849b          	addiw	s1,s1,1
    800067c4:	0ff4f493          	andi	s1,s1,255
    800067c8:	00c00793          	li	a5,12
    800067cc:	fc97f0e3          	bgeu	a5,s1,8000678c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800067d0:	00004517          	auipc	a0,0x4
    800067d4:	b3850513          	addi	a0,a0,-1224 # 8000a308 <CONSOLE_STATUS+0x2f8>
    800067d8:	fffff097          	auipc	ra,0xfffff
    800067dc:	5cc080e7          	jalr	1484(ra) # 80005da4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800067e0:	00500313          	li	t1,5
    thread_dispatch();
    800067e4:	ffffb097          	auipc	ra,0xffffb
    800067e8:	bec080e7          	jalr	-1044(ra) # 800013d0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800067ec:	01000513          	li	a0,16
    800067f0:	00000097          	auipc	ra,0x0
    800067f4:	f08080e7          	jalr	-248(ra) # 800066f8 <_ZL9fibonaccim>
    800067f8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800067fc:	00004517          	auipc	a0,0x4
    80006800:	b1c50513          	addi	a0,a0,-1252 # 8000a318 <CONSOLE_STATUS+0x308>
    80006804:	fffff097          	auipc	ra,0xfffff
    80006808:	5a0080e7          	jalr	1440(ra) # 80005da4 <_Z11printStringPKc>
    8000680c:	00000613          	li	a2,0
    80006810:	00a00593          	li	a1,10
    80006814:	0009051b          	sext.w	a0,s2
    80006818:	fffff097          	auipc	ra,0xfffff
    8000681c:	748080e7          	jalr	1864(ra) # 80005f60 <_Z8printIntiii>
    80006820:	00004517          	auipc	a0,0x4
    80006824:	b8850513          	addi	a0,a0,-1144 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006828:	fffff097          	auipc	ra,0xfffff
    8000682c:	57c080e7          	jalr	1404(ra) # 80005da4 <_Z11printStringPKc>
    80006830:	0400006f          	j	80006870 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006834:	00004517          	auipc	a0,0x4
    80006838:	acc50513          	addi	a0,a0,-1332 # 8000a300 <CONSOLE_STATUS+0x2f0>
    8000683c:	fffff097          	auipc	ra,0xfffff
    80006840:	568080e7          	jalr	1384(ra) # 80005da4 <_Z11printStringPKc>
    80006844:	00000613          	li	a2,0
    80006848:	00a00593          	li	a1,10
    8000684c:	00048513          	mv	a0,s1
    80006850:	fffff097          	auipc	ra,0xfffff
    80006854:	710080e7          	jalr	1808(ra) # 80005f60 <_Z8printIntiii>
    80006858:	00004517          	auipc	a0,0x4
    8000685c:	b5050513          	addi	a0,a0,-1200 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006860:	fffff097          	auipc	ra,0xfffff
    80006864:	544080e7          	jalr	1348(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006868:	0014849b          	addiw	s1,s1,1
    8000686c:	0ff4f493          	andi	s1,s1,255
    80006870:	00f00793          	li	a5,15
    80006874:	fc97f0e3          	bgeu	a5,s1,80006834 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006878:	00004517          	auipc	a0,0x4
    8000687c:	ab050513          	addi	a0,a0,-1360 # 8000a328 <CONSOLE_STATUS+0x318>
    80006880:	fffff097          	auipc	ra,0xfffff
    80006884:	524080e7          	jalr	1316(ra) # 80005da4 <_Z11printStringPKc>
    finishedD = true;
    80006888:	00100793          	li	a5,1
    8000688c:	00006717          	auipc	a4,0x6
    80006890:	3ef70f23          	sb	a5,1022(a4) # 8000cc8a <_ZL9finishedD>
    thread_dispatch();
    80006894:	ffffb097          	auipc	ra,0xffffb
    80006898:	b3c080e7          	jalr	-1220(ra) # 800013d0 <_Z15thread_dispatchv>
}
    8000689c:	01813083          	ld	ra,24(sp)
    800068a0:	01013403          	ld	s0,16(sp)
    800068a4:	00813483          	ld	s1,8(sp)
    800068a8:	00013903          	ld	s2,0(sp)
    800068ac:	02010113          	addi	sp,sp,32
    800068b0:	00008067          	ret

00000000800068b4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800068b4:	fe010113          	addi	sp,sp,-32
    800068b8:	00113c23          	sd	ra,24(sp)
    800068bc:	00813823          	sd	s0,16(sp)
    800068c0:	00913423          	sd	s1,8(sp)
    800068c4:	01213023          	sd	s2,0(sp)
    800068c8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800068cc:	00000493          	li	s1,0
    800068d0:	0400006f          	j	80006910 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800068d4:	00004517          	auipc	a0,0x4
    800068d8:	9fc50513          	addi	a0,a0,-1540 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    800068dc:	fffff097          	auipc	ra,0xfffff
    800068e0:	4c8080e7          	jalr	1224(ra) # 80005da4 <_Z11printStringPKc>
    800068e4:	00000613          	li	a2,0
    800068e8:	00a00593          	li	a1,10
    800068ec:	00048513          	mv	a0,s1
    800068f0:	fffff097          	auipc	ra,0xfffff
    800068f4:	670080e7          	jalr	1648(ra) # 80005f60 <_Z8printIntiii>
    800068f8:	00004517          	auipc	a0,0x4
    800068fc:	ab050513          	addi	a0,a0,-1360 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006900:	fffff097          	auipc	ra,0xfffff
    80006904:	4a4080e7          	jalr	1188(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006908:	0014849b          	addiw	s1,s1,1
    8000690c:	0ff4f493          	andi	s1,s1,255
    80006910:	00200793          	li	a5,2
    80006914:	fc97f0e3          	bgeu	a5,s1,800068d4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006918:	00004517          	auipc	a0,0x4
    8000691c:	9c050513          	addi	a0,a0,-1600 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    80006920:	fffff097          	auipc	ra,0xfffff
    80006924:	484080e7          	jalr	1156(ra) # 80005da4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006928:	00700313          	li	t1,7
    thread_dispatch();
    8000692c:	ffffb097          	auipc	ra,0xffffb
    80006930:	aa4080e7          	jalr	-1372(ra) # 800013d0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006934:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006938:	00004517          	auipc	a0,0x4
    8000693c:	9b050513          	addi	a0,a0,-1616 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80006940:	fffff097          	auipc	ra,0xfffff
    80006944:	464080e7          	jalr	1124(ra) # 80005da4 <_Z11printStringPKc>
    80006948:	00000613          	li	a2,0
    8000694c:	00a00593          	li	a1,10
    80006950:	0009051b          	sext.w	a0,s2
    80006954:	fffff097          	auipc	ra,0xfffff
    80006958:	60c080e7          	jalr	1548(ra) # 80005f60 <_Z8printIntiii>
    8000695c:	00004517          	auipc	a0,0x4
    80006960:	a4c50513          	addi	a0,a0,-1460 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006964:	fffff097          	auipc	ra,0xfffff
    80006968:	440080e7          	jalr	1088(ra) # 80005da4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000696c:	00c00513          	li	a0,12
    80006970:	00000097          	auipc	ra,0x0
    80006974:	d88080e7          	jalr	-632(ra) # 800066f8 <_ZL9fibonaccim>
    80006978:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000697c:	00004517          	auipc	a0,0x4
    80006980:	97450513          	addi	a0,a0,-1676 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80006984:	fffff097          	auipc	ra,0xfffff
    80006988:	420080e7          	jalr	1056(ra) # 80005da4 <_Z11printStringPKc>
    8000698c:	00000613          	li	a2,0
    80006990:	00a00593          	li	a1,10
    80006994:	0009051b          	sext.w	a0,s2
    80006998:	fffff097          	auipc	ra,0xfffff
    8000699c:	5c8080e7          	jalr	1480(ra) # 80005f60 <_Z8printIntiii>
    800069a0:	00004517          	auipc	a0,0x4
    800069a4:	a0850513          	addi	a0,a0,-1528 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800069a8:	fffff097          	auipc	ra,0xfffff
    800069ac:	3fc080e7          	jalr	1020(ra) # 80005da4 <_Z11printStringPKc>
    800069b0:	0400006f          	j	800069f0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800069b4:	00004517          	auipc	a0,0x4
    800069b8:	91c50513          	addi	a0,a0,-1764 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    800069bc:	fffff097          	auipc	ra,0xfffff
    800069c0:	3e8080e7          	jalr	1000(ra) # 80005da4 <_Z11printStringPKc>
    800069c4:	00000613          	li	a2,0
    800069c8:	00a00593          	li	a1,10
    800069cc:	00048513          	mv	a0,s1
    800069d0:	fffff097          	auipc	ra,0xfffff
    800069d4:	590080e7          	jalr	1424(ra) # 80005f60 <_Z8printIntiii>
    800069d8:	00004517          	auipc	a0,0x4
    800069dc:	9d050513          	addi	a0,a0,-1584 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800069e0:	fffff097          	auipc	ra,0xfffff
    800069e4:	3c4080e7          	jalr	964(ra) # 80005da4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800069e8:	0014849b          	addiw	s1,s1,1
    800069ec:	0ff4f493          	andi	s1,s1,255
    800069f0:	00500793          	li	a5,5
    800069f4:	fc97f0e3          	bgeu	a5,s1,800069b4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800069f8:	00004517          	auipc	a0,0x4
    800069fc:	8b050513          	addi	a0,a0,-1872 # 8000a2a8 <CONSOLE_STATUS+0x298>
    80006a00:	fffff097          	auipc	ra,0xfffff
    80006a04:	3a4080e7          	jalr	932(ra) # 80005da4 <_Z11printStringPKc>
    finishedC = true;
    80006a08:	00100793          	li	a5,1
    80006a0c:	00006717          	auipc	a4,0x6
    80006a10:	26f70fa3          	sb	a5,639(a4) # 8000cc8b <_ZL9finishedC>
    thread_dispatch();
    80006a14:	ffffb097          	auipc	ra,0xffffb
    80006a18:	9bc080e7          	jalr	-1604(ra) # 800013d0 <_Z15thread_dispatchv>
}
    80006a1c:	01813083          	ld	ra,24(sp)
    80006a20:	01013403          	ld	s0,16(sp)
    80006a24:	00813483          	ld	s1,8(sp)
    80006a28:	00013903          	ld	s2,0(sp)
    80006a2c:	02010113          	addi	sp,sp,32
    80006a30:	00008067          	ret

0000000080006a34 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006a34:	fe010113          	addi	sp,sp,-32
    80006a38:	00113c23          	sd	ra,24(sp)
    80006a3c:	00813823          	sd	s0,16(sp)
    80006a40:	00913423          	sd	s1,8(sp)
    80006a44:	01213023          	sd	s2,0(sp)
    80006a48:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006a4c:	00000913          	li	s2,0
    80006a50:	0400006f          	j	80006a90 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006a54:	ffffb097          	auipc	ra,0xffffb
    80006a58:	97c080e7          	jalr	-1668(ra) # 800013d0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006a5c:	00148493          	addi	s1,s1,1
    80006a60:	000027b7          	lui	a5,0x2
    80006a64:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a68:	0097ee63          	bltu	a5,s1,80006a84 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a6c:	00000713          	li	a4,0
    80006a70:	000077b7          	lui	a5,0x7
    80006a74:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a78:	fce7eee3          	bltu	a5,a4,80006a54 <_ZL11workerBodyBPv+0x20>
    80006a7c:	00170713          	addi	a4,a4,1
    80006a80:	ff1ff06f          	j	80006a70 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006a84:	00a00793          	li	a5,10
    80006a88:	04f90663          	beq	s2,a5,80006ad4 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006a8c:	00190913          	addi	s2,s2,1
    80006a90:	00f00793          	li	a5,15
    80006a94:	0527e463          	bltu	a5,s2,80006adc <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006a98:	00004517          	auipc	a0,0x4
    80006a9c:	82050513          	addi	a0,a0,-2016 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    80006aa0:	fffff097          	auipc	ra,0xfffff
    80006aa4:	304080e7          	jalr	772(ra) # 80005da4 <_Z11printStringPKc>
    80006aa8:	00000613          	li	a2,0
    80006aac:	00a00593          	li	a1,10
    80006ab0:	0009051b          	sext.w	a0,s2
    80006ab4:	fffff097          	auipc	ra,0xfffff
    80006ab8:	4ac080e7          	jalr	1196(ra) # 80005f60 <_Z8printIntiii>
    80006abc:	00004517          	auipc	a0,0x4
    80006ac0:	8ec50513          	addi	a0,a0,-1812 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006ac4:	fffff097          	auipc	ra,0xfffff
    80006ac8:	2e0080e7          	jalr	736(ra) # 80005da4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006acc:	00000493          	li	s1,0
    80006ad0:	f91ff06f          	j	80006a60 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006ad4:	14102ff3          	csrr	t6,sepc
    80006ad8:	fb5ff06f          	j	80006a8c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006adc:	00003517          	auipc	a0,0x3
    80006ae0:	7e450513          	addi	a0,a0,2020 # 8000a2c0 <CONSOLE_STATUS+0x2b0>
    80006ae4:	fffff097          	auipc	ra,0xfffff
    80006ae8:	2c0080e7          	jalr	704(ra) # 80005da4 <_Z11printStringPKc>
    finishedB = true;
    80006aec:	00100793          	li	a5,1
    80006af0:	00006717          	auipc	a4,0x6
    80006af4:	18f70e23          	sb	a5,412(a4) # 8000cc8c <_ZL9finishedB>
    thread_dispatch();
    80006af8:	ffffb097          	auipc	ra,0xffffb
    80006afc:	8d8080e7          	jalr	-1832(ra) # 800013d0 <_Z15thread_dispatchv>
}
    80006b00:	01813083          	ld	ra,24(sp)
    80006b04:	01013403          	ld	s0,16(sp)
    80006b08:	00813483          	ld	s1,8(sp)
    80006b0c:	00013903          	ld	s2,0(sp)
    80006b10:	02010113          	addi	sp,sp,32
    80006b14:	00008067          	ret

0000000080006b18 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006b18:	fe010113          	addi	sp,sp,-32
    80006b1c:	00113c23          	sd	ra,24(sp)
    80006b20:	00813823          	sd	s0,16(sp)
    80006b24:	00913423          	sd	s1,8(sp)
    80006b28:	01213023          	sd	s2,0(sp)
    80006b2c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006b30:	00000913          	li	s2,0
    80006b34:	0380006f          	j	80006b6c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006b38:	ffffb097          	auipc	ra,0xffffb
    80006b3c:	898080e7          	jalr	-1896(ra) # 800013d0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006b40:	00148493          	addi	s1,s1,1
    80006b44:	000027b7          	lui	a5,0x2
    80006b48:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006b4c:	0097ee63          	bltu	a5,s1,80006b68 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b50:	00000713          	li	a4,0
    80006b54:	000077b7          	lui	a5,0x7
    80006b58:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006b5c:	fce7eee3          	bltu	a5,a4,80006b38 <_ZL11workerBodyAPv+0x20>
    80006b60:	00170713          	addi	a4,a4,1
    80006b64:	ff1ff06f          	j	80006b54 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006b68:	00190913          	addi	s2,s2,1
    80006b6c:	00900793          	li	a5,9
    80006b70:	0527e063          	bltu	a5,s2,80006bb0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006b74:	00003517          	auipc	a0,0x3
    80006b78:	72c50513          	addi	a0,a0,1836 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80006b7c:	fffff097          	auipc	ra,0xfffff
    80006b80:	228080e7          	jalr	552(ra) # 80005da4 <_Z11printStringPKc>
    80006b84:	00000613          	li	a2,0
    80006b88:	00a00593          	li	a1,10
    80006b8c:	0009051b          	sext.w	a0,s2
    80006b90:	fffff097          	auipc	ra,0xfffff
    80006b94:	3d0080e7          	jalr	976(ra) # 80005f60 <_Z8printIntiii>
    80006b98:	00004517          	auipc	a0,0x4
    80006b9c:	81050513          	addi	a0,a0,-2032 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006ba0:	fffff097          	auipc	ra,0xfffff
    80006ba4:	204080e7          	jalr	516(ra) # 80005da4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006ba8:	00000493          	li	s1,0
    80006bac:	f99ff06f          	j	80006b44 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006bb0:	00003517          	auipc	a0,0x3
    80006bb4:	6f850513          	addi	a0,a0,1784 # 8000a2a8 <CONSOLE_STATUS+0x298>
    80006bb8:	fffff097          	auipc	ra,0xfffff
    80006bbc:	1ec080e7          	jalr	492(ra) # 80005da4 <_Z11printStringPKc>
    finishedA = true;
    80006bc0:	00100793          	li	a5,1
    80006bc4:	00006717          	auipc	a4,0x6
    80006bc8:	0cf704a3          	sb	a5,201(a4) # 8000cc8d <_ZL9finishedA>
}
    80006bcc:	01813083          	ld	ra,24(sp)
    80006bd0:	01013403          	ld	s0,16(sp)
    80006bd4:	00813483          	ld	s1,8(sp)
    80006bd8:	00013903          	ld	s2,0(sp)
    80006bdc:	02010113          	addi	sp,sp,32
    80006be0:	00008067          	ret

0000000080006be4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006be4:	fd010113          	addi	sp,sp,-48
    80006be8:	02113423          	sd	ra,40(sp)
    80006bec:	02813023          	sd	s0,32(sp)
    80006bf0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006bf4:	00000613          	li	a2,0
    80006bf8:	00000597          	auipc	a1,0x0
    80006bfc:	f2058593          	addi	a1,a1,-224 # 80006b18 <_ZL11workerBodyAPv>
    80006c00:	fd040513          	addi	a0,s0,-48
    80006c04:	ffffa097          	auipc	ra,0xffffa
    80006c08:	6fc080e7          	jalr	1788(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006c0c:	00003517          	auipc	a0,0x3
    80006c10:	72c50513          	addi	a0,a0,1836 # 8000a338 <CONSOLE_STATUS+0x328>
    80006c14:	fffff097          	auipc	ra,0xfffff
    80006c18:	190080e7          	jalr	400(ra) # 80005da4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006c1c:	00000613          	li	a2,0
    80006c20:	00000597          	auipc	a1,0x0
    80006c24:	e1458593          	addi	a1,a1,-492 # 80006a34 <_ZL11workerBodyBPv>
    80006c28:	fd840513          	addi	a0,s0,-40
    80006c2c:	ffffa097          	auipc	ra,0xffffa
    80006c30:	6d4080e7          	jalr	1748(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006c34:	00003517          	auipc	a0,0x3
    80006c38:	71c50513          	addi	a0,a0,1820 # 8000a350 <CONSOLE_STATUS+0x340>
    80006c3c:	fffff097          	auipc	ra,0xfffff
    80006c40:	168080e7          	jalr	360(ra) # 80005da4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006c44:	00000613          	li	a2,0
    80006c48:	00000597          	auipc	a1,0x0
    80006c4c:	c6c58593          	addi	a1,a1,-916 # 800068b4 <_ZL11workerBodyCPv>
    80006c50:	fe040513          	addi	a0,s0,-32
    80006c54:	ffffa097          	auipc	ra,0xffffa
    80006c58:	6ac080e7          	jalr	1708(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006c5c:	00003517          	auipc	a0,0x3
    80006c60:	70c50513          	addi	a0,a0,1804 # 8000a368 <CONSOLE_STATUS+0x358>
    80006c64:	fffff097          	auipc	ra,0xfffff
    80006c68:	140080e7          	jalr	320(ra) # 80005da4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c6c:	00000613          	li	a2,0
    80006c70:	00000597          	auipc	a1,0x0
    80006c74:	afc58593          	addi	a1,a1,-1284 # 8000676c <_ZL11workerBodyDPv>
    80006c78:	fe840513          	addi	a0,s0,-24
    80006c7c:	ffffa097          	auipc	ra,0xffffa
    80006c80:	684080e7          	jalr	1668(ra) # 80001300 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006c84:	00003517          	auipc	a0,0x3
    80006c88:	6fc50513          	addi	a0,a0,1788 # 8000a380 <CONSOLE_STATUS+0x370>
    80006c8c:	fffff097          	auipc	ra,0xfffff
    80006c90:	118080e7          	jalr	280(ra) # 80005da4 <_Z11printStringPKc>
    80006c94:	00c0006f          	j	80006ca0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c98:	ffffa097          	auipc	ra,0xffffa
    80006c9c:	738080e7          	jalr	1848(ra) # 800013d0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006ca0:	00006797          	auipc	a5,0x6
    80006ca4:	fed7c783          	lbu	a5,-19(a5) # 8000cc8d <_ZL9finishedA>
    80006ca8:	fe0788e3          	beqz	a5,80006c98 <_Z16System_Mode_testv+0xb4>
    80006cac:	00006797          	auipc	a5,0x6
    80006cb0:	fe07c783          	lbu	a5,-32(a5) # 8000cc8c <_ZL9finishedB>
    80006cb4:	fe0782e3          	beqz	a5,80006c98 <_Z16System_Mode_testv+0xb4>
    80006cb8:	00006797          	auipc	a5,0x6
    80006cbc:	fd37c783          	lbu	a5,-45(a5) # 8000cc8b <_ZL9finishedC>
    80006cc0:	fc078ce3          	beqz	a5,80006c98 <_Z16System_Mode_testv+0xb4>
    80006cc4:	00006797          	auipc	a5,0x6
    80006cc8:	fc67c783          	lbu	a5,-58(a5) # 8000cc8a <_ZL9finishedD>
    80006ccc:	fc0786e3          	beqz	a5,80006c98 <_Z16System_Mode_testv+0xb4>
    }

}
    80006cd0:	02813083          	ld	ra,40(sp)
    80006cd4:	02013403          	ld	s0,32(sp)
    80006cd8:	03010113          	addi	sp,sp,48
    80006cdc:	00008067          	ret

0000000080006ce0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006ce0:	fe010113          	addi	sp,sp,-32
    80006ce4:	00113c23          	sd	ra,24(sp)
    80006ce8:	00813823          	sd	s0,16(sp)
    80006cec:	00913423          	sd	s1,8(sp)
    80006cf0:	01213023          	sd	s2,0(sp)
    80006cf4:	02010413          	addi	s0,sp,32
    80006cf8:	00050493          	mv	s1,a0
    80006cfc:	00058913          	mv	s2,a1
    80006d00:	0015879b          	addiw	a5,a1,1
    80006d04:	0007851b          	sext.w	a0,a5
    80006d08:	00f4a023          	sw	a5,0(s1)
    80006d0c:	0004a823          	sw	zero,16(s1)
    80006d10:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006d14:	00251513          	slli	a0,a0,0x2
    80006d18:	ffffa097          	auipc	ra,0xffffa
    80006d1c:	574080e7          	jalr	1396(ra) # 8000128c <_Z9mem_allocm>
    80006d20:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006d24:	00000593          	li	a1,0
    80006d28:	02048513          	addi	a0,s1,32
    80006d2c:	ffffb097          	auipc	ra,0xffffb
    80006d30:	800080e7          	jalr	-2048(ra) # 8000152c <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80006d34:	00090593          	mv	a1,s2
    80006d38:	01848513          	addi	a0,s1,24
    80006d3c:	ffffa097          	auipc	ra,0xffffa
    80006d40:	7f0080e7          	jalr	2032(ra) # 8000152c <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80006d44:	00100593          	li	a1,1
    80006d48:	02848513          	addi	a0,s1,40
    80006d4c:	ffffa097          	auipc	ra,0xffffa
    80006d50:	7e0080e7          	jalr	2016(ra) # 8000152c <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80006d54:	00100593          	li	a1,1
    80006d58:	03048513          	addi	a0,s1,48
    80006d5c:	ffffa097          	auipc	ra,0xffffa
    80006d60:	7d0080e7          	jalr	2000(ra) # 8000152c <_Z8sem_openPP4_semj>
}
    80006d64:	01813083          	ld	ra,24(sp)
    80006d68:	01013403          	ld	s0,16(sp)
    80006d6c:	00813483          	ld	s1,8(sp)
    80006d70:	00013903          	ld	s2,0(sp)
    80006d74:	02010113          	addi	sp,sp,32
    80006d78:	00008067          	ret

0000000080006d7c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006d7c:	fe010113          	addi	sp,sp,-32
    80006d80:	00113c23          	sd	ra,24(sp)
    80006d84:	00813823          	sd	s0,16(sp)
    80006d88:	00913423          	sd	s1,8(sp)
    80006d8c:	01213023          	sd	s2,0(sp)
    80006d90:	02010413          	addi	s0,sp,32
    80006d94:	00050493          	mv	s1,a0
    80006d98:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006d9c:	01853503          	ld	a0,24(a0)
    80006da0:	ffffb097          	auipc	ra,0xffffb
    80006da4:	814080e7          	jalr	-2028(ra) # 800015b4 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80006da8:	0304b503          	ld	a0,48(s1)
    80006dac:	ffffb097          	auipc	ra,0xffffb
    80006db0:	808080e7          	jalr	-2040(ra) # 800015b4 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80006db4:	0084b783          	ld	a5,8(s1)
    80006db8:	0144a703          	lw	a4,20(s1)
    80006dbc:	00271713          	slli	a4,a4,0x2
    80006dc0:	00e787b3          	add	a5,a5,a4
    80006dc4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006dc8:	0144a783          	lw	a5,20(s1)
    80006dcc:	0017879b          	addiw	a5,a5,1
    80006dd0:	0004a703          	lw	a4,0(s1)
    80006dd4:	02e7e7bb          	remw	a5,a5,a4
    80006dd8:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006ddc:	0304b503          	ld	a0,48(s1)
    80006de0:	ffffb097          	auipc	ra,0xffffb
    80006de4:	810080e7          	jalr	-2032(ra) # 800015f0 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80006de8:	0204b503          	ld	a0,32(s1)
    80006dec:	ffffb097          	auipc	ra,0xffffb
    80006df0:	804080e7          	jalr	-2044(ra) # 800015f0 <_Z10sem_signalP4_sem>

}
    80006df4:	01813083          	ld	ra,24(sp)
    80006df8:	01013403          	ld	s0,16(sp)
    80006dfc:	00813483          	ld	s1,8(sp)
    80006e00:	00013903          	ld	s2,0(sp)
    80006e04:	02010113          	addi	sp,sp,32
    80006e08:	00008067          	ret

0000000080006e0c <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006e0c:	fe010113          	addi	sp,sp,-32
    80006e10:	00113c23          	sd	ra,24(sp)
    80006e14:	00813823          	sd	s0,16(sp)
    80006e18:	00913423          	sd	s1,8(sp)
    80006e1c:	01213023          	sd	s2,0(sp)
    80006e20:	02010413          	addi	s0,sp,32
    80006e24:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006e28:	02053503          	ld	a0,32(a0)
    80006e2c:	ffffa097          	auipc	ra,0xffffa
    80006e30:	788080e7          	jalr	1928(ra) # 800015b4 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80006e34:	0284b503          	ld	a0,40(s1)
    80006e38:	ffffa097          	auipc	ra,0xffffa
    80006e3c:	77c080e7          	jalr	1916(ra) # 800015b4 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80006e40:	0084b703          	ld	a4,8(s1)
    80006e44:	0104a783          	lw	a5,16(s1)
    80006e48:	00279693          	slli	a3,a5,0x2
    80006e4c:	00d70733          	add	a4,a4,a3
    80006e50:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006e54:	0017879b          	addiw	a5,a5,1
    80006e58:	0004a703          	lw	a4,0(s1)
    80006e5c:	02e7e7bb          	remw	a5,a5,a4
    80006e60:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006e64:	0284b503          	ld	a0,40(s1)
    80006e68:	ffffa097          	auipc	ra,0xffffa
    80006e6c:	788080e7          	jalr	1928(ra) # 800015f0 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80006e70:	0184b503          	ld	a0,24(s1)
    80006e74:	ffffa097          	auipc	ra,0xffffa
    80006e78:	77c080e7          	jalr	1916(ra) # 800015f0 <_Z10sem_signalP4_sem>

    return ret;
}
    80006e7c:	00090513          	mv	a0,s2
    80006e80:	01813083          	ld	ra,24(sp)
    80006e84:	01013403          	ld	s0,16(sp)
    80006e88:	00813483          	ld	s1,8(sp)
    80006e8c:	00013903          	ld	s2,0(sp)
    80006e90:	02010113          	addi	sp,sp,32
    80006e94:	00008067          	ret

0000000080006e98 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006e98:	fe010113          	addi	sp,sp,-32
    80006e9c:	00113c23          	sd	ra,24(sp)
    80006ea0:	00813823          	sd	s0,16(sp)
    80006ea4:	00913423          	sd	s1,8(sp)
    80006ea8:	01213023          	sd	s2,0(sp)
    80006eac:	02010413          	addi	s0,sp,32
    80006eb0:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006eb4:	02853503          	ld	a0,40(a0)
    80006eb8:	ffffa097          	auipc	ra,0xffffa
    80006ebc:	6fc080e7          	jalr	1788(ra) # 800015b4 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80006ec0:	0304b503          	ld	a0,48(s1)
    80006ec4:	ffffa097          	auipc	ra,0xffffa
    80006ec8:	6f0080e7          	jalr	1776(ra) # 800015b4 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80006ecc:	0144a783          	lw	a5,20(s1)
    80006ed0:	0104a903          	lw	s2,16(s1)
    80006ed4:	0327ce63          	blt	a5,s2,80006f10 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006ed8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006edc:	0304b503          	ld	a0,48(s1)
    80006ee0:	ffffa097          	auipc	ra,0xffffa
    80006ee4:	710080e7          	jalr	1808(ra) # 800015f0 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80006ee8:	0284b503          	ld	a0,40(s1)
    80006eec:	ffffa097          	auipc	ra,0xffffa
    80006ef0:	704080e7          	jalr	1796(ra) # 800015f0 <_Z10sem_signalP4_sem>

    return ret;
}
    80006ef4:	00090513          	mv	a0,s2
    80006ef8:	01813083          	ld	ra,24(sp)
    80006efc:	01013403          	ld	s0,16(sp)
    80006f00:	00813483          	ld	s1,8(sp)
    80006f04:	00013903          	ld	s2,0(sp)
    80006f08:	02010113          	addi	sp,sp,32
    80006f0c:	00008067          	ret
        ret = cap - head + tail;
    80006f10:	0004a703          	lw	a4,0(s1)
    80006f14:	4127093b          	subw	s2,a4,s2
    80006f18:	00f9093b          	addw	s2,s2,a5
    80006f1c:	fc1ff06f          	j	80006edc <_ZN6Buffer6getCntEv+0x44>

0000000080006f20 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006f20:	fe010113          	addi	sp,sp,-32
    80006f24:	00113c23          	sd	ra,24(sp)
    80006f28:	00813823          	sd	s0,16(sp)
    80006f2c:	00913423          	sd	s1,8(sp)
    80006f30:	02010413          	addi	s0,sp,32
    80006f34:	00050493          	mv	s1,a0
    putc('\n');
    80006f38:	00a00513          	li	a0,10
    80006f3c:	ffffa097          	auipc	ra,0xffffa
    80006f40:	754080e7          	jalr	1876(ra) # 80001690 <_Z4putcc>
    printString("_Buffer deleted!\n");
    80006f44:	00003517          	auipc	a0,0x3
    80006f48:	45450513          	addi	a0,a0,1108 # 8000a398 <CONSOLE_STATUS+0x388>
    80006f4c:	fffff097          	auipc	ra,0xfffff
    80006f50:	e58080e7          	jalr	-424(ra) # 80005da4 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006f54:	00048513          	mv	a0,s1
    80006f58:	00000097          	auipc	ra,0x0
    80006f5c:	f40080e7          	jalr	-192(ra) # 80006e98 <_ZN6Buffer6getCntEv>
    80006f60:	02a05c63          	blez	a0,80006f98 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006f64:	0084b783          	ld	a5,8(s1)
    80006f68:	0104a703          	lw	a4,16(s1)
    80006f6c:	00271713          	slli	a4,a4,0x2
    80006f70:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006f74:	0007c503          	lbu	a0,0(a5)
    80006f78:	ffffa097          	auipc	ra,0xffffa
    80006f7c:	718080e7          	jalr	1816(ra) # 80001690 <_Z4putcc>
        head = (head + 1) % cap;
    80006f80:	0104a783          	lw	a5,16(s1)
    80006f84:	0017879b          	addiw	a5,a5,1
    80006f88:	0004a703          	lw	a4,0(s1)
    80006f8c:	02e7e7bb          	remw	a5,a5,a4
    80006f90:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006f94:	fc1ff06f          	j	80006f54 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006f98:	02100513          	li	a0,33
    80006f9c:	ffffa097          	auipc	ra,0xffffa
    80006fa0:	6f4080e7          	jalr	1780(ra) # 80001690 <_Z4putcc>
    putc('\n');
    80006fa4:	00a00513          	li	a0,10
    80006fa8:	ffffa097          	auipc	ra,0xffffa
    80006fac:	6e8080e7          	jalr	1768(ra) # 80001690 <_Z4putcc>
    mem_free(buffer);
    80006fb0:	0084b503          	ld	a0,8(s1)
    80006fb4:	ffffa097          	auipc	ra,0xffffa
    80006fb8:	31c080e7          	jalr	796(ra) # 800012d0 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006fbc:	0204b503          	ld	a0,32(s1)
    80006fc0:	ffffa097          	auipc	ra,0xffffa
    80006fc4:	5b8080e7          	jalr	1464(ra) # 80001578 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80006fc8:	0184b503          	ld	a0,24(s1)
    80006fcc:	ffffa097          	auipc	ra,0xffffa
    80006fd0:	5ac080e7          	jalr	1452(ra) # 80001578 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80006fd4:	0304b503          	ld	a0,48(s1)
    80006fd8:	ffffa097          	auipc	ra,0xffffa
    80006fdc:	5a0080e7          	jalr	1440(ra) # 80001578 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80006fe0:	0284b503          	ld	a0,40(s1)
    80006fe4:	ffffa097          	auipc	ra,0xffffa
    80006fe8:	594080e7          	jalr	1428(ra) # 80001578 <_Z9sem_closeP4_sem>
}
    80006fec:	01813083          	ld	ra,24(sp)
    80006ff0:	01013403          	ld	s0,16(sp)
    80006ff4:	00813483          	ld	s1,8(sp)
    80006ff8:	02010113          	addi	sp,sp,32
    80006ffc:	00008067          	ret

0000000080007000 <start>:
    80007000:	ff010113          	addi	sp,sp,-16
    80007004:	00813423          	sd	s0,8(sp)
    80007008:	01010413          	addi	s0,sp,16
    8000700c:	300027f3          	csrr	a5,mstatus
    80007010:	ffffe737          	lui	a4,0xffffe
    80007014:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff090f>
    80007018:	00e7f7b3          	and	a5,a5,a4
    8000701c:	00001737          	lui	a4,0x1
    80007020:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007024:	00e7e7b3          	or	a5,a5,a4
    80007028:	30079073          	csrw	mstatus,a5
    8000702c:	00000797          	auipc	a5,0x0
    80007030:	16078793          	addi	a5,a5,352 # 8000718c <system_main>
    80007034:	34179073          	csrw	mepc,a5
    80007038:	00000793          	li	a5,0
    8000703c:	18079073          	csrw	satp,a5
    80007040:	000107b7          	lui	a5,0x10
    80007044:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007048:	30279073          	csrw	medeleg,a5
    8000704c:	30379073          	csrw	mideleg,a5
    80007050:	104027f3          	csrr	a5,sie
    80007054:	2227e793          	ori	a5,a5,546
    80007058:	10479073          	csrw	sie,a5
    8000705c:	fff00793          	li	a5,-1
    80007060:	00a7d793          	srli	a5,a5,0xa
    80007064:	3b079073          	csrw	pmpaddr0,a5
    80007068:	00f00793          	li	a5,15
    8000706c:	3a079073          	csrw	pmpcfg0,a5
    80007070:	f14027f3          	csrr	a5,mhartid
    80007074:	0200c737          	lui	a4,0x200c
    80007078:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000707c:	0007869b          	sext.w	a3,a5
    80007080:	00269713          	slli	a4,a3,0x2
    80007084:	000f4637          	lui	a2,0xf4
    80007088:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000708c:	00d70733          	add	a4,a4,a3
    80007090:	0037979b          	slliw	a5,a5,0x3
    80007094:	020046b7          	lui	a3,0x2004
    80007098:	00d787b3          	add	a5,a5,a3
    8000709c:	00c585b3          	add	a1,a1,a2
    800070a0:	00371693          	slli	a3,a4,0x3
    800070a4:	00006717          	auipc	a4,0x6
    800070a8:	bec70713          	addi	a4,a4,-1044 # 8000cc90 <timer_scratch>
    800070ac:	00b7b023          	sd	a1,0(a5)
    800070b0:	00d70733          	add	a4,a4,a3
    800070b4:	00f73c23          	sd	a5,24(a4)
    800070b8:	02c73023          	sd	a2,32(a4)
    800070bc:	34071073          	csrw	mscratch,a4
    800070c0:	00000797          	auipc	a5,0x0
    800070c4:	6e078793          	addi	a5,a5,1760 # 800077a0 <timervec>
    800070c8:	30579073          	csrw	mtvec,a5
    800070cc:	300027f3          	csrr	a5,mstatus
    800070d0:	0087e793          	ori	a5,a5,8
    800070d4:	30079073          	csrw	mstatus,a5
    800070d8:	304027f3          	csrr	a5,mie
    800070dc:	0807e793          	ori	a5,a5,128
    800070e0:	30479073          	csrw	mie,a5
    800070e4:	f14027f3          	csrr	a5,mhartid
    800070e8:	0007879b          	sext.w	a5,a5
    800070ec:	00078213          	mv	tp,a5
    800070f0:	30200073          	mret
    800070f4:	00813403          	ld	s0,8(sp)
    800070f8:	01010113          	addi	sp,sp,16
    800070fc:	00008067          	ret

0000000080007100 <timerinit>:
    80007100:	ff010113          	addi	sp,sp,-16
    80007104:	00813423          	sd	s0,8(sp)
    80007108:	01010413          	addi	s0,sp,16
    8000710c:	f14027f3          	csrr	a5,mhartid
    80007110:	0200c737          	lui	a4,0x200c
    80007114:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007118:	0007869b          	sext.w	a3,a5
    8000711c:	00269713          	slli	a4,a3,0x2
    80007120:	000f4637          	lui	a2,0xf4
    80007124:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007128:	00d70733          	add	a4,a4,a3
    8000712c:	0037979b          	slliw	a5,a5,0x3
    80007130:	020046b7          	lui	a3,0x2004
    80007134:	00d787b3          	add	a5,a5,a3
    80007138:	00c585b3          	add	a1,a1,a2
    8000713c:	00371693          	slli	a3,a4,0x3
    80007140:	00006717          	auipc	a4,0x6
    80007144:	b5070713          	addi	a4,a4,-1200 # 8000cc90 <timer_scratch>
    80007148:	00b7b023          	sd	a1,0(a5)
    8000714c:	00d70733          	add	a4,a4,a3
    80007150:	00f73c23          	sd	a5,24(a4)
    80007154:	02c73023          	sd	a2,32(a4)
    80007158:	34071073          	csrw	mscratch,a4
    8000715c:	00000797          	auipc	a5,0x0
    80007160:	64478793          	addi	a5,a5,1604 # 800077a0 <timervec>
    80007164:	30579073          	csrw	mtvec,a5
    80007168:	300027f3          	csrr	a5,mstatus
    8000716c:	0087e793          	ori	a5,a5,8
    80007170:	30079073          	csrw	mstatus,a5
    80007174:	304027f3          	csrr	a5,mie
    80007178:	0807e793          	ori	a5,a5,128
    8000717c:	30479073          	csrw	mie,a5
    80007180:	00813403          	ld	s0,8(sp)
    80007184:	01010113          	addi	sp,sp,16
    80007188:	00008067          	ret

000000008000718c <system_main>:
    8000718c:	fe010113          	addi	sp,sp,-32
    80007190:	00813823          	sd	s0,16(sp)
    80007194:	00913423          	sd	s1,8(sp)
    80007198:	00113c23          	sd	ra,24(sp)
    8000719c:	02010413          	addi	s0,sp,32
    800071a0:	00000097          	auipc	ra,0x0
    800071a4:	0c4080e7          	jalr	196(ra) # 80007264 <cpuid>
    800071a8:	00006497          	auipc	s1,0x6
    800071ac:	9e848493          	addi	s1,s1,-1560 # 8000cb90 <started>
    800071b0:	02050263          	beqz	a0,800071d4 <system_main+0x48>
    800071b4:	0004a783          	lw	a5,0(s1)
    800071b8:	0007879b          	sext.w	a5,a5
    800071bc:	fe078ce3          	beqz	a5,800071b4 <system_main+0x28>
    800071c0:	0ff0000f          	fence
    800071c4:	00003517          	auipc	a0,0x3
    800071c8:	4a450513          	addi	a0,a0,1188 # 8000a668 <CONSOLE_STATUS+0x658>
    800071cc:	00001097          	auipc	ra,0x1
    800071d0:	a70080e7          	jalr	-1424(ra) # 80007c3c <panic>
    800071d4:	00001097          	auipc	ra,0x1
    800071d8:	9c4080e7          	jalr	-1596(ra) # 80007b98 <consoleinit>
    800071dc:	00001097          	auipc	ra,0x1
    800071e0:	150080e7          	jalr	336(ra) # 8000832c <printfinit>
    800071e4:	00003517          	auipc	a0,0x3
    800071e8:	1c450513          	addi	a0,a0,452 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800071ec:	00001097          	auipc	ra,0x1
    800071f0:	aac080e7          	jalr	-1364(ra) # 80007c98 <__printf>
    800071f4:	00003517          	auipc	a0,0x3
    800071f8:	44450513          	addi	a0,a0,1092 # 8000a638 <CONSOLE_STATUS+0x628>
    800071fc:	00001097          	auipc	ra,0x1
    80007200:	a9c080e7          	jalr	-1380(ra) # 80007c98 <__printf>
    80007204:	00003517          	auipc	a0,0x3
    80007208:	1a450513          	addi	a0,a0,420 # 8000a3a8 <CONSOLE_STATUS+0x398>
    8000720c:	00001097          	auipc	ra,0x1
    80007210:	a8c080e7          	jalr	-1396(ra) # 80007c98 <__printf>
    80007214:	00001097          	auipc	ra,0x1
    80007218:	4a4080e7          	jalr	1188(ra) # 800086b8 <kinit>
    8000721c:	00000097          	auipc	ra,0x0
    80007220:	148080e7          	jalr	328(ra) # 80007364 <trapinit>
    80007224:	00000097          	auipc	ra,0x0
    80007228:	16c080e7          	jalr	364(ra) # 80007390 <trapinithart>
    8000722c:	00000097          	auipc	ra,0x0
    80007230:	5b4080e7          	jalr	1460(ra) # 800077e0 <plicinit>
    80007234:	00000097          	auipc	ra,0x0
    80007238:	5d4080e7          	jalr	1492(ra) # 80007808 <plicinithart>
    8000723c:	00000097          	auipc	ra,0x0
    80007240:	078080e7          	jalr	120(ra) # 800072b4 <userinit>
    80007244:	0ff0000f          	fence
    80007248:	00100793          	li	a5,1
    8000724c:	00003517          	auipc	a0,0x3
    80007250:	40450513          	addi	a0,a0,1028 # 8000a650 <CONSOLE_STATUS+0x640>
    80007254:	00f4a023          	sw	a5,0(s1)
    80007258:	00001097          	auipc	ra,0x1
    8000725c:	a40080e7          	jalr	-1472(ra) # 80007c98 <__printf>
    80007260:	0000006f          	j	80007260 <system_main+0xd4>

0000000080007264 <cpuid>:
    80007264:	ff010113          	addi	sp,sp,-16
    80007268:	00813423          	sd	s0,8(sp)
    8000726c:	01010413          	addi	s0,sp,16
    80007270:	00020513          	mv	a0,tp
    80007274:	00813403          	ld	s0,8(sp)
    80007278:	0005051b          	sext.w	a0,a0
    8000727c:	01010113          	addi	sp,sp,16
    80007280:	00008067          	ret

0000000080007284 <mycpu>:
    80007284:	ff010113          	addi	sp,sp,-16
    80007288:	00813423          	sd	s0,8(sp)
    8000728c:	01010413          	addi	s0,sp,16
    80007290:	00020793          	mv	a5,tp
    80007294:	00813403          	ld	s0,8(sp)
    80007298:	0007879b          	sext.w	a5,a5
    8000729c:	00779793          	slli	a5,a5,0x7
    800072a0:	00007517          	auipc	a0,0x7
    800072a4:	a2050513          	addi	a0,a0,-1504 # 8000dcc0 <cpus>
    800072a8:	00f50533          	add	a0,a0,a5
    800072ac:	01010113          	addi	sp,sp,16
    800072b0:	00008067          	ret

00000000800072b4 <userinit>:
    800072b4:	ff010113          	addi	sp,sp,-16
    800072b8:	00813423          	sd	s0,8(sp)
    800072bc:	01010413          	addi	s0,sp,16
    800072c0:	00813403          	ld	s0,8(sp)
    800072c4:	01010113          	addi	sp,sp,16
    800072c8:	ffffb317          	auipc	t1,0xffffb
    800072cc:	c5c30067          	jr	-932(t1) # 80001f24 <main>

00000000800072d0 <either_copyout>:
    800072d0:	ff010113          	addi	sp,sp,-16
    800072d4:	00813023          	sd	s0,0(sp)
    800072d8:	00113423          	sd	ra,8(sp)
    800072dc:	01010413          	addi	s0,sp,16
    800072e0:	02051663          	bnez	a0,8000730c <either_copyout+0x3c>
    800072e4:	00058513          	mv	a0,a1
    800072e8:	00060593          	mv	a1,a2
    800072ec:	0006861b          	sext.w	a2,a3
    800072f0:	00002097          	auipc	ra,0x2
    800072f4:	c54080e7          	jalr	-940(ra) # 80008f44 <__memmove>
    800072f8:	00813083          	ld	ra,8(sp)
    800072fc:	00013403          	ld	s0,0(sp)
    80007300:	00000513          	li	a0,0
    80007304:	01010113          	addi	sp,sp,16
    80007308:	00008067          	ret
    8000730c:	00003517          	auipc	a0,0x3
    80007310:	38450513          	addi	a0,a0,900 # 8000a690 <CONSOLE_STATUS+0x680>
    80007314:	00001097          	auipc	ra,0x1
    80007318:	928080e7          	jalr	-1752(ra) # 80007c3c <panic>

000000008000731c <either_copyin>:
    8000731c:	ff010113          	addi	sp,sp,-16
    80007320:	00813023          	sd	s0,0(sp)
    80007324:	00113423          	sd	ra,8(sp)
    80007328:	01010413          	addi	s0,sp,16
    8000732c:	02059463          	bnez	a1,80007354 <either_copyin+0x38>
    80007330:	00060593          	mv	a1,a2
    80007334:	0006861b          	sext.w	a2,a3
    80007338:	00002097          	auipc	ra,0x2
    8000733c:	c0c080e7          	jalr	-1012(ra) # 80008f44 <__memmove>
    80007340:	00813083          	ld	ra,8(sp)
    80007344:	00013403          	ld	s0,0(sp)
    80007348:	00000513          	li	a0,0
    8000734c:	01010113          	addi	sp,sp,16
    80007350:	00008067          	ret
    80007354:	00003517          	auipc	a0,0x3
    80007358:	36450513          	addi	a0,a0,868 # 8000a6b8 <CONSOLE_STATUS+0x6a8>
    8000735c:	00001097          	auipc	ra,0x1
    80007360:	8e0080e7          	jalr	-1824(ra) # 80007c3c <panic>

0000000080007364 <trapinit>:
    80007364:	ff010113          	addi	sp,sp,-16
    80007368:	00813423          	sd	s0,8(sp)
    8000736c:	01010413          	addi	s0,sp,16
    80007370:	00813403          	ld	s0,8(sp)
    80007374:	00003597          	auipc	a1,0x3
    80007378:	36c58593          	addi	a1,a1,876 # 8000a6e0 <CONSOLE_STATUS+0x6d0>
    8000737c:	00007517          	auipc	a0,0x7
    80007380:	9c450513          	addi	a0,a0,-1596 # 8000dd40 <tickslock>
    80007384:	01010113          	addi	sp,sp,16
    80007388:	00001317          	auipc	t1,0x1
    8000738c:	5c030067          	jr	1472(t1) # 80008948 <initlock>

0000000080007390 <trapinithart>:
    80007390:	ff010113          	addi	sp,sp,-16
    80007394:	00813423          	sd	s0,8(sp)
    80007398:	01010413          	addi	s0,sp,16
    8000739c:	00000797          	auipc	a5,0x0
    800073a0:	2f478793          	addi	a5,a5,756 # 80007690 <kernelvec>
    800073a4:	10579073          	csrw	stvec,a5
    800073a8:	00813403          	ld	s0,8(sp)
    800073ac:	01010113          	addi	sp,sp,16
    800073b0:	00008067          	ret

00000000800073b4 <usertrap>:
    800073b4:	ff010113          	addi	sp,sp,-16
    800073b8:	00813423          	sd	s0,8(sp)
    800073bc:	01010413          	addi	s0,sp,16
    800073c0:	00813403          	ld	s0,8(sp)
    800073c4:	01010113          	addi	sp,sp,16
    800073c8:	00008067          	ret

00000000800073cc <usertrapret>:
    800073cc:	ff010113          	addi	sp,sp,-16
    800073d0:	00813423          	sd	s0,8(sp)
    800073d4:	01010413          	addi	s0,sp,16
    800073d8:	00813403          	ld	s0,8(sp)
    800073dc:	01010113          	addi	sp,sp,16
    800073e0:	00008067          	ret

00000000800073e4 <kerneltrap>:
    800073e4:	fe010113          	addi	sp,sp,-32
    800073e8:	00813823          	sd	s0,16(sp)
    800073ec:	00113c23          	sd	ra,24(sp)
    800073f0:	00913423          	sd	s1,8(sp)
    800073f4:	02010413          	addi	s0,sp,32
    800073f8:	142025f3          	csrr	a1,scause
    800073fc:	100027f3          	csrr	a5,sstatus
    80007400:	0027f793          	andi	a5,a5,2
    80007404:	10079c63          	bnez	a5,8000751c <kerneltrap+0x138>
    80007408:	142027f3          	csrr	a5,scause
    8000740c:	0207ce63          	bltz	a5,80007448 <kerneltrap+0x64>
    80007410:	00003517          	auipc	a0,0x3
    80007414:	31850513          	addi	a0,a0,792 # 8000a728 <CONSOLE_STATUS+0x718>
    80007418:	00001097          	auipc	ra,0x1
    8000741c:	880080e7          	jalr	-1920(ra) # 80007c98 <__printf>
    80007420:	141025f3          	csrr	a1,sepc
    80007424:	14302673          	csrr	a2,stval
    80007428:	00003517          	auipc	a0,0x3
    8000742c:	31050513          	addi	a0,a0,784 # 8000a738 <CONSOLE_STATUS+0x728>
    80007430:	00001097          	auipc	ra,0x1
    80007434:	868080e7          	jalr	-1944(ra) # 80007c98 <__printf>
    80007438:	00003517          	auipc	a0,0x3
    8000743c:	31850513          	addi	a0,a0,792 # 8000a750 <CONSOLE_STATUS+0x740>
    80007440:	00000097          	auipc	ra,0x0
    80007444:	7fc080e7          	jalr	2044(ra) # 80007c3c <panic>
    80007448:	0ff7f713          	andi	a4,a5,255
    8000744c:	00900693          	li	a3,9
    80007450:	04d70063          	beq	a4,a3,80007490 <kerneltrap+0xac>
    80007454:	fff00713          	li	a4,-1
    80007458:	03f71713          	slli	a4,a4,0x3f
    8000745c:	00170713          	addi	a4,a4,1
    80007460:	fae798e3          	bne	a5,a4,80007410 <kerneltrap+0x2c>
    80007464:	00000097          	auipc	ra,0x0
    80007468:	e00080e7          	jalr	-512(ra) # 80007264 <cpuid>
    8000746c:	06050663          	beqz	a0,800074d8 <kerneltrap+0xf4>
    80007470:	144027f3          	csrr	a5,sip
    80007474:	ffd7f793          	andi	a5,a5,-3
    80007478:	14479073          	csrw	sip,a5
    8000747c:	01813083          	ld	ra,24(sp)
    80007480:	01013403          	ld	s0,16(sp)
    80007484:	00813483          	ld	s1,8(sp)
    80007488:	02010113          	addi	sp,sp,32
    8000748c:	00008067          	ret
    80007490:	00000097          	auipc	ra,0x0
    80007494:	3c4080e7          	jalr	964(ra) # 80007854 <plic_claim>
    80007498:	00a00793          	li	a5,10
    8000749c:	00050493          	mv	s1,a0
    800074a0:	06f50863          	beq	a0,a5,80007510 <kerneltrap+0x12c>
    800074a4:	fc050ce3          	beqz	a0,8000747c <kerneltrap+0x98>
    800074a8:	00050593          	mv	a1,a0
    800074ac:	00003517          	auipc	a0,0x3
    800074b0:	25c50513          	addi	a0,a0,604 # 8000a708 <CONSOLE_STATUS+0x6f8>
    800074b4:	00000097          	auipc	ra,0x0
    800074b8:	7e4080e7          	jalr	2020(ra) # 80007c98 <__printf>
    800074bc:	01013403          	ld	s0,16(sp)
    800074c0:	01813083          	ld	ra,24(sp)
    800074c4:	00048513          	mv	a0,s1
    800074c8:	00813483          	ld	s1,8(sp)
    800074cc:	02010113          	addi	sp,sp,32
    800074d0:	00000317          	auipc	t1,0x0
    800074d4:	3bc30067          	jr	956(t1) # 8000788c <plic_complete>
    800074d8:	00007517          	auipc	a0,0x7
    800074dc:	86850513          	addi	a0,a0,-1944 # 8000dd40 <tickslock>
    800074e0:	00001097          	auipc	ra,0x1
    800074e4:	48c080e7          	jalr	1164(ra) # 8000896c <acquire>
    800074e8:	00005717          	auipc	a4,0x5
    800074ec:	6ac70713          	addi	a4,a4,1708 # 8000cb94 <ticks>
    800074f0:	00072783          	lw	a5,0(a4)
    800074f4:	00007517          	auipc	a0,0x7
    800074f8:	84c50513          	addi	a0,a0,-1972 # 8000dd40 <tickslock>
    800074fc:	0017879b          	addiw	a5,a5,1
    80007500:	00f72023          	sw	a5,0(a4)
    80007504:	00001097          	auipc	ra,0x1
    80007508:	534080e7          	jalr	1332(ra) # 80008a38 <release>
    8000750c:	f65ff06f          	j	80007470 <kerneltrap+0x8c>
    80007510:	00001097          	auipc	ra,0x1
    80007514:	090080e7          	jalr	144(ra) # 800085a0 <uartintr>
    80007518:	fa5ff06f          	j	800074bc <kerneltrap+0xd8>
    8000751c:	00003517          	auipc	a0,0x3
    80007520:	1cc50513          	addi	a0,a0,460 # 8000a6e8 <CONSOLE_STATUS+0x6d8>
    80007524:	00000097          	auipc	ra,0x0
    80007528:	718080e7          	jalr	1816(ra) # 80007c3c <panic>

000000008000752c <clockintr>:
    8000752c:	fe010113          	addi	sp,sp,-32
    80007530:	00813823          	sd	s0,16(sp)
    80007534:	00913423          	sd	s1,8(sp)
    80007538:	00113c23          	sd	ra,24(sp)
    8000753c:	02010413          	addi	s0,sp,32
    80007540:	00007497          	auipc	s1,0x7
    80007544:	80048493          	addi	s1,s1,-2048 # 8000dd40 <tickslock>
    80007548:	00048513          	mv	a0,s1
    8000754c:	00001097          	auipc	ra,0x1
    80007550:	420080e7          	jalr	1056(ra) # 8000896c <acquire>
    80007554:	00005717          	auipc	a4,0x5
    80007558:	64070713          	addi	a4,a4,1600 # 8000cb94 <ticks>
    8000755c:	00072783          	lw	a5,0(a4)
    80007560:	01013403          	ld	s0,16(sp)
    80007564:	01813083          	ld	ra,24(sp)
    80007568:	00048513          	mv	a0,s1
    8000756c:	0017879b          	addiw	a5,a5,1
    80007570:	00813483          	ld	s1,8(sp)
    80007574:	00f72023          	sw	a5,0(a4)
    80007578:	02010113          	addi	sp,sp,32
    8000757c:	00001317          	auipc	t1,0x1
    80007580:	4bc30067          	jr	1212(t1) # 80008a38 <release>

0000000080007584 <devintr>:
    80007584:	142027f3          	csrr	a5,scause
    80007588:	00000513          	li	a0,0
    8000758c:	0007c463          	bltz	a5,80007594 <devintr+0x10>
    80007590:	00008067          	ret
    80007594:	fe010113          	addi	sp,sp,-32
    80007598:	00813823          	sd	s0,16(sp)
    8000759c:	00113c23          	sd	ra,24(sp)
    800075a0:	00913423          	sd	s1,8(sp)
    800075a4:	02010413          	addi	s0,sp,32
    800075a8:	0ff7f713          	andi	a4,a5,255
    800075ac:	00900693          	li	a3,9
    800075b0:	04d70c63          	beq	a4,a3,80007608 <devintr+0x84>
    800075b4:	fff00713          	li	a4,-1
    800075b8:	03f71713          	slli	a4,a4,0x3f
    800075bc:	00170713          	addi	a4,a4,1
    800075c0:	00e78c63          	beq	a5,a4,800075d8 <devintr+0x54>
    800075c4:	01813083          	ld	ra,24(sp)
    800075c8:	01013403          	ld	s0,16(sp)
    800075cc:	00813483          	ld	s1,8(sp)
    800075d0:	02010113          	addi	sp,sp,32
    800075d4:	00008067          	ret
    800075d8:	00000097          	auipc	ra,0x0
    800075dc:	c8c080e7          	jalr	-884(ra) # 80007264 <cpuid>
    800075e0:	06050663          	beqz	a0,8000764c <devintr+0xc8>
    800075e4:	144027f3          	csrr	a5,sip
    800075e8:	ffd7f793          	andi	a5,a5,-3
    800075ec:	14479073          	csrw	sip,a5
    800075f0:	01813083          	ld	ra,24(sp)
    800075f4:	01013403          	ld	s0,16(sp)
    800075f8:	00813483          	ld	s1,8(sp)
    800075fc:	00200513          	li	a0,2
    80007600:	02010113          	addi	sp,sp,32
    80007604:	00008067          	ret
    80007608:	00000097          	auipc	ra,0x0
    8000760c:	24c080e7          	jalr	588(ra) # 80007854 <plic_claim>
    80007610:	00a00793          	li	a5,10
    80007614:	00050493          	mv	s1,a0
    80007618:	06f50663          	beq	a0,a5,80007684 <devintr+0x100>
    8000761c:	00100513          	li	a0,1
    80007620:	fa0482e3          	beqz	s1,800075c4 <devintr+0x40>
    80007624:	00048593          	mv	a1,s1
    80007628:	00003517          	auipc	a0,0x3
    8000762c:	0e050513          	addi	a0,a0,224 # 8000a708 <CONSOLE_STATUS+0x6f8>
    80007630:	00000097          	auipc	ra,0x0
    80007634:	668080e7          	jalr	1640(ra) # 80007c98 <__printf>
    80007638:	00048513          	mv	a0,s1
    8000763c:	00000097          	auipc	ra,0x0
    80007640:	250080e7          	jalr	592(ra) # 8000788c <plic_complete>
    80007644:	00100513          	li	a0,1
    80007648:	f7dff06f          	j	800075c4 <devintr+0x40>
    8000764c:	00006517          	auipc	a0,0x6
    80007650:	6f450513          	addi	a0,a0,1780 # 8000dd40 <tickslock>
    80007654:	00001097          	auipc	ra,0x1
    80007658:	318080e7          	jalr	792(ra) # 8000896c <acquire>
    8000765c:	00005717          	auipc	a4,0x5
    80007660:	53870713          	addi	a4,a4,1336 # 8000cb94 <ticks>
    80007664:	00072783          	lw	a5,0(a4)
    80007668:	00006517          	auipc	a0,0x6
    8000766c:	6d850513          	addi	a0,a0,1752 # 8000dd40 <tickslock>
    80007670:	0017879b          	addiw	a5,a5,1
    80007674:	00f72023          	sw	a5,0(a4)
    80007678:	00001097          	auipc	ra,0x1
    8000767c:	3c0080e7          	jalr	960(ra) # 80008a38 <release>
    80007680:	f65ff06f          	j	800075e4 <devintr+0x60>
    80007684:	00001097          	auipc	ra,0x1
    80007688:	f1c080e7          	jalr	-228(ra) # 800085a0 <uartintr>
    8000768c:	fadff06f          	j	80007638 <devintr+0xb4>

0000000080007690 <kernelvec>:
    80007690:	f0010113          	addi	sp,sp,-256
    80007694:	00113023          	sd	ra,0(sp)
    80007698:	00213423          	sd	sp,8(sp)
    8000769c:	00313823          	sd	gp,16(sp)
    800076a0:	00413c23          	sd	tp,24(sp)
    800076a4:	02513023          	sd	t0,32(sp)
    800076a8:	02613423          	sd	t1,40(sp)
    800076ac:	02713823          	sd	t2,48(sp)
    800076b0:	02813c23          	sd	s0,56(sp)
    800076b4:	04913023          	sd	s1,64(sp)
    800076b8:	04a13423          	sd	a0,72(sp)
    800076bc:	04b13823          	sd	a1,80(sp)
    800076c0:	04c13c23          	sd	a2,88(sp)
    800076c4:	06d13023          	sd	a3,96(sp)
    800076c8:	06e13423          	sd	a4,104(sp)
    800076cc:	06f13823          	sd	a5,112(sp)
    800076d0:	07013c23          	sd	a6,120(sp)
    800076d4:	09113023          	sd	a7,128(sp)
    800076d8:	09213423          	sd	s2,136(sp)
    800076dc:	09313823          	sd	s3,144(sp)
    800076e0:	09413c23          	sd	s4,152(sp)
    800076e4:	0b513023          	sd	s5,160(sp)
    800076e8:	0b613423          	sd	s6,168(sp)
    800076ec:	0b713823          	sd	s7,176(sp)
    800076f0:	0b813c23          	sd	s8,184(sp)
    800076f4:	0d913023          	sd	s9,192(sp)
    800076f8:	0da13423          	sd	s10,200(sp)
    800076fc:	0db13823          	sd	s11,208(sp)
    80007700:	0dc13c23          	sd	t3,216(sp)
    80007704:	0fd13023          	sd	t4,224(sp)
    80007708:	0fe13423          	sd	t5,232(sp)
    8000770c:	0ff13823          	sd	t6,240(sp)
    80007710:	cd5ff0ef          	jal	ra,800073e4 <kerneltrap>
    80007714:	00013083          	ld	ra,0(sp)
    80007718:	00813103          	ld	sp,8(sp)
    8000771c:	01013183          	ld	gp,16(sp)
    80007720:	02013283          	ld	t0,32(sp)
    80007724:	02813303          	ld	t1,40(sp)
    80007728:	03013383          	ld	t2,48(sp)
    8000772c:	03813403          	ld	s0,56(sp)
    80007730:	04013483          	ld	s1,64(sp)
    80007734:	04813503          	ld	a0,72(sp)
    80007738:	05013583          	ld	a1,80(sp)
    8000773c:	05813603          	ld	a2,88(sp)
    80007740:	06013683          	ld	a3,96(sp)
    80007744:	06813703          	ld	a4,104(sp)
    80007748:	07013783          	ld	a5,112(sp)
    8000774c:	07813803          	ld	a6,120(sp)
    80007750:	08013883          	ld	a7,128(sp)
    80007754:	08813903          	ld	s2,136(sp)
    80007758:	09013983          	ld	s3,144(sp)
    8000775c:	09813a03          	ld	s4,152(sp)
    80007760:	0a013a83          	ld	s5,160(sp)
    80007764:	0a813b03          	ld	s6,168(sp)
    80007768:	0b013b83          	ld	s7,176(sp)
    8000776c:	0b813c03          	ld	s8,184(sp)
    80007770:	0c013c83          	ld	s9,192(sp)
    80007774:	0c813d03          	ld	s10,200(sp)
    80007778:	0d013d83          	ld	s11,208(sp)
    8000777c:	0d813e03          	ld	t3,216(sp)
    80007780:	0e013e83          	ld	t4,224(sp)
    80007784:	0e813f03          	ld	t5,232(sp)
    80007788:	0f013f83          	ld	t6,240(sp)
    8000778c:	10010113          	addi	sp,sp,256
    80007790:	10200073          	sret
    80007794:	00000013          	nop
    80007798:	00000013          	nop
    8000779c:	00000013          	nop

00000000800077a0 <timervec>:
    800077a0:	34051573          	csrrw	a0,mscratch,a0
    800077a4:	00b53023          	sd	a1,0(a0)
    800077a8:	00c53423          	sd	a2,8(a0)
    800077ac:	00d53823          	sd	a3,16(a0)
    800077b0:	01853583          	ld	a1,24(a0)
    800077b4:	02053603          	ld	a2,32(a0)
    800077b8:	0005b683          	ld	a3,0(a1)
    800077bc:	00c686b3          	add	a3,a3,a2
    800077c0:	00d5b023          	sd	a3,0(a1)
    800077c4:	00200593          	li	a1,2
    800077c8:	14459073          	csrw	sip,a1
    800077cc:	01053683          	ld	a3,16(a0)
    800077d0:	00853603          	ld	a2,8(a0)
    800077d4:	00053583          	ld	a1,0(a0)
    800077d8:	34051573          	csrrw	a0,mscratch,a0
    800077dc:	30200073          	mret

00000000800077e0 <plicinit>:
    800077e0:	ff010113          	addi	sp,sp,-16
    800077e4:	00813423          	sd	s0,8(sp)
    800077e8:	01010413          	addi	s0,sp,16
    800077ec:	00813403          	ld	s0,8(sp)
    800077f0:	0c0007b7          	lui	a5,0xc000
    800077f4:	00100713          	li	a4,1
    800077f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800077fc:	00e7a223          	sw	a4,4(a5)
    80007800:	01010113          	addi	sp,sp,16
    80007804:	00008067          	ret

0000000080007808 <plicinithart>:
    80007808:	ff010113          	addi	sp,sp,-16
    8000780c:	00813023          	sd	s0,0(sp)
    80007810:	00113423          	sd	ra,8(sp)
    80007814:	01010413          	addi	s0,sp,16
    80007818:	00000097          	auipc	ra,0x0
    8000781c:	a4c080e7          	jalr	-1460(ra) # 80007264 <cpuid>
    80007820:	0085171b          	slliw	a4,a0,0x8
    80007824:	0c0027b7          	lui	a5,0xc002
    80007828:	00e787b3          	add	a5,a5,a4
    8000782c:	40200713          	li	a4,1026
    80007830:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007834:	00813083          	ld	ra,8(sp)
    80007838:	00013403          	ld	s0,0(sp)
    8000783c:	00d5151b          	slliw	a0,a0,0xd
    80007840:	0c2017b7          	lui	a5,0xc201
    80007844:	00a78533          	add	a0,a5,a0
    80007848:	00052023          	sw	zero,0(a0)
    8000784c:	01010113          	addi	sp,sp,16
    80007850:	00008067          	ret

0000000080007854 <plic_claim>:
    80007854:	ff010113          	addi	sp,sp,-16
    80007858:	00813023          	sd	s0,0(sp)
    8000785c:	00113423          	sd	ra,8(sp)
    80007860:	01010413          	addi	s0,sp,16
    80007864:	00000097          	auipc	ra,0x0
    80007868:	a00080e7          	jalr	-1536(ra) # 80007264 <cpuid>
    8000786c:	00813083          	ld	ra,8(sp)
    80007870:	00013403          	ld	s0,0(sp)
    80007874:	00d5151b          	slliw	a0,a0,0xd
    80007878:	0c2017b7          	lui	a5,0xc201
    8000787c:	00a78533          	add	a0,a5,a0
    80007880:	00452503          	lw	a0,4(a0)
    80007884:	01010113          	addi	sp,sp,16
    80007888:	00008067          	ret

000000008000788c <plic_complete>:
    8000788c:	fe010113          	addi	sp,sp,-32
    80007890:	00813823          	sd	s0,16(sp)
    80007894:	00913423          	sd	s1,8(sp)
    80007898:	00113c23          	sd	ra,24(sp)
    8000789c:	02010413          	addi	s0,sp,32
    800078a0:	00050493          	mv	s1,a0
    800078a4:	00000097          	auipc	ra,0x0
    800078a8:	9c0080e7          	jalr	-1600(ra) # 80007264 <cpuid>
    800078ac:	01813083          	ld	ra,24(sp)
    800078b0:	01013403          	ld	s0,16(sp)
    800078b4:	00d5179b          	slliw	a5,a0,0xd
    800078b8:	0c201737          	lui	a4,0xc201
    800078bc:	00f707b3          	add	a5,a4,a5
    800078c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800078c4:	00813483          	ld	s1,8(sp)
    800078c8:	02010113          	addi	sp,sp,32
    800078cc:	00008067          	ret

00000000800078d0 <consolewrite>:
    800078d0:	fb010113          	addi	sp,sp,-80
    800078d4:	04813023          	sd	s0,64(sp)
    800078d8:	04113423          	sd	ra,72(sp)
    800078dc:	02913c23          	sd	s1,56(sp)
    800078e0:	03213823          	sd	s2,48(sp)
    800078e4:	03313423          	sd	s3,40(sp)
    800078e8:	03413023          	sd	s4,32(sp)
    800078ec:	01513c23          	sd	s5,24(sp)
    800078f0:	05010413          	addi	s0,sp,80
    800078f4:	06c05c63          	blez	a2,8000796c <consolewrite+0x9c>
    800078f8:	00060993          	mv	s3,a2
    800078fc:	00050a13          	mv	s4,a0
    80007900:	00058493          	mv	s1,a1
    80007904:	00000913          	li	s2,0
    80007908:	fff00a93          	li	s5,-1
    8000790c:	01c0006f          	j	80007928 <consolewrite+0x58>
    80007910:	fbf44503          	lbu	a0,-65(s0)
    80007914:	0019091b          	addiw	s2,s2,1
    80007918:	00148493          	addi	s1,s1,1
    8000791c:	00001097          	auipc	ra,0x1
    80007920:	a9c080e7          	jalr	-1380(ra) # 800083b8 <uartputc>
    80007924:	03298063          	beq	s3,s2,80007944 <consolewrite+0x74>
    80007928:	00048613          	mv	a2,s1
    8000792c:	00100693          	li	a3,1
    80007930:	000a0593          	mv	a1,s4
    80007934:	fbf40513          	addi	a0,s0,-65
    80007938:	00000097          	auipc	ra,0x0
    8000793c:	9e4080e7          	jalr	-1564(ra) # 8000731c <either_copyin>
    80007940:	fd5518e3          	bne	a0,s5,80007910 <consolewrite+0x40>
    80007944:	04813083          	ld	ra,72(sp)
    80007948:	04013403          	ld	s0,64(sp)
    8000794c:	03813483          	ld	s1,56(sp)
    80007950:	02813983          	ld	s3,40(sp)
    80007954:	02013a03          	ld	s4,32(sp)
    80007958:	01813a83          	ld	s5,24(sp)
    8000795c:	00090513          	mv	a0,s2
    80007960:	03013903          	ld	s2,48(sp)
    80007964:	05010113          	addi	sp,sp,80
    80007968:	00008067          	ret
    8000796c:	00000913          	li	s2,0
    80007970:	fd5ff06f          	j	80007944 <consolewrite+0x74>

0000000080007974 <consoleread>:
    80007974:	f9010113          	addi	sp,sp,-112
    80007978:	06813023          	sd	s0,96(sp)
    8000797c:	04913c23          	sd	s1,88(sp)
    80007980:	05213823          	sd	s2,80(sp)
    80007984:	05313423          	sd	s3,72(sp)
    80007988:	05413023          	sd	s4,64(sp)
    8000798c:	03513c23          	sd	s5,56(sp)
    80007990:	03613823          	sd	s6,48(sp)
    80007994:	03713423          	sd	s7,40(sp)
    80007998:	03813023          	sd	s8,32(sp)
    8000799c:	06113423          	sd	ra,104(sp)
    800079a0:	01913c23          	sd	s9,24(sp)
    800079a4:	07010413          	addi	s0,sp,112
    800079a8:	00060b93          	mv	s7,a2
    800079ac:	00050913          	mv	s2,a0
    800079b0:	00058c13          	mv	s8,a1
    800079b4:	00060b1b          	sext.w	s6,a2
    800079b8:	00006497          	auipc	s1,0x6
    800079bc:	3b048493          	addi	s1,s1,944 # 8000dd68 <cons>
    800079c0:	00400993          	li	s3,4
    800079c4:	fff00a13          	li	s4,-1
    800079c8:	00a00a93          	li	s5,10
    800079cc:	05705e63          	blez	s7,80007a28 <consoleread+0xb4>
    800079d0:	09c4a703          	lw	a4,156(s1)
    800079d4:	0984a783          	lw	a5,152(s1)
    800079d8:	0007071b          	sext.w	a4,a4
    800079dc:	08e78463          	beq	a5,a4,80007a64 <consoleread+0xf0>
    800079e0:	07f7f713          	andi	a4,a5,127
    800079e4:	00e48733          	add	a4,s1,a4
    800079e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800079ec:	0017869b          	addiw	a3,a5,1
    800079f0:	08d4ac23          	sw	a3,152(s1)
    800079f4:	00070c9b          	sext.w	s9,a4
    800079f8:	0b370663          	beq	a4,s3,80007aa4 <consoleread+0x130>
    800079fc:	00100693          	li	a3,1
    80007a00:	f9f40613          	addi	a2,s0,-97
    80007a04:	000c0593          	mv	a1,s8
    80007a08:	00090513          	mv	a0,s2
    80007a0c:	f8e40fa3          	sb	a4,-97(s0)
    80007a10:	00000097          	auipc	ra,0x0
    80007a14:	8c0080e7          	jalr	-1856(ra) # 800072d0 <either_copyout>
    80007a18:	01450863          	beq	a0,s4,80007a28 <consoleread+0xb4>
    80007a1c:	001c0c13          	addi	s8,s8,1
    80007a20:	fffb8b9b          	addiw	s7,s7,-1
    80007a24:	fb5c94e3          	bne	s9,s5,800079cc <consoleread+0x58>
    80007a28:	000b851b          	sext.w	a0,s7
    80007a2c:	06813083          	ld	ra,104(sp)
    80007a30:	06013403          	ld	s0,96(sp)
    80007a34:	05813483          	ld	s1,88(sp)
    80007a38:	05013903          	ld	s2,80(sp)
    80007a3c:	04813983          	ld	s3,72(sp)
    80007a40:	04013a03          	ld	s4,64(sp)
    80007a44:	03813a83          	ld	s5,56(sp)
    80007a48:	02813b83          	ld	s7,40(sp)
    80007a4c:	02013c03          	ld	s8,32(sp)
    80007a50:	01813c83          	ld	s9,24(sp)
    80007a54:	40ab053b          	subw	a0,s6,a0
    80007a58:	03013b03          	ld	s6,48(sp)
    80007a5c:	07010113          	addi	sp,sp,112
    80007a60:	00008067          	ret
    80007a64:	00001097          	auipc	ra,0x1
    80007a68:	1d8080e7          	jalr	472(ra) # 80008c3c <push_on>
    80007a6c:	0984a703          	lw	a4,152(s1)
    80007a70:	09c4a783          	lw	a5,156(s1)
    80007a74:	0007879b          	sext.w	a5,a5
    80007a78:	fef70ce3          	beq	a4,a5,80007a70 <consoleread+0xfc>
    80007a7c:	00001097          	auipc	ra,0x1
    80007a80:	234080e7          	jalr	564(ra) # 80008cb0 <pop_on>
    80007a84:	0984a783          	lw	a5,152(s1)
    80007a88:	07f7f713          	andi	a4,a5,127
    80007a8c:	00e48733          	add	a4,s1,a4
    80007a90:	01874703          	lbu	a4,24(a4)
    80007a94:	0017869b          	addiw	a3,a5,1
    80007a98:	08d4ac23          	sw	a3,152(s1)
    80007a9c:	00070c9b          	sext.w	s9,a4
    80007aa0:	f5371ee3          	bne	a4,s3,800079fc <consoleread+0x88>
    80007aa4:	000b851b          	sext.w	a0,s7
    80007aa8:	f96bf2e3          	bgeu	s7,s6,80007a2c <consoleread+0xb8>
    80007aac:	08f4ac23          	sw	a5,152(s1)
    80007ab0:	f7dff06f          	j	80007a2c <consoleread+0xb8>

0000000080007ab4 <consputc>:
    80007ab4:	10000793          	li	a5,256
    80007ab8:	00f50663          	beq	a0,a5,80007ac4 <consputc+0x10>
    80007abc:	00001317          	auipc	t1,0x1
    80007ac0:	9f430067          	jr	-1548(t1) # 800084b0 <uartputc_sync>
    80007ac4:	ff010113          	addi	sp,sp,-16
    80007ac8:	00113423          	sd	ra,8(sp)
    80007acc:	00813023          	sd	s0,0(sp)
    80007ad0:	01010413          	addi	s0,sp,16
    80007ad4:	00800513          	li	a0,8
    80007ad8:	00001097          	auipc	ra,0x1
    80007adc:	9d8080e7          	jalr	-1576(ra) # 800084b0 <uartputc_sync>
    80007ae0:	02000513          	li	a0,32
    80007ae4:	00001097          	auipc	ra,0x1
    80007ae8:	9cc080e7          	jalr	-1588(ra) # 800084b0 <uartputc_sync>
    80007aec:	00013403          	ld	s0,0(sp)
    80007af0:	00813083          	ld	ra,8(sp)
    80007af4:	00800513          	li	a0,8
    80007af8:	01010113          	addi	sp,sp,16
    80007afc:	00001317          	auipc	t1,0x1
    80007b00:	9b430067          	jr	-1612(t1) # 800084b0 <uartputc_sync>

0000000080007b04 <consoleintr>:
    80007b04:	fe010113          	addi	sp,sp,-32
    80007b08:	00813823          	sd	s0,16(sp)
    80007b0c:	00913423          	sd	s1,8(sp)
    80007b10:	01213023          	sd	s2,0(sp)
    80007b14:	00113c23          	sd	ra,24(sp)
    80007b18:	02010413          	addi	s0,sp,32
    80007b1c:	00006917          	auipc	s2,0x6
    80007b20:	24c90913          	addi	s2,s2,588 # 8000dd68 <cons>
    80007b24:	00050493          	mv	s1,a0
    80007b28:	00090513          	mv	a0,s2
    80007b2c:	00001097          	auipc	ra,0x1
    80007b30:	e40080e7          	jalr	-448(ra) # 8000896c <acquire>
    80007b34:	02048c63          	beqz	s1,80007b6c <consoleintr+0x68>
    80007b38:	0a092783          	lw	a5,160(s2)
    80007b3c:	09892703          	lw	a4,152(s2)
    80007b40:	07f00693          	li	a3,127
    80007b44:	40e7873b          	subw	a4,a5,a4
    80007b48:	02e6e263          	bltu	a3,a4,80007b6c <consoleintr+0x68>
    80007b4c:	00d00713          	li	a4,13
    80007b50:	04e48063          	beq	s1,a4,80007b90 <consoleintr+0x8c>
    80007b54:	07f7f713          	andi	a4,a5,127
    80007b58:	00e90733          	add	a4,s2,a4
    80007b5c:	0017879b          	addiw	a5,a5,1
    80007b60:	0af92023          	sw	a5,160(s2)
    80007b64:	00970c23          	sb	s1,24(a4)
    80007b68:	08f92e23          	sw	a5,156(s2)
    80007b6c:	01013403          	ld	s0,16(sp)
    80007b70:	01813083          	ld	ra,24(sp)
    80007b74:	00813483          	ld	s1,8(sp)
    80007b78:	00013903          	ld	s2,0(sp)
    80007b7c:	00006517          	auipc	a0,0x6
    80007b80:	1ec50513          	addi	a0,a0,492 # 8000dd68 <cons>
    80007b84:	02010113          	addi	sp,sp,32
    80007b88:	00001317          	auipc	t1,0x1
    80007b8c:	eb030067          	jr	-336(t1) # 80008a38 <release>
    80007b90:	00a00493          	li	s1,10
    80007b94:	fc1ff06f          	j	80007b54 <consoleintr+0x50>

0000000080007b98 <consoleinit>:
    80007b98:	fe010113          	addi	sp,sp,-32
    80007b9c:	00113c23          	sd	ra,24(sp)
    80007ba0:	00813823          	sd	s0,16(sp)
    80007ba4:	00913423          	sd	s1,8(sp)
    80007ba8:	02010413          	addi	s0,sp,32
    80007bac:	00006497          	auipc	s1,0x6
    80007bb0:	1bc48493          	addi	s1,s1,444 # 8000dd68 <cons>
    80007bb4:	00048513          	mv	a0,s1
    80007bb8:	00003597          	auipc	a1,0x3
    80007bbc:	ba858593          	addi	a1,a1,-1112 # 8000a760 <CONSOLE_STATUS+0x750>
    80007bc0:	00001097          	auipc	ra,0x1
    80007bc4:	d88080e7          	jalr	-632(ra) # 80008948 <initlock>
    80007bc8:	00000097          	auipc	ra,0x0
    80007bcc:	7ac080e7          	jalr	1964(ra) # 80008374 <uartinit>
    80007bd0:	01813083          	ld	ra,24(sp)
    80007bd4:	01013403          	ld	s0,16(sp)
    80007bd8:	00000797          	auipc	a5,0x0
    80007bdc:	d9c78793          	addi	a5,a5,-612 # 80007974 <consoleread>
    80007be0:	0af4bc23          	sd	a5,184(s1)
    80007be4:	00000797          	auipc	a5,0x0
    80007be8:	cec78793          	addi	a5,a5,-788 # 800078d0 <consolewrite>
    80007bec:	0cf4b023          	sd	a5,192(s1)
    80007bf0:	00813483          	ld	s1,8(sp)
    80007bf4:	02010113          	addi	sp,sp,32
    80007bf8:	00008067          	ret

0000000080007bfc <console_read>:
    80007bfc:	ff010113          	addi	sp,sp,-16
    80007c00:	00813423          	sd	s0,8(sp)
    80007c04:	01010413          	addi	s0,sp,16
    80007c08:	00813403          	ld	s0,8(sp)
    80007c0c:	00006317          	auipc	t1,0x6
    80007c10:	21433303          	ld	t1,532(t1) # 8000de20 <devsw+0x10>
    80007c14:	01010113          	addi	sp,sp,16
    80007c18:	00030067          	jr	t1

0000000080007c1c <console_write>:
    80007c1c:	ff010113          	addi	sp,sp,-16
    80007c20:	00813423          	sd	s0,8(sp)
    80007c24:	01010413          	addi	s0,sp,16
    80007c28:	00813403          	ld	s0,8(sp)
    80007c2c:	00006317          	auipc	t1,0x6
    80007c30:	1fc33303          	ld	t1,508(t1) # 8000de28 <devsw+0x18>
    80007c34:	01010113          	addi	sp,sp,16
    80007c38:	00030067          	jr	t1

0000000080007c3c <panic>:
    80007c3c:	fe010113          	addi	sp,sp,-32
    80007c40:	00113c23          	sd	ra,24(sp)
    80007c44:	00813823          	sd	s0,16(sp)
    80007c48:	00913423          	sd	s1,8(sp)
    80007c4c:	02010413          	addi	s0,sp,32
    80007c50:	00050493          	mv	s1,a0
    80007c54:	00003517          	auipc	a0,0x3
    80007c58:	b1450513          	addi	a0,a0,-1260 # 8000a768 <CONSOLE_STATUS+0x758>
    80007c5c:	00006797          	auipc	a5,0x6
    80007c60:	2607a623          	sw	zero,620(a5) # 8000dec8 <pr+0x18>
    80007c64:	00000097          	auipc	ra,0x0
    80007c68:	034080e7          	jalr	52(ra) # 80007c98 <__printf>
    80007c6c:	00048513          	mv	a0,s1
    80007c70:	00000097          	auipc	ra,0x0
    80007c74:	028080e7          	jalr	40(ra) # 80007c98 <__printf>
    80007c78:	00002517          	auipc	a0,0x2
    80007c7c:	73050513          	addi	a0,a0,1840 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80007c80:	00000097          	auipc	ra,0x0
    80007c84:	018080e7          	jalr	24(ra) # 80007c98 <__printf>
    80007c88:	00100793          	li	a5,1
    80007c8c:	00005717          	auipc	a4,0x5
    80007c90:	f0f72623          	sw	a5,-244(a4) # 8000cb98 <panicked>
    80007c94:	0000006f          	j	80007c94 <panic+0x58>

0000000080007c98 <__printf>:
    80007c98:	f3010113          	addi	sp,sp,-208
    80007c9c:	08813023          	sd	s0,128(sp)
    80007ca0:	07313423          	sd	s3,104(sp)
    80007ca4:	09010413          	addi	s0,sp,144
    80007ca8:	05813023          	sd	s8,64(sp)
    80007cac:	08113423          	sd	ra,136(sp)
    80007cb0:	06913c23          	sd	s1,120(sp)
    80007cb4:	07213823          	sd	s2,112(sp)
    80007cb8:	07413023          	sd	s4,96(sp)
    80007cbc:	05513c23          	sd	s5,88(sp)
    80007cc0:	05613823          	sd	s6,80(sp)
    80007cc4:	05713423          	sd	s7,72(sp)
    80007cc8:	03913c23          	sd	s9,56(sp)
    80007ccc:	03a13823          	sd	s10,48(sp)
    80007cd0:	03b13423          	sd	s11,40(sp)
    80007cd4:	00006317          	auipc	t1,0x6
    80007cd8:	1dc30313          	addi	t1,t1,476 # 8000deb0 <pr>
    80007cdc:	01832c03          	lw	s8,24(t1)
    80007ce0:	00b43423          	sd	a1,8(s0)
    80007ce4:	00c43823          	sd	a2,16(s0)
    80007ce8:	00d43c23          	sd	a3,24(s0)
    80007cec:	02e43023          	sd	a4,32(s0)
    80007cf0:	02f43423          	sd	a5,40(s0)
    80007cf4:	03043823          	sd	a6,48(s0)
    80007cf8:	03143c23          	sd	a7,56(s0)
    80007cfc:	00050993          	mv	s3,a0
    80007d00:	4a0c1663          	bnez	s8,800081ac <__printf+0x514>
    80007d04:	60098c63          	beqz	s3,8000831c <__printf+0x684>
    80007d08:	0009c503          	lbu	a0,0(s3)
    80007d0c:	00840793          	addi	a5,s0,8
    80007d10:	f6f43c23          	sd	a5,-136(s0)
    80007d14:	00000493          	li	s1,0
    80007d18:	22050063          	beqz	a0,80007f38 <__printf+0x2a0>
    80007d1c:	00002a37          	lui	s4,0x2
    80007d20:	00018ab7          	lui	s5,0x18
    80007d24:	000f4b37          	lui	s6,0xf4
    80007d28:	00989bb7          	lui	s7,0x989
    80007d2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007d30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007d34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007d38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007d3c:	00148c9b          	addiw	s9,s1,1
    80007d40:	02500793          	li	a5,37
    80007d44:	01998933          	add	s2,s3,s9
    80007d48:	38f51263          	bne	a0,a5,800080cc <__printf+0x434>
    80007d4c:	00094783          	lbu	a5,0(s2)
    80007d50:	00078c9b          	sext.w	s9,a5
    80007d54:	1e078263          	beqz	a5,80007f38 <__printf+0x2a0>
    80007d58:	0024849b          	addiw	s1,s1,2
    80007d5c:	07000713          	li	a4,112
    80007d60:	00998933          	add	s2,s3,s1
    80007d64:	38e78a63          	beq	a5,a4,800080f8 <__printf+0x460>
    80007d68:	20f76863          	bltu	a4,a5,80007f78 <__printf+0x2e0>
    80007d6c:	42a78863          	beq	a5,a0,8000819c <__printf+0x504>
    80007d70:	06400713          	li	a4,100
    80007d74:	40e79663          	bne	a5,a4,80008180 <__printf+0x4e8>
    80007d78:	f7843783          	ld	a5,-136(s0)
    80007d7c:	0007a603          	lw	a2,0(a5)
    80007d80:	00878793          	addi	a5,a5,8
    80007d84:	f6f43c23          	sd	a5,-136(s0)
    80007d88:	42064a63          	bltz	a2,800081bc <__printf+0x524>
    80007d8c:	00a00713          	li	a4,10
    80007d90:	02e677bb          	remuw	a5,a2,a4
    80007d94:	00003d97          	auipc	s11,0x3
    80007d98:	9fcd8d93          	addi	s11,s11,-1540 # 8000a790 <digits>
    80007d9c:	00900593          	li	a1,9
    80007da0:	0006051b          	sext.w	a0,a2
    80007da4:	00000c93          	li	s9,0
    80007da8:	02079793          	slli	a5,a5,0x20
    80007dac:	0207d793          	srli	a5,a5,0x20
    80007db0:	00fd87b3          	add	a5,s11,a5
    80007db4:	0007c783          	lbu	a5,0(a5)
    80007db8:	02e656bb          	divuw	a3,a2,a4
    80007dbc:	f8f40023          	sb	a5,-128(s0)
    80007dc0:	14c5d863          	bge	a1,a2,80007f10 <__printf+0x278>
    80007dc4:	06300593          	li	a1,99
    80007dc8:	00100c93          	li	s9,1
    80007dcc:	02e6f7bb          	remuw	a5,a3,a4
    80007dd0:	02079793          	slli	a5,a5,0x20
    80007dd4:	0207d793          	srli	a5,a5,0x20
    80007dd8:	00fd87b3          	add	a5,s11,a5
    80007ddc:	0007c783          	lbu	a5,0(a5)
    80007de0:	02e6d73b          	divuw	a4,a3,a4
    80007de4:	f8f400a3          	sb	a5,-127(s0)
    80007de8:	12a5f463          	bgeu	a1,a0,80007f10 <__printf+0x278>
    80007dec:	00a00693          	li	a3,10
    80007df0:	00900593          	li	a1,9
    80007df4:	02d777bb          	remuw	a5,a4,a3
    80007df8:	02079793          	slli	a5,a5,0x20
    80007dfc:	0207d793          	srli	a5,a5,0x20
    80007e00:	00fd87b3          	add	a5,s11,a5
    80007e04:	0007c503          	lbu	a0,0(a5)
    80007e08:	02d757bb          	divuw	a5,a4,a3
    80007e0c:	f8a40123          	sb	a0,-126(s0)
    80007e10:	48e5f263          	bgeu	a1,a4,80008294 <__printf+0x5fc>
    80007e14:	06300513          	li	a0,99
    80007e18:	02d7f5bb          	remuw	a1,a5,a3
    80007e1c:	02059593          	slli	a1,a1,0x20
    80007e20:	0205d593          	srli	a1,a1,0x20
    80007e24:	00bd85b3          	add	a1,s11,a1
    80007e28:	0005c583          	lbu	a1,0(a1)
    80007e2c:	02d7d7bb          	divuw	a5,a5,a3
    80007e30:	f8b401a3          	sb	a1,-125(s0)
    80007e34:	48e57263          	bgeu	a0,a4,800082b8 <__printf+0x620>
    80007e38:	3e700513          	li	a0,999
    80007e3c:	02d7f5bb          	remuw	a1,a5,a3
    80007e40:	02059593          	slli	a1,a1,0x20
    80007e44:	0205d593          	srli	a1,a1,0x20
    80007e48:	00bd85b3          	add	a1,s11,a1
    80007e4c:	0005c583          	lbu	a1,0(a1)
    80007e50:	02d7d7bb          	divuw	a5,a5,a3
    80007e54:	f8b40223          	sb	a1,-124(s0)
    80007e58:	46e57663          	bgeu	a0,a4,800082c4 <__printf+0x62c>
    80007e5c:	02d7f5bb          	remuw	a1,a5,a3
    80007e60:	02059593          	slli	a1,a1,0x20
    80007e64:	0205d593          	srli	a1,a1,0x20
    80007e68:	00bd85b3          	add	a1,s11,a1
    80007e6c:	0005c583          	lbu	a1,0(a1)
    80007e70:	02d7d7bb          	divuw	a5,a5,a3
    80007e74:	f8b402a3          	sb	a1,-123(s0)
    80007e78:	46ea7863          	bgeu	s4,a4,800082e8 <__printf+0x650>
    80007e7c:	02d7f5bb          	remuw	a1,a5,a3
    80007e80:	02059593          	slli	a1,a1,0x20
    80007e84:	0205d593          	srli	a1,a1,0x20
    80007e88:	00bd85b3          	add	a1,s11,a1
    80007e8c:	0005c583          	lbu	a1,0(a1)
    80007e90:	02d7d7bb          	divuw	a5,a5,a3
    80007e94:	f8b40323          	sb	a1,-122(s0)
    80007e98:	3eeaf863          	bgeu	s5,a4,80008288 <__printf+0x5f0>
    80007e9c:	02d7f5bb          	remuw	a1,a5,a3
    80007ea0:	02059593          	slli	a1,a1,0x20
    80007ea4:	0205d593          	srli	a1,a1,0x20
    80007ea8:	00bd85b3          	add	a1,s11,a1
    80007eac:	0005c583          	lbu	a1,0(a1)
    80007eb0:	02d7d7bb          	divuw	a5,a5,a3
    80007eb4:	f8b403a3          	sb	a1,-121(s0)
    80007eb8:	42eb7e63          	bgeu	s6,a4,800082f4 <__printf+0x65c>
    80007ebc:	02d7f5bb          	remuw	a1,a5,a3
    80007ec0:	02059593          	slli	a1,a1,0x20
    80007ec4:	0205d593          	srli	a1,a1,0x20
    80007ec8:	00bd85b3          	add	a1,s11,a1
    80007ecc:	0005c583          	lbu	a1,0(a1)
    80007ed0:	02d7d7bb          	divuw	a5,a5,a3
    80007ed4:	f8b40423          	sb	a1,-120(s0)
    80007ed8:	42ebfc63          	bgeu	s7,a4,80008310 <__printf+0x678>
    80007edc:	02079793          	slli	a5,a5,0x20
    80007ee0:	0207d793          	srli	a5,a5,0x20
    80007ee4:	00fd8db3          	add	s11,s11,a5
    80007ee8:	000dc703          	lbu	a4,0(s11)
    80007eec:	00a00793          	li	a5,10
    80007ef0:	00900c93          	li	s9,9
    80007ef4:	f8e404a3          	sb	a4,-119(s0)
    80007ef8:	00065c63          	bgez	a2,80007f10 <__printf+0x278>
    80007efc:	f9040713          	addi	a4,s0,-112
    80007f00:	00f70733          	add	a4,a4,a5
    80007f04:	02d00693          	li	a3,45
    80007f08:	fed70823          	sb	a3,-16(a4)
    80007f0c:	00078c93          	mv	s9,a5
    80007f10:	f8040793          	addi	a5,s0,-128
    80007f14:	01978cb3          	add	s9,a5,s9
    80007f18:	f7f40d13          	addi	s10,s0,-129
    80007f1c:	000cc503          	lbu	a0,0(s9)
    80007f20:	fffc8c93          	addi	s9,s9,-1
    80007f24:	00000097          	auipc	ra,0x0
    80007f28:	b90080e7          	jalr	-1136(ra) # 80007ab4 <consputc>
    80007f2c:	ffac98e3          	bne	s9,s10,80007f1c <__printf+0x284>
    80007f30:	00094503          	lbu	a0,0(s2)
    80007f34:	e00514e3          	bnez	a0,80007d3c <__printf+0xa4>
    80007f38:	1a0c1663          	bnez	s8,800080e4 <__printf+0x44c>
    80007f3c:	08813083          	ld	ra,136(sp)
    80007f40:	08013403          	ld	s0,128(sp)
    80007f44:	07813483          	ld	s1,120(sp)
    80007f48:	07013903          	ld	s2,112(sp)
    80007f4c:	06813983          	ld	s3,104(sp)
    80007f50:	06013a03          	ld	s4,96(sp)
    80007f54:	05813a83          	ld	s5,88(sp)
    80007f58:	05013b03          	ld	s6,80(sp)
    80007f5c:	04813b83          	ld	s7,72(sp)
    80007f60:	04013c03          	ld	s8,64(sp)
    80007f64:	03813c83          	ld	s9,56(sp)
    80007f68:	03013d03          	ld	s10,48(sp)
    80007f6c:	02813d83          	ld	s11,40(sp)
    80007f70:	0d010113          	addi	sp,sp,208
    80007f74:	00008067          	ret
    80007f78:	07300713          	li	a4,115
    80007f7c:	1ce78a63          	beq	a5,a4,80008150 <__printf+0x4b8>
    80007f80:	07800713          	li	a4,120
    80007f84:	1ee79e63          	bne	a5,a4,80008180 <__printf+0x4e8>
    80007f88:	f7843783          	ld	a5,-136(s0)
    80007f8c:	0007a703          	lw	a4,0(a5)
    80007f90:	00878793          	addi	a5,a5,8
    80007f94:	f6f43c23          	sd	a5,-136(s0)
    80007f98:	28074263          	bltz	a4,8000821c <__printf+0x584>
    80007f9c:	00002d97          	auipc	s11,0x2
    80007fa0:	7f4d8d93          	addi	s11,s11,2036 # 8000a790 <digits>
    80007fa4:	00f77793          	andi	a5,a4,15
    80007fa8:	00fd87b3          	add	a5,s11,a5
    80007fac:	0007c683          	lbu	a3,0(a5)
    80007fb0:	00f00613          	li	a2,15
    80007fb4:	0007079b          	sext.w	a5,a4
    80007fb8:	f8d40023          	sb	a3,-128(s0)
    80007fbc:	0047559b          	srliw	a1,a4,0x4
    80007fc0:	0047569b          	srliw	a3,a4,0x4
    80007fc4:	00000c93          	li	s9,0
    80007fc8:	0ee65063          	bge	a2,a4,800080a8 <__printf+0x410>
    80007fcc:	00f6f693          	andi	a3,a3,15
    80007fd0:	00dd86b3          	add	a3,s11,a3
    80007fd4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007fd8:	0087d79b          	srliw	a5,a5,0x8
    80007fdc:	00100c93          	li	s9,1
    80007fe0:	f8d400a3          	sb	a3,-127(s0)
    80007fe4:	0cb67263          	bgeu	a2,a1,800080a8 <__printf+0x410>
    80007fe8:	00f7f693          	andi	a3,a5,15
    80007fec:	00dd86b3          	add	a3,s11,a3
    80007ff0:	0006c583          	lbu	a1,0(a3)
    80007ff4:	00f00613          	li	a2,15
    80007ff8:	0047d69b          	srliw	a3,a5,0x4
    80007ffc:	f8b40123          	sb	a1,-126(s0)
    80008000:	0047d593          	srli	a1,a5,0x4
    80008004:	28f67e63          	bgeu	a2,a5,800082a0 <__printf+0x608>
    80008008:	00f6f693          	andi	a3,a3,15
    8000800c:	00dd86b3          	add	a3,s11,a3
    80008010:	0006c503          	lbu	a0,0(a3)
    80008014:	0087d813          	srli	a6,a5,0x8
    80008018:	0087d69b          	srliw	a3,a5,0x8
    8000801c:	f8a401a3          	sb	a0,-125(s0)
    80008020:	28b67663          	bgeu	a2,a1,800082ac <__printf+0x614>
    80008024:	00f6f693          	andi	a3,a3,15
    80008028:	00dd86b3          	add	a3,s11,a3
    8000802c:	0006c583          	lbu	a1,0(a3)
    80008030:	00c7d513          	srli	a0,a5,0xc
    80008034:	00c7d69b          	srliw	a3,a5,0xc
    80008038:	f8b40223          	sb	a1,-124(s0)
    8000803c:	29067a63          	bgeu	a2,a6,800082d0 <__printf+0x638>
    80008040:	00f6f693          	andi	a3,a3,15
    80008044:	00dd86b3          	add	a3,s11,a3
    80008048:	0006c583          	lbu	a1,0(a3)
    8000804c:	0107d813          	srli	a6,a5,0x10
    80008050:	0107d69b          	srliw	a3,a5,0x10
    80008054:	f8b402a3          	sb	a1,-123(s0)
    80008058:	28a67263          	bgeu	a2,a0,800082dc <__printf+0x644>
    8000805c:	00f6f693          	andi	a3,a3,15
    80008060:	00dd86b3          	add	a3,s11,a3
    80008064:	0006c683          	lbu	a3,0(a3)
    80008068:	0147d79b          	srliw	a5,a5,0x14
    8000806c:	f8d40323          	sb	a3,-122(s0)
    80008070:	21067663          	bgeu	a2,a6,8000827c <__printf+0x5e4>
    80008074:	02079793          	slli	a5,a5,0x20
    80008078:	0207d793          	srli	a5,a5,0x20
    8000807c:	00fd8db3          	add	s11,s11,a5
    80008080:	000dc683          	lbu	a3,0(s11)
    80008084:	00800793          	li	a5,8
    80008088:	00700c93          	li	s9,7
    8000808c:	f8d403a3          	sb	a3,-121(s0)
    80008090:	00075c63          	bgez	a4,800080a8 <__printf+0x410>
    80008094:	f9040713          	addi	a4,s0,-112
    80008098:	00f70733          	add	a4,a4,a5
    8000809c:	02d00693          	li	a3,45
    800080a0:	fed70823          	sb	a3,-16(a4)
    800080a4:	00078c93          	mv	s9,a5
    800080a8:	f8040793          	addi	a5,s0,-128
    800080ac:	01978cb3          	add	s9,a5,s9
    800080b0:	f7f40d13          	addi	s10,s0,-129
    800080b4:	000cc503          	lbu	a0,0(s9)
    800080b8:	fffc8c93          	addi	s9,s9,-1
    800080bc:	00000097          	auipc	ra,0x0
    800080c0:	9f8080e7          	jalr	-1544(ra) # 80007ab4 <consputc>
    800080c4:	ff9d18e3          	bne	s10,s9,800080b4 <__printf+0x41c>
    800080c8:	0100006f          	j	800080d8 <__printf+0x440>
    800080cc:	00000097          	auipc	ra,0x0
    800080d0:	9e8080e7          	jalr	-1560(ra) # 80007ab4 <consputc>
    800080d4:	000c8493          	mv	s1,s9
    800080d8:	00094503          	lbu	a0,0(s2)
    800080dc:	c60510e3          	bnez	a0,80007d3c <__printf+0xa4>
    800080e0:	e40c0ee3          	beqz	s8,80007f3c <__printf+0x2a4>
    800080e4:	00006517          	auipc	a0,0x6
    800080e8:	dcc50513          	addi	a0,a0,-564 # 8000deb0 <pr>
    800080ec:	00001097          	auipc	ra,0x1
    800080f0:	94c080e7          	jalr	-1716(ra) # 80008a38 <release>
    800080f4:	e49ff06f          	j	80007f3c <__printf+0x2a4>
    800080f8:	f7843783          	ld	a5,-136(s0)
    800080fc:	03000513          	li	a0,48
    80008100:	01000d13          	li	s10,16
    80008104:	00878713          	addi	a4,a5,8
    80008108:	0007bc83          	ld	s9,0(a5)
    8000810c:	f6e43c23          	sd	a4,-136(s0)
    80008110:	00000097          	auipc	ra,0x0
    80008114:	9a4080e7          	jalr	-1628(ra) # 80007ab4 <consputc>
    80008118:	07800513          	li	a0,120
    8000811c:	00000097          	auipc	ra,0x0
    80008120:	998080e7          	jalr	-1640(ra) # 80007ab4 <consputc>
    80008124:	00002d97          	auipc	s11,0x2
    80008128:	66cd8d93          	addi	s11,s11,1644 # 8000a790 <digits>
    8000812c:	03ccd793          	srli	a5,s9,0x3c
    80008130:	00fd87b3          	add	a5,s11,a5
    80008134:	0007c503          	lbu	a0,0(a5)
    80008138:	fffd0d1b          	addiw	s10,s10,-1
    8000813c:	004c9c93          	slli	s9,s9,0x4
    80008140:	00000097          	auipc	ra,0x0
    80008144:	974080e7          	jalr	-1676(ra) # 80007ab4 <consputc>
    80008148:	fe0d12e3          	bnez	s10,8000812c <__printf+0x494>
    8000814c:	f8dff06f          	j	800080d8 <__printf+0x440>
    80008150:	f7843783          	ld	a5,-136(s0)
    80008154:	0007bc83          	ld	s9,0(a5)
    80008158:	00878793          	addi	a5,a5,8
    8000815c:	f6f43c23          	sd	a5,-136(s0)
    80008160:	000c9a63          	bnez	s9,80008174 <__printf+0x4dc>
    80008164:	1080006f          	j	8000826c <__printf+0x5d4>
    80008168:	001c8c93          	addi	s9,s9,1
    8000816c:	00000097          	auipc	ra,0x0
    80008170:	948080e7          	jalr	-1720(ra) # 80007ab4 <consputc>
    80008174:	000cc503          	lbu	a0,0(s9)
    80008178:	fe0518e3          	bnez	a0,80008168 <__printf+0x4d0>
    8000817c:	f5dff06f          	j	800080d8 <__printf+0x440>
    80008180:	02500513          	li	a0,37
    80008184:	00000097          	auipc	ra,0x0
    80008188:	930080e7          	jalr	-1744(ra) # 80007ab4 <consputc>
    8000818c:	000c8513          	mv	a0,s9
    80008190:	00000097          	auipc	ra,0x0
    80008194:	924080e7          	jalr	-1756(ra) # 80007ab4 <consputc>
    80008198:	f41ff06f          	j	800080d8 <__printf+0x440>
    8000819c:	02500513          	li	a0,37
    800081a0:	00000097          	auipc	ra,0x0
    800081a4:	914080e7          	jalr	-1772(ra) # 80007ab4 <consputc>
    800081a8:	f31ff06f          	j	800080d8 <__printf+0x440>
    800081ac:	00030513          	mv	a0,t1
    800081b0:	00000097          	auipc	ra,0x0
    800081b4:	7bc080e7          	jalr	1980(ra) # 8000896c <acquire>
    800081b8:	b4dff06f          	j	80007d04 <__printf+0x6c>
    800081bc:	40c0053b          	negw	a0,a2
    800081c0:	00a00713          	li	a4,10
    800081c4:	02e576bb          	remuw	a3,a0,a4
    800081c8:	00002d97          	auipc	s11,0x2
    800081cc:	5c8d8d93          	addi	s11,s11,1480 # 8000a790 <digits>
    800081d0:	ff700593          	li	a1,-9
    800081d4:	02069693          	slli	a3,a3,0x20
    800081d8:	0206d693          	srli	a3,a3,0x20
    800081dc:	00dd86b3          	add	a3,s11,a3
    800081e0:	0006c683          	lbu	a3,0(a3)
    800081e4:	02e557bb          	divuw	a5,a0,a4
    800081e8:	f8d40023          	sb	a3,-128(s0)
    800081ec:	10b65e63          	bge	a2,a1,80008308 <__printf+0x670>
    800081f0:	06300593          	li	a1,99
    800081f4:	02e7f6bb          	remuw	a3,a5,a4
    800081f8:	02069693          	slli	a3,a3,0x20
    800081fc:	0206d693          	srli	a3,a3,0x20
    80008200:	00dd86b3          	add	a3,s11,a3
    80008204:	0006c683          	lbu	a3,0(a3)
    80008208:	02e7d73b          	divuw	a4,a5,a4
    8000820c:	00200793          	li	a5,2
    80008210:	f8d400a3          	sb	a3,-127(s0)
    80008214:	bca5ece3          	bltu	a1,a0,80007dec <__printf+0x154>
    80008218:	ce5ff06f          	j	80007efc <__printf+0x264>
    8000821c:	40e007bb          	negw	a5,a4
    80008220:	00002d97          	auipc	s11,0x2
    80008224:	570d8d93          	addi	s11,s11,1392 # 8000a790 <digits>
    80008228:	00f7f693          	andi	a3,a5,15
    8000822c:	00dd86b3          	add	a3,s11,a3
    80008230:	0006c583          	lbu	a1,0(a3)
    80008234:	ff100613          	li	a2,-15
    80008238:	0047d69b          	srliw	a3,a5,0x4
    8000823c:	f8b40023          	sb	a1,-128(s0)
    80008240:	0047d59b          	srliw	a1,a5,0x4
    80008244:	0ac75e63          	bge	a4,a2,80008300 <__printf+0x668>
    80008248:	00f6f693          	andi	a3,a3,15
    8000824c:	00dd86b3          	add	a3,s11,a3
    80008250:	0006c603          	lbu	a2,0(a3)
    80008254:	00f00693          	li	a3,15
    80008258:	0087d79b          	srliw	a5,a5,0x8
    8000825c:	f8c400a3          	sb	a2,-127(s0)
    80008260:	d8b6e4e3          	bltu	a3,a1,80007fe8 <__printf+0x350>
    80008264:	00200793          	li	a5,2
    80008268:	e2dff06f          	j	80008094 <__printf+0x3fc>
    8000826c:	00002c97          	auipc	s9,0x2
    80008270:	504c8c93          	addi	s9,s9,1284 # 8000a770 <CONSOLE_STATUS+0x760>
    80008274:	02800513          	li	a0,40
    80008278:	ef1ff06f          	j	80008168 <__printf+0x4d0>
    8000827c:	00700793          	li	a5,7
    80008280:	00600c93          	li	s9,6
    80008284:	e0dff06f          	j	80008090 <__printf+0x3f8>
    80008288:	00700793          	li	a5,7
    8000828c:	00600c93          	li	s9,6
    80008290:	c69ff06f          	j	80007ef8 <__printf+0x260>
    80008294:	00300793          	li	a5,3
    80008298:	00200c93          	li	s9,2
    8000829c:	c5dff06f          	j	80007ef8 <__printf+0x260>
    800082a0:	00300793          	li	a5,3
    800082a4:	00200c93          	li	s9,2
    800082a8:	de9ff06f          	j	80008090 <__printf+0x3f8>
    800082ac:	00400793          	li	a5,4
    800082b0:	00300c93          	li	s9,3
    800082b4:	dddff06f          	j	80008090 <__printf+0x3f8>
    800082b8:	00400793          	li	a5,4
    800082bc:	00300c93          	li	s9,3
    800082c0:	c39ff06f          	j	80007ef8 <__printf+0x260>
    800082c4:	00500793          	li	a5,5
    800082c8:	00400c93          	li	s9,4
    800082cc:	c2dff06f          	j	80007ef8 <__printf+0x260>
    800082d0:	00500793          	li	a5,5
    800082d4:	00400c93          	li	s9,4
    800082d8:	db9ff06f          	j	80008090 <__printf+0x3f8>
    800082dc:	00600793          	li	a5,6
    800082e0:	00500c93          	li	s9,5
    800082e4:	dadff06f          	j	80008090 <__printf+0x3f8>
    800082e8:	00600793          	li	a5,6
    800082ec:	00500c93          	li	s9,5
    800082f0:	c09ff06f          	j	80007ef8 <__printf+0x260>
    800082f4:	00800793          	li	a5,8
    800082f8:	00700c93          	li	s9,7
    800082fc:	bfdff06f          	j	80007ef8 <__printf+0x260>
    80008300:	00100793          	li	a5,1
    80008304:	d91ff06f          	j	80008094 <__printf+0x3fc>
    80008308:	00100793          	li	a5,1
    8000830c:	bf1ff06f          	j	80007efc <__printf+0x264>
    80008310:	00900793          	li	a5,9
    80008314:	00800c93          	li	s9,8
    80008318:	be1ff06f          	j	80007ef8 <__printf+0x260>
    8000831c:	00002517          	auipc	a0,0x2
    80008320:	45c50513          	addi	a0,a0,1116 # 8000a778 <CONSOLE_STATUS+0x768>
    80008324:	00000097          	auipc	ra,0x0
    80008328:	918080e7          	jalr	-1768(ra) # 80007c3c <panic>

000000008000832c <printfinit>:
    8000832c:	fe010113          	addi	sp,sp,-32
    80008330:	00813823          	sd	s0,16(sp)
    80008334:	00913423          	sd	s1,8(sp)
    80008338:	00113c23          	sd	ra,24(sp)
    8000833c:	02010413          	addi	s0,sp,32
    80008340:	00006497          	auipc	s1,0x6
    80008344:	b7048493          	addi	s1,s1,-1168 # 8000deb0 <pr>
    80008348:	00048513          	mv	a0,s1
    8000834c:	00002597          	auipc	a1,0x2
    80008350:	43c58593          	addi	a1,a1,1084 # 8000a788 <CONSOLE_STATUS+0x778>
    80008354:	00000097          	auipc	ra,0x0
    80008358:	5f4080e7          	jalr	1524(ra) # 80008948 <initlock>
    8000835c:	01813083          	ld	ra,24(sp)
    80008360:	01013403          	ld	s0,16(sp)
    80008364:	0004ac23          	sw	zero,24(s1)
    80008368:	00813483          	ld	s1,8(sp)
    8000836c:	02010113          	addi	sp,sp,32
    80008370:	00008067          	ret

0000000080008374 <uartinit>:
    80008374:	ff010113          	addi	sp,sp,-16
    80008378:	00813423          	sd	s0,8(sp)
    8000837c:	01010413          	addi	s0,sp,16
    80008380:	100007b7          	lui	a5,0x10000
    80008384:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008388:	f8000713          	li	a4,-128
    8000838c:	00e781a3          	sb	a4,3(a5)
    80008390:	00300713          	li	a4,3
    80008394:	00e78023          	sb	a4,0(a5)
    80008398:	000780a3          	sb	zero,1(a5)
    8000839c:	00e781a3          	sb	a4,3(a5)
    800083a0:	00700693          	li	a3,7
    800083a4:	00d78123          	sb	a3,2(a5)
    800083a8:	00e780a3          	sb	a4,1(a5)
    800083ac:	00813403          	ld	s0,8(sp)
    800083b0:	01010113          	addi	sp,sp,16
    800083b4:	00008067          	ret

00000000800083b8 <uartputc>:
    800083b8:	00004797          	auipc	a5,0x4
    800083bc:	7e07a783          	lw	a5,2016(a5) # 8000cb98 <panicked>
    800083c0:	00078463          	beqz	a5,800083c8 <uartputc+0x10>
    800083c4:	0000006f          	j	800083c4 <uartputc+0xc>
    800083c8:	fd010113          	addi	sp,sp,-48
    800083cc:	02813023          	sd	s0,32(sp)
    800083d0:	00913c23          	sd	s1,24(sp)
    800083d4:	01213823          	sd	s2,16(sp)
    800083d8:	01313423          	sd	s3,8(sp)
    800083dc:	02113423          	sd	ra,40(sp)
    800083e0:	03010413          	addi	s0,sp,48
    800083e4:	00004917          	auipc	s2,0x4
    800083e8:	7bc90913          	addi	s2,s2,1980 # 8000cba0 <uart_tx_r>
    800083ec:	00093783          	ld	a5,0(s2)
    800083f0:	00004497          	auipc	s1,0x4
    800083f4:	7b848493          	addi	s1,s1,1976 # 8000cba8 <uart_tx_w>
    800083f8:	0004b703          	ld	a4,0(s1)
    800083fc:	02078693          	addi	a3,a5,32
    80008400:	00050993          	mv	s3,a0
    80008404:	02e69c63          	bne	a3,a4,8000843c <uartputc+0x84>
    80008408:	00001097          	auipc	ra,0x1
    8000840c:	834080e7          	jalr	-1996(ra) # 80008c3c <push_on>
    80008410:	00093783          	ld	a5,0(s2)
    80008414:	0004b703          	ld	a4,0(s1)
    80008418:	02078793          	addi	a5,a5,32
    8000841c:	00e79463          	bne	a5,a4,80008424 <uartputc+0x6c>
    80008420:	0000006f          	j	80008420 <uartputc+0x68>
    80008424:	00001097          	auipc	ra,0x1
    80008428:	88c080e7          	jalr	-1908(ra) # 80008cb0 <pop_on>
    8000842c:	00093783          	ld	a5,0(s2)
    80008430:	0004b703          	ld	a4,0(s1)
    80008434:	02078693          	addi	a3,a5,32
    80008438:	fce688e3          	beq	a3,a4,80008408 <uartputc+0x50>
    8000843c:	01f77693          	andi	a3,a4,31
    80008440:	00006597          	auipc	a1,0x6
    80008444:	a9058593          	addi	a1,a1,-1392 # 8000ded0 <uart_tx_buf>
    80008448:	00d586b3          	add	a3,a1,a3
    8000844c:	00170713          	addi	a4,a4,1
    80008450:	01368023          	sb	s3,0(a3)
    80008454:	00e4b023          	sd	a4,0(s1)
    80008458:	10000637          	lui	a2,0x10000
    8000845c:	02f71063          	bne	a4,a5,8000847c <uartputc+0xc4>
    80008460:	0340006f          	j	80008494 <uartputc+0xdc>
    80008464:	00074703          	lbu	a4,0(a4)
    80008468:	00f93023          	sd	a5,0(s2)
    8000846c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008470:	00093783          	ld	a5,0(s2)
    80008474:	0004b703          	ld	a4,0(s1)
    80008478:	00f70e63          	beq	a4,a5,80008494 <uartputc+0xdc>
    8000847c:	00564683          	lbu	a3,5(a2)
    80008480:	01f7f713          	andi	a4,a5,31
    80008484:	00e58733          	add	a4,a1,a4
    80008488:	0206f693          	andi	a3,a3,32
    8000848c:	00178793          	addi	a5,a5,1
    80008490:	fc069ae3          	bnez	a3,80008464 <uartputc+0xac>
    80008494:	02813083          	ld	ra,40(sp)
    80008498:	02013403          	ld	s0,32(sp)
    8000849c:	01813483          	ld	s1,24(sp)
    800084a0:	01013903          	ld	s2,16(sp)
    800084a4:	00813983          	ld	s3,8(sp)
    800084a8:	03010113          	addi	sp,sp,48
    800084ac:	00008067          	ret

00000000800084b0 <uartputc_sync>:
    800084b0:	ff010113          	addi	sp,sp,-16
    800084b4:	00813423          	sd	s0,8(sp)
    800084b8:	01010413          	addi	s0,sp,16
    800084bc:	00004717          	auipc	a4,0x4
    800084c0:	6dc72703          	lw	a4,1756(a4) # 8000cb98 <panicked>
    800084c4:	02071663          	bnez	a4,800084f0 <uartputc_sync+0x40>
    800084c8:	00050793          	mv	a5,a0
    800084cc:	100006b7          	lui	a3,0x10000
    800084d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800084d4:	02077713          	andi	a4,a4,32
    800084d8:	fe070ce3          	beqz	a4,800084d0 <uartputc_sync+0x20>
    800084dc:	0ff7f793          	andi	a5,a5,255
    800084e0:	00f68023          	sb	a5,0(a3)
    800084e4:	00813403          	ld	s0,8(sp)
    800084e8:	01010113          	addi	sp,sp,16
    800084ec:	00008067          	ret
    800084f0:	0000006f          	j	800084f0 <uartputc_sync+0x40>

00000000800084f4 <uartstart>:
    800084f4:	ff010113          	addi	sp,sp,-16
    800084f8:	00813423          	sd	s0,8(sp)
    800084fc:	01010413          	addi	s0,sp,16
    80008500:	00004617          	auipc	a2,0x4
    80008504:	6a060613          	addi	a2,a2,1696 # 8000cba0 <uart_tx_r>
    80008508:	00004517          	auipc	a0,0x4
    8000850c:	6a050513          	addi	a0,a0,1696 # 8000cba8 <uart_tx_w>
    80008510:	00063783          	ld	a5,0(a2)
    80008514:	00053703          	ld	a4,0(a0)
    80008518:	04f70263          	beq	a4,a5,8000855c <uartstart+0x68>
    8000851c:	100005b7          	lui	a1,0x10000
    80008520:	00006817          	auipc	a6,0x6
    80008524:	9b080813          	addi	a6,a6,-1616 # 8000ded0 <uart_tx_buf>
    80008528:	01c0006f          	j	80008544 <uartstart+0x50>
    8000852c:	0006c703          	lbu	a4,0(a3)
    80008530:	00f63023          	sd	a5,0(a2)
    80008534:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008538:	00063783          	ld	a5,0(a2)
    8000853c:	00053703          	ld	a4,0(a0)
    80008540:	00f70e63          	beq	a4,a5,8000855c <uartstart+0x68>
    80008544:	01f7f713          	andi	a4,a5,31
    80008548:	00e806b3          	add	a3,a6,a4
    8000854c:	0055c703          	lbu	a4,5(a1)
    80008550:	00178793          	addi	a5,a5,1
    80008554:	02077713          	andi	a4,a4,32
    80008558:	fc071ae3          	bnez	a4,8000852c <uartstart+0x38>
    8000855c:	00813403          	ld	s0,8(sp)
    80008560:	01010113          	addi	sp,sp,16
    80008564:	00008067          	ret

0000000080008568 <uartgetc>:
    80008568:	ff010113          	addi	sp,sp,-16
    8000856c:	00813423          	sd	s0,8(sp)
    80008570:	01010413          	addi	s0,sp,16
    80008574:	10000737          	lui	a4,0x10000
    80008578:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000857c:	0017f793          	andi	a5,a5,1
    80008580:	00078c63          	beqz	a5,80008598 <uartgetc+0x30>
    80008584:	00074503          	lbu	a0,0(a4)
    80008588:	0ff57513          	andi	a0,a0,255
    8000858c:	00813403          	ld	s0,8(sp)
    80008590:	01010113          	addi	sp,sp,16
    80008594:	00008067          	ret
    80008598:	fff00513          	li	a0,-1
    8000859c:	ff1ff06f          	j	8000858c <uartgetc+0x24>

00000000800085a0 <uartintr>:
    800085a0:	100007b7          	lui	a5,0x10000
    800085a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800085a8:	0017f793          	andi	a5,a5,1
    800085ac:	0a078463          	beqz	a5,80008654 <uartintr+0xb4>
    800085b0:	fe010113          	addi	sp,sp,-32
    800085b4:	00813823          	sd	s0,16(sp)
    800085b8:	00913423          	sd	s1,8(sp)
    800085bc:	00113c23          	sd	ra,24(sp)
    800085c0:	02010413          	addi	s0,sp,32
    800085c4:	100004b7          	lui	s1,0x10000
    800085c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800085cc:	0ff57513          	andi	a0,a0,255
    800085d0:	fffff097          	auipc	ra,0xfffff
    800085d4:	534080e7          	jalr	1332(ra) # 80007b04 <consoleintr>
    800085d8:	0054c783          	lbu	a5,5(s1)
    800085dc:	0017f793          	andi	a5,a5,1
    800085e0:	fe0794e3          	bnez	a5,800085c8 <uartintr+0x28>
    800085e4:	00004617          	auipc	a2,0x4
    800085e8:	5bc60613          	addi	a2,a2,1468 # 8000cba0 <uart_tx_r>
    800085ec:	00004517          	auipc	a0,0x4
    800085f0:	5bc50513          	addi	a0,a0,1468 # 8000cba8 <uart_tx_w>
    800085f4:	00063783          	ld	a5,0(a2)
    800085f8:	00053703          	ld	a4,0(a0)
    800085fc:	04f70263          	beq	a4,a5,80008640 <uartintr+0xa0>
    80008600:	100005b7          	lui	a1,0x10000
    80008604:	00006817          	auipc	a6,0x6
    80008608:	8cc80813          	addi	a6,a6,-1844 # 8000ded0 <uart_tx_buf>
    8000860c:	01c0006f          	j	80008628 <uartintr+0x88>
    80008610:	0006c703          	lbu	a4,0(a3)
    80008614:	00f63023          	sd	a5,0(a2)
    80008618:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000861c:	00063783          	ld	a5,0(a2)
    80008620:	00053703          	ld	a4,0(a0)
    80008624:	00f70e63          	beq	a4,a5,80008640 <uartintr+0xa0>
    80008628:	01f7f713          	andi	a4,a5,31
    8000862c:	00e806b3          	add	a3,a6,a4
    80008630:	0055c703          	lbu	a4,5(a1)
    80008634:	00178793          	addi	a5,a5,1
    80008638:	02077713          	andi	a4,a4,32
    8000863c:	fc071ae3          	bnez	a4,80008610 <uartintr+0x70>
    80008640:	01813083          	ld	ra,24(sp)
    80008644:	01013403          	ld	s0,16(sp)
    80008648:	00813483          	ld	s1,8(sp)
    8000864c:	02010113          	addi	sp,sp,32
    80008650:	00008067          	ret
    80008654:	00004617          	auipc	a2,0x4
    80008658:	54c60613          	addi	a2,a2,1356 # 8000cba0 <uart_tx_r>
    8000865c:	00004517          	auipc	a0,0x4
    80008660:	54c50513          	addi	a0,a0,1356 # 8000cba8 <uart_tx_w>
    80008664:	00063783          	ld	a5,0(a2)
    80008668:	00053703          	ld	a4,0(a0)
    8000866c:	04f70263          	beq	a4,a5,800086b0 <uartintr+0x110>
    80008670:	100005b7          	lui	a1,0x10000
    80008674:	00006817          	auipc	a6,0x6
    80008678:	85c80813          	addi	a6,a6,-1956 # 8000ded0 <uart_tx_buf>
    8000867c:	01c0006f          	j	80008698 <uartintr+0xf8>
    80008680:	0006c703          	lbu	a4,0(a3)
    80008684:	00f63023          	sd	a5,0(a2)
    80008688:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000868c:	00063783          	ld	a5,0(a2)
    80008690:	00053703          	ld	a4,0(a0)
    80008694:	02f70063          	beq	a4,a5,800086b4 <uartintr+0x114>
    80008698:	01f7f713          	andi	a4,a5,31
    8000869c:	00e806b3          	add	a3,a6,a4
    800086a0:	0055c703          	lbu	a4,5(a1)
    800086a4:	00178793          	addi	a5,a5,1
    800086a8:	02077713          	andi	a4,a4,32
    800086ac:	fc071ae3          	bnez	a4,80008680 <uartintr+0xe0>
    800086b0:	00008067          	ret
    800086b4:	00008067          	ret

00000000800086b8 <kinit>:
    800086b8:	fc010113          	addi	sp,sp,-64
    800086bc:	02913423          	sd	s1,40(sp)
    800086c0:	fffff7b7          	lui	a5,0xfffff
    800086c4:	00007497          	auipc	s1,0x7
    800086c8:	82b48493          	addi	s1,s1,-2005 # 8000eeef <end+0xfff>
    800086cc:	02813823          	sd	s0,48(sp)
    800086d0:	01313c23          	sd	s3,24(sp)
    800086d4:	00f4f4b3          	and	s1,s1,a5
    800086d8:	02113c23          	sd	ra,56(sp)
    800086dc:	03213023          	sd	s2,32(sp)
    800086e0:	01413823          	sd	s4,16(sp)
    800086e4:	01513423          	sd	s5,8(sp)
    800086e8:	04010413          	addi	s0,sp,64
    800086ec:	000017b7          	lui	a5,0x1
    800086f0:	01100993          	li	s3,17
    800086f4:	00f487b3          	add	a5,s1,a5
    800086f8:	01b99993          	slli	s3,s3,0x1b
    800086fc:	06f9e063          	bltu	s3,a5,8000875c <kinit+0xa4>
    80008700:	00005a97          	auipc	s5,0x5
    80008704:	7f0a8a93          	addi	s5,s5,2032 # 8000def0 <end>
    80008708:	0754ec63          	bltu	s1,s5,80008780 <kinit+0xc8>
    8000870c:	0734fa63          	bgeu	s1,s3,80008780 <kinit+0xc8>
    80008710:	00088a37          	lui	s4,0x88
    80008714:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008718:	00004917          	auipc	s2,0x4
    8000871c:	49890913          	addi	s2,s2,1176 # 8000cbb0 <kmem>
    80008720:	00ca1a13          	slli	s4,s4,0xc
    80008724:	0140006f          	j	80008738 <kinit+0x80>
    80008728:	000017b7          	lui	a5,0x1
    8000872c:	00f484b3          	add	s1,s1,a5
    80008730:	0554e863          	bltu	s1,s5,80008780 <kinit+0xc8>
    80008734:	0534f663          	bgeu	s1,s3,80008780 <kinit+0xc8>
    80008738:	00001637          	lui	a2,0x1
    8000873c:	00100593          	li	a1,1
    80008740:	00048513          	mv	a0,s1
    80008744:	00000097          	auipc	ra,0x0
    80008748:	5e4080e7          	jalr	1508(ra) # 80008d28 <__memset>
    8000874c:	00093783          	ld	a5,0(s2)
    80008750:	00f4b023          	sd	a5,0(s1)
    80008754:	00993023          	sd	s1,0(s2)
    80008758:	fd4498e3          	bne	s1,s4,80008728 <kinit+0x70>
    8000875c:	03813083          	ld	ra,56(sp)
    80008760:	03013403          	ld	s0,48(sp)
    80008764:	02813483          	ld	s1,40(sp)
    80008768:	02013903          	ld	s2,32(sp)
    8000876c:	01813983          	ld	s3,24(sp)
    80008770:	01013a03          	ld	s4,16(sp)
    80008774:	00813a83          	ld	s5,8(sp)
    80008778:	04010113          	addi	sp,sp,64
    8000877c:	00008067          	ret
    80008780:	00002517          	auipc	a0,0x2
    80008784:	02850513          	addi	a0,a0,40 # 8000a7a8 <digits+0x18>
    80008788:	fffff097          	auipc	ra,0xfffff
    8000878c:	4b4080e7          	jalr	1204(ra) # 80007c3c <panic>

0000000080008790 <freerange>:
    80008790:	fc010113          	addi	sp,sp,-64
    80008794:	000017b7          	lui	a5,0x1
    80008798:	02913423          	sd	s1,40(sp)
    8000879c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800087a0:	009504b3          	add	s1,a0,s1
    800087a4:	fffff537          	lui	a0,0xfffff
    800087a8:	02813823          	sd	s0,48(sp)
    800087ac:	02113c23          	sd	ra,56(sp)
    800087b0:	03213023          	sd	s2,32(sp)
    800087b4:	01313c23          	sd	s3,24(sp)
    800087b8:	01413823          	sd	s4,16(sp)
    800087bc:	01513423          	sd	s5,8(sp)
    800087c0:	01613023          	sd	s6,0(sp)
    800087c4:	04010413          	addi	s0,sp,64
    800087c8:	00a4f4b3          	and	s1,s1,a0
    800087cc:	00f487b3          	add	a5,s1,a5
    800087d0:	06f5e463          	bltu	a1,a5,80008838 <freerange+0xa8>
    800087d4:	00005a97          	auipc	s5,0x5
    800087d8:	71ca8a93          	addi	s5,s5,1820 # 8000def0 <end>
    800087dc:	0954e263          	bltu	s1,s5,80008860 <freerange+0xd0>
    800087e0:	01100993          	li	s3,17
    800087e4:	01b99993          	slli	s3,s3,0x1b
    800087e8:	0734fc63          	bgeu	s1,s3,80008860 <freerange+0xd0>
    800087ec:	00058a13          	mv	s4,a1
    800087f0:	00004917          	auipc	s2,0x4
    800087f4:	3c090913          	addi	s2,s2,960 # 8000cbb0 <kmem>
    800087f8:	00002b37          	lui	s6,0x2
    800087fc:	0140006f          	j	80008810 <freerange+0x80>
    80008800:	000017b7          	lui	a5,0x1
    80008804:	00f484b3          	add	s1,s1,a5
    80008808:	0554ec63          	bltu	s1,s5,80008860 <freerange+0xd0>
    8000880c:	0534fa63          	bgeu	s1,s3,80008860 <freerange+0xd0>
    80008810:	00001637          	lui	a2,0x1
    80008814:	00100593          	li	a1,1
    80008818:	00048513          	mv	a0,s1
    8000881c:	00000097          	auipc	ra,0x0
    80008820:	50c080e7          	jalr	1292(ra) # 80008d28 <__memset>
    80008824:	00093703          	ld	a4,0(s2)
    80008828:	016487b3          	add	a5,s1,s6
    8000882c:	00e4b023          	sd	a4,0(s1)
    80008830:	00993023          	sd	s1,0(s2)
    80008834:	fcfa76e3          	bgeu	s4,a5,80008800 <freerange+0x70>
    80008838:	03813083          	ld	ra,56(sp)
    8000883c:	03013403          	ld	s0,48(sp)
    80008840:	02813483          	ld	s1,40(sp)
    80008844:	02013903          	ld	s2,32(sp)
    80008848:	01813983          	ld	s3,24(sp)
    8000884c:	01013a03          	ld	s4,16(sp)
    80008850:	00813a83          	ld	s5,8(sp)
    80008854:	00013b03          	ld	s6,0(sp)
    80008858:	04010113          	addi	sp,sp,64
    8000885c:	00008067          	ret
    80008860:	00002517          	auipc	a0,0x2
    80008864:	f4850513          	addi	a0,a0,-184 # 8000a7a8 <digits+0x18>
    80008868:	fffff097          	auipc	ra,0xfffff
    8000886c:	3d4080e7          	jalr	980(ra) # 80007c3c <panic>

0000000080008870 <kfree>:
    80008870:	fe010113          	addi	sp,sp,-32
    80008874:	00813823          	sd	s0,16(sp)
    80008878:	00113c23          	sd	ra,24(sp)
    8000887c:	00913423          	sd	s1,8(sp)
    80008880:	02010413          	addi	s0,sp,32
    80008884:	03451793          	slli	a5,a0,0x34
    80008888:	04079c63          	bnez	a5,800088e0 <kfree+0x70>
    8000888c:	00005797          	auipc	a5,0x5
    80008890:	66478793          	addi	a5,a5,1636 # 8000def0 <end>
    80008894:	00050493          	mv	s1,a0
    80008898:	04f56463          	bltu	a0,a5,800088e0 <kfree+0x70>
    8000889c:	01100793          	li	a5,17
    800088a0:	01b79793          	slli	a5,a5,0x1b
    800088a4:	02f57e63          	bgeu	a0,a5,800088e0 <kfree+0x70>
    800088a8:	00001637          	lui	a2,0x1
    800088ac:	00100593          	li	a1,1
    800088b0:	00000097          	auipc	ra,0x0
    800088b4:	478080e7          	jalr	1144(ra) # 80008d28 <__memset>
    800088b8:	00004797          	auipc	a5,0x4
    800088bc:	2f878793          	addi	a5,a5,760 # 8000cbb0 <kmem>
    800088c0:	0007b703          	ld	a4,0(a5)
    800088c4:	01813083          	ld	ra,24(sp)
    800088c8:	01013403          	ld	s0,16(sp)
    800088cc:	00e4b023          	sd	a4,0(s1)
    800088d0:	0097b023          	sd	s1,0(a5)
    800088d4:	00813483          	ld	s1,8(sp)
    800088d8:	02010113          	addi	sp,sp,32
    800088dc:	00008067          	ret
    800088e0:	00002517          	auipc	a0,0x2
    800088e4:	ec850513          	addi	a0,a0,-312 # 8000a7a8 <digits+0x18>
    800088e8:	fffff097          	auipc	ra,0xfffff
    800088ec:	354080e7          	jalr	852(ra) # 80007c3c <panic>

00000000800088f0 <kalloc>:
    800088f0:	fe010113          	addi	sp,sp,-32
    800088f4:	00813823          	sd	s0,16(sp)
    800088f8:	00913423          	sd	s1,8(sp)
    800088fc:	00113c23          	sd	ra,24(sp)
    80008900:	02010413          	addi	s0,sp,32
    80008904:	00004797          	auipc	a5,0x4
    80008908:	2ac78793          	addi	a5,a5,684 # 8000cbb0 <kmem>
    8000890c:	0007b483          	ld	s1,0(a5)
    80008910:	02048063          	beqz	s1,80008930 <kalloc+0x40>
    80008914:	0004b703          	ld	a4,0(s1)
    80008918:	00001637          	lui	a2,0x1
    8000891c:	00500593          	li	a1,5
    80008920:	00048513          	mv	a0,s1
    80008924:	00e7b023          	sd	a4,0(a5)
    80008928:	00000097          	auipc	ra,0x0
    8000892c:	400080e7          	jalr	1024(ra) # 80008d28 <__memset>
    80008930:	01813083          	ld	ra,24(sp)
    80008934:	01013403          	ld	s0,16(sp)
    80008938:	00048513          	mv	a0,s1
    8000893c:	00813483          	ld	s1,8(sp)
    80008940:	02010113          	addi	sp,sp,32
    80008944:	00008067          	ret

0000000080008948 <initlock>:
    80008948:	ff010113          	addi	sp,sp,-16
    8000894c:	00813423          	sd	s0,8(sp)
    80008950:	01010413          	addi	s0,sp,16
    80008954:	00813403          	ld	s0,8(sp)
    80008958:	00b53423          	sd	a1,8(a0)
    8000895c:	00052023          	sw	zero,0(a0)
    80008960:	00053823          	sd	zero,16(a0)
    80008964:	01010113          	addi	sp,sp,16
    80008968:	00008067          	ret

000000008000896c <acquire>:
    8000896c:	fe010113          	addi	sp,sp,-32
    80008970:	00813823          	sd	s0,16(sp)
    80008974:	00913423          	sd	s1,8(sp)
    80008978:	00113c23          	sd	ra,24(sp)
    8000897c:	01213023          	sd	s2,0(sp)
    80008980:	02010413          	addi	s0,sp,32
    80008984:	00050493          	mv	s1,a0
    80008988:	10002973          	csrr	s2,sstatus
    8000898c:	100027f3          	csrr	a5,sstatus
    80008990:	ffd7f793          	andi	a5,a5,-3
    80008994:	10079073          	csrw	sstatus,a5
    80008998:	fffff097          	auipc	ra,0xfffff
    8000899c:	8ec080e7          	jalr	-1812(ra) # 80007284 <mycpu>
    800089a0:	07852783          	lw	a5,120(a0)
    800089a4:	06078e63          	beqz	a5,80008a20 <acquire+0xb4>
    800089a8:	fffff097          	auipc	ra,0xfffff
    800089ac:	8dc080e7          	jalr	-1828(ra) # 80007284 <mycpu>
    800089b0:	07852783          	lw	a5,120(a0)
    800089b4:	0004a703          	lw	a4,0(s1)
    800089b8:	0017879b          	addiw	a5,a5,1
    800089bc:	06f52c23          	sw	a5,120(a0)
    800089c0:	04071063          	bnez	a4,80008a00 <acquire+0x94>
    800089c4:	00100713          	li	a4,1
    800089c8:	00070793          	mv	a5,a4
    800089cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800089d0:	0007879b          	sext.w	a5,a5
    800089d4:	fe079ae3          	bnez	a5,800089c8 <acquire+0x5c>
    800089d8:	0ff0000f          	fence
    800089dc:	fffff097          	auipc	ra,0xfffff
    800089e0:	8a8080e7          	jalr	-1880(ra) # 80007284 <mycpu>
    800089e4:	01813083          	ld	ra,24(sp)
    800089e8:	01013403          	ld	s0,16(sp)
    800089ec:	00a4b823          	sd	a0,16(s1)
    800089f0:	00013903          	ld	s2,0(sp)
    800089f4:	00813483          	ld	s1,8(sp)
    800089f8:	02010113          	addi	sp,sp,32
    800089fc:	00008067          	ret
    80008a00:	0104b903          	ld	s2,16(s1)
    80008a04:	fffff097          	auipc	ra,0xfffff
    80008a08:	880080e7          	jalr	-1920(ra) # 80007284 <mycpu>
    80008a0c:	faa91ce3          	bne	s2,a0,800089c4 <acquire+0x58>
    80008a10:	00002517          	auipc	a0,0x2
    80008a14:	da050513          	addi	a0,a0,-608 # 8000a7b0 <digits+0x20>
    80008a18:	fffff097          	auipc	ra,0xfffff
    80008a1c:	224080e7          	jalr	548(ra) # 80007c3c <panic>
    80008a20:	00195913          	srli	s2,s2,0x1
    80008a24:	fffff097          	auipc	ra,0xfffff
    80008a28:	860080e7          	jalr	-1952(ra) # 80007284 <mycpu>
    80008a2c:	00197913          	andi	s2,s2,1
    80008a30:	07252e23          	sw	s2,124(a0)
    80008a34:	f75ff06f          	j	800089a8 <acquire+0x3c>

0000000080008a38 <release>:
    80008a38:	fe010113          	addi	sp,sp,-32
    80008a3c:	00813823          	sd	s0,16(sp)
    80008a40:	00113c23          	sd	ra,24(sp)
    80008a44:	00913423          	sd	s1,8(sp)
    80008a48:	01213023          	sd	s2,0(sp)
    80008a4c:	02010413          	addi	s0,sp,32
    80008a50:	00052783          	lw	a5,0(a0)
    80008a54:	00079a63          	bnez	a5,80008a68 <release+0x30>
    80008a58:	00002517          	auipc	a0,0x2
    80008a5c:	d6050513          	addi	a0,a0,-672 # 8000a7b8 <digits+0x28>
    80008a60:	fffff097          	auipc	ra,0xfffff
    80008a64:	1dc080e7          	jalr	476(ra) # 80007c3c <panic>
    80008a68:	01053903          	ld	s2,16(a0)
    80008a6c:	00050493          	mv	s1,a0
    80008a70:	fffff097          	auipc	ra,0xfffff
    80008a74:	814080e7          	jalr	-2028(ra) # 80007284 <mycpu>
    80008a78:	fea910e3          	bne	s2,a0,80008a58 <release+0x20>
    80008a7c:	0004b823          	sd	zero,16(s1)
    80008a80:	0ff0000f          	fence
    80008a84:	0f50000f          	fence	iorw,ow
    80008a88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008a8c:	ffffe097          	auipc	ra,0xffffe
    80008a90:	7f8080e7          	jalr	2040(ra) # 80007284 <mycpu>
    80008a94:	100027f3          	csrr	a5,sstatus
    80008a98:	0027f793          	andi	a5,a5,2
    80008a9c:	04079a63          	bnez	a5,80008af0 <release+0xb8>
    80008aa0:	07852783          	lw	a5,120(a0)
    80008aa4:	02f05e63          	blez	a5,80008ae0 <release+0xa8>
    80008aa8:	fff7871b          	addiw	a4,a5,-1
    80008aac:	06e52c23          	sw	a4,120(a0)
    80008ab0:	00071c63          	bnez	a4,80008ac8 <release+0x90>
    80008ab4:	07c52783          	lw	a5,124(a0)
    80008ab8:	00078863          	beqz	a5,80008ac8 <release+0x90>
    80008abc:	100027f3          	csrr	a5,sstatus
    80008ac0:	0027e793          	ori	a5,a5,2
    80008ac4:	10079073          	csrw	sstatus,a5
    80008ac8:	01813083          	ld	ra,24(sp)
    80008acc:	01013403          	ld	s0,16(sp)
    80008ad0:	00813483          	ld	s1,8(sp)
    80008ad4:	00013903          	ld	s2,0(sp)
    80008ad8:	02010113          	addi	sp,sp,32
    80008adc:	00008067          	ret
    80008ae0:	00002517          	auipc	a0,0x2
    80008ae4:	cf850513          	addi	a0,a0,-776 # 8000a7d8 <digits+0x48>
    80008ae8:	fffff097          	auipc	ra,0xfffff
    80008aec:	154080e7          	jalr	340(ra) # 80007c3c <panic>
    80008af0:	00002517          	auipc	a0,0x2
    80008af4:	cd050513          	addi	a0,a0,-816 # 8000a7c0 <digits+0x30>
    80008af8:	fffff097          	auipc	ra,0xfffff
    80008afc:	144080e7          	jalr	324(ra) # 80007c3c <panic>

0000000080008b00 <holding>:
    80008b00:	00052783          	lw	a5,0(a0)
    80008b04:	00079663          	bnez	a5,80008b10 <holding+0x10>
    80008b08:	00000513          	li	a0,0
    80008b0c:	00008067          	ret
    80008b10:	fe010113          	addi	sp,sp,-32
    80008b14:	00813823          	sd	s0,16(sp)
    80008b18:	00913423          	sd	s1,8(sp)
    80008b1c:	00113c23          	sd	ra,24(sp)
    80008b20:	02010413          	addi	s0,sp,32
    80008b24:	01053483          	ld	s1,16(a0)
    80008b28:	ffffe097          	auipc	ra,0xffffe
    80008b2c:	75c080e7          	jalr	1884(ra) # 80007284 <mycpu>
    80008b30:	01813083          	ld	ra,24(sp)
    80008b34:	01013403          	ld	s0,16(sp)
    80008b38:	40a48533          	sub	a0,s1,a0
    80008b3c:	00153513          	seqz	a0,a0
    80008b40:	00813483          	ld	s1,8(sp)
    80008b44:	02010113          	addi	sp,sp,32
    80008b48:	00008067          	ret

0000000080008b4c <push_off>:
    80008b4c:	fe010113          	addi	sp,sp,-32
    80008b50:	00813823          	sd	s0,16(sp)
    80008b54:	00113c23          	sd	ra,24(sp)
    80008b58:	00913423          	sd	s1,8(sp)
    80008b5c:	02010413          	addi	s0,sp,32
    80008b60:	100024f3          	csrr	s1,sstatus
    80008b64:	100027f3          	csrr	a5,sstatus
    80008b68:	ffd7f793          	andi	a5,a5,-3
    80008b6c:	10079073          	csrw	sstatus,a5
    80008b70:	ffffe097          	auipc	ra,0xffffe
    80008b74:	714080e7          	jalr	1812(ra) # 80007284 <mycpu>
    80008b78:	07852783          	lw	a5,120(a0)
    80008b7c:	02078663          	beqz	a5,80008ba8 <push_off+0x5c>
    80008b80:	ffffe097          	auipc	ra,0xffffe
    80008b84:	704080e7          	jalr	1796(ra) # 80007284 <mycpu>
    80008b88:	07852783          	lw	a5,120(a0)
    80008b8c:	01813083          	ld	ra,24(sp)
    80008b90:	01013403          	ld	s0,16(sp)
    80008b94:	0017879b          	addiw	a5,a5,1
    80008b98:	06f52c23          	sw	a5,120(a0)
    80008b9c:	00813483          	ld	s1,8(sp)
    80008ba0:	02010113          	addi	sp,sp,32
    80008ba4:	00008067          	ret
    80008ba8:	0014d493          	srli	s1,s1,0x1
    80008bac:	ffffe097          	auipc	ra,0xffffe
    80008bb0:	6d8080e7          	jalr	1752(ra) # 80007284 <mycpu>
    80008bb4:	0014f493          	andi	s1,s1,1
    80008bb8:	06952e23          	sw	s1,124(a0)
    80008bbc:	fc5ff06f          	j	80008b80 <push_off+0x34>

0000000080008bc0 <pop_off>:
    80008bc0:	ff010113          	addi	sp,sp,-16
    80008bc4:	00813023          	sd	s0,0(sp)
    80008bc8:	00113423          	sd	ra,8(sp)
    80008bcc:	01010413          	addi	s0,sp,16
    80008bd0:	ffffe097          	auipc	ra,0xffffe
    80008bd4:	6b4080e7          	jalr	1716(ra) # 80007284 <mycpu>
    80008bd8:	100027f3          	csrr	a5,sstatus
    80008bdc:	0027f793          	andi	a5,a5,2
    80008be0:	04079663          	bnez	a5,80008c2c <pop_off+0x6c>
    80008be4:	07852783          	lw	a5,120(a0)
    80008be8:	02f05a63          	blez	a5,80008c1c <pop_off+0x5c>
    80008bec:	fff7871b          	addiw	a4,a5,-1
    80008bf0:	06e52c23          	sw	a4,120(a0)
    80008bf4:	00071c63          	bnez	a4,80008c0c <pop_off+0x4c>
    80008bf8:	07c52783          	lw	a5,124(a0)
    80008bfc:	00078863          	beqz	a5,80008c0c <pop_off+0x4c>
    80008c00:	100027f3          	csrr	a5,sstatus
    80008c04:	0027e793          	ori	a5,a5,2
    80008c08:	10079073          	csrw	sstatus,a5
    80008c0c:	00813083          	ld	ra,8(sp)
    80008c10:	00013403          	ld	s0,0(sp)
    80008c14:	01010113          	addi	sp,sp,16
    80008c18:	00008067          	ret
    80008c1c:	00002517          	auipc	a0,0x2
    80008c20:	bbc50513          	addi	a0,a0,-1092 # 8000a7d8 <digits+0x48>
    80008c24:	fffff097          	auipc	ra,0xfffff
    80008c28:	018080e7          	jalr	24(ra) # 80007c3c <panic>
    80008c2c:	00002517          	auipc	a0,0x2
    80008c30:	b9450513          	addi	a0,a0,-1132 # 8000a7c0 <digits+0x30>
    80008c34:	fffff097          	auipc	ra,0xfffff
    80008c38:	008080e7          	jalr	8(ra) # 80007c3c <panic>

0000000080008c3c <push_on>:
    80008c3c:	fe010113          	addi	sp,sp,-32
    80008c40:	00813823          	sd	s0,16(sp)
    80008c44:	00113c23          	sd	ra,24(sp)
    80008c48:	00913423          	sd	s1,8(sp)
    80008c4c:	02010413          	addi	s0,sp,32
    80008c50:	100024f3          	csrr	s1,sstatus
    80008c54:	100027f3          	csrr	a5,sstatus
    80008c58:	0027e793          	ori	a5,a5,2
    80008c5c:	10079073          	csrw	sstatus,a5
    80008c60:	ffffe097          	auipc	ra,0xffffe
    80008c64:	624080e7          	jalr	1572(ra) # 80007284 <mycpu>
    80008c68:	07852783          	lw	a5,120(a0)
    80008c6c:	02078663          	beqz	a5,80008c98 <push_on+0x5c>
    80008c70:	ffffe097          	auipc	ra,0xffffe
    80008c74:	614080e7          	jalr	1556(ra) # 80007284 <mycpu>
    80008c78:	07852783          	lw	a5,120(a0)
    80008c7c:	01813083          	ld	ra,24(sp)
    80008c80:	01013403          	ld	s0,16(sp)
    80008c84:	0017879b          	addiw	a5,a5,1
    80008c88:	06f52c23          	sw	a5,120(a0)
    80008c8c:	00813483          	ld	s1,8(sp)
    80008c90:	02010113          	addi	sp,sp,32
    80008c94:	00008067          	ret
    80008c98:	0014d493          	srli	s1,s1,0x1
    80008c9c:	ffffe097          	auipc	ra,0xffffe
    80008ca0:	5e8080e7          	jalr	1512(ra) # 80007284 <mycpu>
    80008ca4:	0014f493          	andi	s1,s1,1
    80008ca8:	06952e23          	sw	s1,124(a0)
    80008cac:	fc5ff06f          	j	80008c70 <push_on+0x34>

0000000080008cb0 <pop_on>:
    80008cb0:	ff010113          	addi	sp,sp,-16
    80008cb4:	00813023          	sd	s0,0(sp)
    80008cb8:	00113423          	sd	ra,8(sp)
    80008cbc:	01010413          	addi	s0,sp,16
    80008cc0:	ffffe097          	auipc	ra,0xffffe
    80008cc4:	5c4080e7          	jalr	1476(ra) # 80007284 <mycpu>
    80008cc8:	100027f3          	csrr	a5,sstatus
    80008ccc:	0027f793          	andi	a5,a5,2
    80008cd0:	04078463          	beqz	a5,80008d18 <pop_on+0x68>
    80008cd4:	07852783          	lw	a5,120(a0)
    80008cd8:	02f05863          	blez	a5,80008d08 <pop_on+0x58>
    80008cdc:	fff7879b          	addiw	a5,a5,-1
    80008ce0:	06f52c23          	sw	a5,120(a0)
    80008ce4:	07853783          	ld	a5,120(a0)
    80008ce8:	00079863          	bnez	a5,80008cf8 <pop_on+0x48>
    80008cec:	100027f3          	csrr	a5,sstatus
    80008cf0:	ffd7f793          	andi	a5,a5,-3
    80008cf4:	10079073          	csrw	sstatus,a5
    80008cf8:	00813083          	ld	ra,8(sp)
    80008cfc:	00013403          	ld	s0,0(sp)
    80008d00:	01010113          	addi	sp,sp,16
    80008d04:	00008067          	ret
    80008d08:	00002517          	auipc	a0,0x2
    80008d0c:	af850513          	addi	a0,a0,-1288 # 8000a800 <digits+0x70>
    80008d10:	fffff097          	auipc	ra,0xfffff
    80008d14:	f2c080e7          	jalr	-212(ra) # 80007c3c <panic>
    80008d18:	00002517          	auipc	a0,0x2
    80008d1c:	ac850513          	addi	a0,a0,-1336 # 8000a7e0 <digits+0x50>
    80008d20:	fffff097          	auipc	ra,0xfffff
    80008d24:	f1c080e7          	jalr	-228(ra) # 80007c3c <panic>

0000000080008d28 <__memset>:
    80008d28:	ff010113          	addi	sp,sp,-16
    80008d2c:	00813423          	sd	s0,8(sp)
    80008d30:	01010413          	addi	s0,sp,16
    80008d34:	1a060e63          	beqz	a2,80008ef0 <__memset+0x1c8>
    80008d38:	40a007b3          	neg	a5,a0
    80008d3c:	0077f793          	andi	a5,a5,7
    80008d40:	00778693          	addi	a3,a5,7
    80008d44:	00b00813          	li	a6,11
    80008d48:	0ff5f593          	andi	a1,a1,255
    80008d4c:	fff6071b          	addiw	a4,a2,-1
    80008d50:	1b06e663          	bltu	a3,a6,80008efc <__memset+0x1d4>
    80008d54:	1cd76463          	bltu	a4,a3,80008f1c <__memset+0x1f4>
    80008d58:	1a078e63          	beqz	a5,80008f14 <__memset+0x1ec>
    80008d5c:	00b50023          	sb	a1,0(a0)
    80008d60:	00100713          	li	a4,1
    80008d64:	1ae78463          	beq	a5,a4,80008f0c <__memset+0x1e4>
    80008d68:	00b500a3          	sb	a1,1(a0)
    80008d6c:	00200713          	li	a4,2
    80008d70:	1ae78a63          	beq	a5,a4,80008f24 <__memset+0x1fc>
    80008d74:	00b50123          	sb	a1,2(a0)
    80008d78:	00300713          	li	a4,3
    80008d7c:	18e78463          	beq	a5,a4,80008f04 <__memset+0x1dc>
    80008d80:	00b501a3          	sb	a1,3(a0)
    80008d84:	00400713          	li	a4,4
    80008d88:	1ae78263          	beq	a5,a4,80008f2c <__memset+0x204>
    80008d8c:	00b50223          	sb	a1,4(a0)
    80008d90:	00500713          	li	a4,5
    80008d94:	1ae78063          	beq	a5,a4,80008f34 <__memset+0x20c>
    80008d98:	00b502a3          	sb	a1,5(a0)
    80008d9c:	00700713          	li	a4,7
    80008da0:	18e79e63          	bne	a5,a4,80008f3c <__memset+0x214>
    80008da4:	00b50323          	sb	a1,6(a0)
    80008da8:	00700e93          	li	t4,7
    80008dac:	00859713          	slli	a4,a1,0x8
    80008db0:	00e5e733          	or	a4,a1,a4
    80008db4:	01059e13          	slli	t3,a1,0x10
    80008db8:	01c76e33          	or	t3,a4,t3
    80008dbc:	01859313          	slli	t1,a1,0x18
    80008dc0:	006e6333          	or	t1,t3,t1
    80008dc4:	02059893          	slli	a7,a1,0x20
    80008dc8:	40f60e3b          	subw	t3,a2,a5
    80008dcc:	011368b3          	or	a7,t1,a7
    80008dd0:	02859813          	slli	a6,a1,0x28
    80008dd4:	0108e833          	or	a6,a7,a6
    80008dd8:	03059693          	slli	a3,a1,0x30
    80008ddc:	003e589b          	srliw	a7,t3,0x3
    80008de0:	00d866b3          	or	a3,a6,a3
    80008de4:	03859713          	slli	a4,a1,0x38
    80008de8:	00389813          	slli	a6,a7,0x3
    80008dec:	00f507b3          	add	a5,a0,a5
    80008df0:	00e6e733          	or	a4,a3,a4
    80008df4:	000e089b          	sext.w	a7,t3
    80008df8:	00f806b3          	add	a3,a6,a5
    80008dfc:	00e7b023          	sd	a4,0(a5)
    80008e00:	00878793          	addi	a5,a5,8
    80008e04:	fed79ce3          	bne	a5,a3,80008dfc <__memset+0xd4>
    80008e08:	ff8e7793          	andi	a5,t3,-8
    80008e0c:	0007871b          	sext.w	a4,a5
    80008e10:	01d787bb          	addw	a5,a5,t4
    80008e14:	0ce88e63          	beq	a7,a4,80008ef0 <__memset+0x1c8>
    80008e18:	00f50733          	add	a4,a0,a5
    80008e1c:	00b70023          	sb	a1,0(a4)
    80008e20:	0017871b          	addiw	a4,a5,1
    80008e24:	0cc77663          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e28:	00e50733          	add	a4,a0,a4
    80008e2c:	00b70023          	sb	a1,0(a4)
    80008e30:	0027871b          	addiw	a4,a5,2
    80008e34:	0ac77e63          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e38:	00e50733          	add	a4,a0,a4
    80008e3c:	00b70023          	sb	a1,0(a4)
    80008e40:	0037871b          	addiw	a4,a5,3
    80008e44:	0ac77663          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e48:	00e50733          	add	a4,a0,a4
    80008e4c:	00b70023          	sb	a1,0(a4)
    80008e50:	0047871b          	addiw	a4,a5,4
    80008e54:	08c77e63          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e58:	00e50733          	add	a4,a0,a4
    80008e5c:	00b70023          	sb	a1,0(a4)
    80008e60:	0057871b          	addiw	a4,a5,5
    80008e64:	08c77663          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e68:	00e50733          	add	a4,a0,a4
    80008e6c:	00b70023          	sb	a1,0(a4)
    80008e70:	0067871b          	addiw	a4,a5,6
    80008e74:	06c77e63          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e78:	00e50733          	add	a4,a0,a4
    80008e7c:	00b70023          	sb	a1,0(a4)
    80008e80:	0077871b          	addiw	a4,a5,7
    80008e84:	06c77663          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e88:	00e50733          	add	a4,a0,a4
    80008e8c:	00b70023          	sb	a1,0(a4)
    80008e90:	0087871b          	addiw	a4,a5,8
    80008e94:	04c77e63          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008e98:	00e50733          	add	a4,a0,a4
    80008e9c:	00b70023          	sb	a1,0(a4)
    80008ea0:	0097871b          	addiw	a4,a5,9
    80008ea4:	04c77663          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008ea8:	00e50733          	add	a4,a0,a4
    80008eac:	00b70023          	sb	a1,0(a4)
    80008eb0:	00a7871b          	addiw	a4,a5,10
    80008eb4:	02c77e63          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008eb8:	00e50733          	add	a4,a0,a4
    80008ebc:	00b70023          	sb	a1,0(a4)
    80008ec0:	00b7871b          	addiw	a4,a5,11
    80008ec4:	02c77663          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008ec8:	00e50733          	add	a4,a0,a4
    80008ecc:	00b70023          	sb	a1,0(a4)
    80008ed0:	00c7871b          	addiw	a4,a5,12
    80008ed4:	00c77e63          	bgeu	a4,a2,80008ef0 <__memset+0x1c8>
    80008ed8:	00e50733          	add	a4,a0,a4
    80008edc:	00b70023          	sb	a1,0(a4)
    80008ee0:	00d7879b          	addiw	a5,a5,13
    80008ee4:	00c7f663          	bgeu	a5,a2,80008ef0 <__memset+0x1c8>
    80008ee8:	00f507b3          	add	a5,a0,a5
    80008eec:	00b78023          	sb	a1,0(a5)
    80008ef0:	00813403          	ld	s0,8(sp)
    80008ef4:	01010113          	addi	sp,sp,16
    80008ef8:	00008067          	ret
    80008efc:	00b00693          	li	a3,11
    80008f00:	e55ff06f          	j	80008d54 <__memset+0x2c>
    80008f04:	00300e93          	li	t4,3
    80008f08:	ea5ff06f          	j	80008dac <__memset+0x84>
    80008f0c:	00100e93          	li	t4,1
    80008f10:	e9dff06f          	j	80008dac <__memset+0x84>
    80008f14:	00000e93          	li	t4,0
    80008f18:	e95ff06f          	j	80008dac <__memset+0x84>
    80008f1c:	00000793          	li	a5,0
    80008f20:	ef9ff06f          	j	80008e18 <__memset+0xf0>
    80008f24:	00200e93          	li	t4,2
    80008f28:	e85ff06f          	j	80008dac <__memset+0x84>
    80008f2c:	00400e93          	li	t4,4
    80008f30:	e7dff06f          	j	80008dac <__memset+0x84>
    80008f34:	00500e93          	li	t4,5
    80008f38:	e75ff06f          	j	80008dac <__memset+0x84>
    80008f3c:	00600e93          	li	t4,6
    80008f40:	e6dff06f          	j	80008dac <__memset+0x84>

0000000080008f44 <__memmove>:
    80008f44:	ff010113          	addi	sp,sp,-16
    80008f48:	00813423          	sd	s0,8(sp)
    80008f4c:	01010413          	addi	s0,sp,16
    80008f50:	0e060863          	beqz	a2,80009040 <__memmove+0xfc>
    80008f54:	fff6069b          	addiw	a3,a2,-1
    80008f58:	0006881b          	sext.w	a6,a3
    80008f5c:	0ea5e863          	bltu	a1,a0,8000904c <__memmove+0x108>
    80008f60:	00758713          	addi	a4,a1,7
    80008f64:	00a5e7b3          	or	a5,a1,a0
    80008f68:	40a70733          	sub	a4,a4,a0
    80008f6c:	0077f793          	andi	a5,a5,7
    80008f70:	00f73713          	sltiu	a4,a4,15
    80008f74:	00174713          	xori	a4,a4,1
    80008f78:	0017b793          	seqz	a5,a5
    80008f7c:	00e7f7b3          	and	a5,a5,a4
    80008f80:	10078863          	beqz	a5,80009090 <__memmove+0x14c>
    80008f84:	00900793          	li	a5,9
    80008f88:	1107f463          	bgeu	a5,a6,80009090 <__memmove+0x14c>
    80008f8c:	0036581b          	srliw	a6,a2,0x3
    80008f90:	fff8081b          	addiw	a6,a6,-1
    80008f94:	02081813          	slli	a6,a6,0x20
    80008f98:	01d85893          	srli	a7,a6,0x1d
    80008f9c:	00858813          	addi	a6,a1,8
    80008fa0:	00058793          	mv	a5,a1
    80008fa4:	00050713          	mv	a4,a0
    80008fa8:	01088833          	add	a6,a7,a6
    80008fac:	0007b883          	ld	a7,0(a5)
    80008fb0:	00878793          	addi	a5,a5,8
    80008fb4:	00870713          	addi	a4,a4,8
    80008fb8:	ff173c23          	sd	a7,-8(a4)
    80008fbc:	ff0798e3          	bne	a5,a6,80008fac <__memmove+0x68>
    80008fc0:	ff867713          	andi	a4,a2,-8
    80008fc4:	02071793          	slli	a5,a4,0x20
    80008fc8:	0207d793          	srli	a5,a5,0x20
    80008fcc:	00f585b3          	add	a1,a1,a5
    80008fd0:	40e686bb          	subw	a3,a3,a4
    80008fd4:	00f507b3          	add	a5,a0,a5
    80008fd8:	06e60463          	beq	a2,a4,80009040 <__memmove+0xfc>
    80008fdc:	0005c703          	lbu	a4,0(a1)
    80008fe0:	00e78023          	sb	a4,0(a5)
    80008fe4:	04068e63          	beqz	a3,80009040 <__memmove+0xfc>
    80008fe8:	0015c603          	lbu	a2,1(a1)
    80008fec:	00100713          	li	a4,1
    80008ff0:	00c780a3          	sb	a2,1(a5)
    80008ff4:	04e68663          	beq	a3,a4,80009040 <__memmove+0xfc>
    80008ff8:	0025c603          	lbu	a2,2(a1)
    80008ffc:	00200713          	li	a4,2
    80009000:	00c78123          	sb	a2,2(a5)
    80009004:	02e68e63          	beq	a3,a4,80009040 <__memmove+0xfc>
    80009008:	0035c603          	lbu	a2,3(a1)
    8000900c:	00300713          	li	a4,3
    80009010:	00c781a3          	sb	a2,3(a5)
    80009014:	02e68663          	beq	a3,a4,80009040 <__memmove+0xfc>
    80009018:	0045c603          	lbu	a2,4(a1)
    8000901c:	00400713          	li	a4,4
    80009020:	00c78223          	sb	a2,4(a5)
    80009024:	00e68e63          	beq	a3,a4,80009040 <__memmove+0xfc>
    80009028:	0055c603          	lbu	a2,5(a1)
    8000902c:	00500713          	li	a4,5
    80009030:	00c782a3          	sb	a2,5(a5)
    80009034:	00e68663          	beq	a3,a4,80009040 <__memmove+0xfc>
    80009038:	0065c703          	lbu	a4,6(a1)
    8000903c:	00e78323          	sb	a4,6(a5)
    80009040:	00813403          	ld	s0,8(sp)
    80009044:	01010113          	addi	sp,sp,16
    80009048:	00008067          	ret
    8000904c:	02061713          	slli	a4,a2,0x20
    80009050:	02075713          	srli	a4,a4,0x20
    80009054:	00e587b3          	add	a5,a1,a4
    80009058:	f0f574e3          	bgeu	a0,a5,80008f60 <__memmove+0x1c>
    8000905c:	02069613          	slli	a2,a3,0x20
    80009060:	02065613          	srli	a2,a2,0x20
    80009064:	fff64613          	not	a2,a2
    80009068:	00e50733          	add	a4,a0,a4
    8000906c:	00c78633          	add	a2,a5,a2
    80009070:	fff7c683          	lbu	a3,-1(a5)
    80009074:	fff78793          	addi	a5,a5,-1
    80009078:	fff70713          	addi	a4,a4,-1
    8000907c:	00d70023          	sb	a3,0(a4)
    80009080:	fec798e3          	bne	a5,a2,80009070 <__memmove+0x12c>
    80009084:	00813403          	ld	s0,8(sp)
    80009088:	01010113          	addi	sp,sp,16
    8000908c:	00008067          	ret
    80009090:	02069713          	slli	a4,a3,0x20
    80009094:	02075713          	srli	a4,a4,0x20
    80009098:	00170713          	addi	a4,a4,1
    8000909c:	00e50733          	add	a4,a0,a4
    800090a0:	00050793          	mv	a5,a0
    800090a4:	0005c683          	lbu	a3,0(a1)
    800090a8:	00178793          	addi	a5,a5,1
    800090ac:	00158593          	addi	a1,a1,1
    800090b0:	fed78fa3          	sb	a3,-1(a5)
    800090b4:	fee798e3          	bne	a5,a4,800090a4 <__memmove+0x160>
    800090b8:	f89ff06f          	j	80009040 <__memmove+0xfc>
	...
