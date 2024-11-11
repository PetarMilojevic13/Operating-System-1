//
// Created by os on 4/17/23.
//

#include "../h/riscv.hpp"


#include "../test/printing.hpp"
#include "../lib/hw.h"
#include "../lib/console.h"
SleepingList Riscv::SleepingThreads;
_Buffer* Riscv::input_buffer = nullptr;
_Buffer* Riscv::output_buffer= nullptr;

void Riscv::popSppSpie()
{
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void Riscv::setThreadMode()
{

    // Vracamo nit u odgovarajuci mode rada
    if (TCB::running->isSystemThread())
    {
        ms_sstatus(SSTATUS_SPP);
    }
    else
    {
        mc_sstatus(SSTATUS_SPP);
    }
}

void Riscv::supervisorsyscallHandler()
{


    uint64  volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));

    uint64 volatile a0;
    uint64 volatile a1;
    uint64 volatile a2;
    uint64 volatile a3;
    uint64 volatile a4;
    uint64 volatile return_value = 0;

    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    __asm__ volatile ("mv %[a1], a1" : [a1] "=r"(a1));
    __asm__ volatile ("mv %[a2], a2" : [a2] "=r"(a2));
    __asm__ volatile ("mv %[a3], a3" : [a3] "=r"(a3));
    __asm__ volatile ("mv %[a4], a4" : [a4] "=r"(a4));

    uint64  volatile sstatus = Riscv::r_sstatus();
    uint64 volatile sepc = Riscv::r_sepc();

    if (scause== 0x0000000000000008 || scause== 0x0000000000000009 )
    {
        switch (a0) {
            case 0x01: {
                // mem_alloc
                size_t size;
                size = (size_t) a1;

               return_value = (uint64) MemoryAllocator::mem_alloc(size);

               Riscv::w_a0(return_value);
            }
                break;


            case 0x02: {
                // mem_free
                void *pointer;
                pointer = (void*) a1;

                return_value = (uint64)MemoryAllocator::mem_free(pointer);
                Riscv::w_a0(return_value);
            }
                break;




            case 0x11:
            {
                //thread_create
                thread_t* handle;
                void(*start_routine)(void*);
                void* arg;
                void* stack;

                handle = (thread_t*) a1;
                start_routine = (TCB::Body) a2;
                 arg = (void*) a3;
                stack = (void*) a4;
                uint64* stack_space = (uint64*) stack;

                *handle = TCB::createThread(start_routine,arg,stack_space,false);


            }
                break;

            case 0x12: {
                // thread_exit
                return_value = TCB::exit();
                Riscv::w_a0(return_value);
            }
                break;

            case 0x13: {
                // thread_dispatch
                TCB::dispatch();
            }
                break;

            case 0x14: {
                // thread_join
                TCB* nit;
                __asm__ volatile("mv %0, a1" : "=r" (nit));
                TCB::running->join(nit);
            }
                break;

            case 0x15: {
                // thread_start
                TCB* nit;
                __asm__ volatile("mv %0, a1" : "=r" (nit));
               return_value =  TCB::running->start(nit);
                Riscv::w_a0(return_value);
            }
                break;

            case 0x16: {
                // thread_make
                thread_t* handle;
                void(*start_routine)(void*);
                void* arg;
                void* stack;

                handle = (thread_t*) a1;
                start_routine = (TCB::Body) a2;
                arg = (void*) a3;
                stack = (void*) a4;
                uint64* stack_space = (uint64*) stack;

                *handle = TCB::makeThread(start_routine,arg,stack_space,false);
            }
                break;

            case 0x17: {
                // thread_delete
                // Poziva se delete kako bi se pozvao destruktor i time obrisao i prostor za stack
                thread_t nit = (thread_t) a1;
                delete nit;

            }
                break;

            case 0x21: {
                // sem_open
                sem_t* handle;
                unsigned init;
                handle = (sem_t*) a1;
                init = (unsigned) a2;


                *handle = _sem::createSemaphore(init);


            }
                break;

            case 0x22: {
                // sem_close
                sem_t handle;

                __asm__ volatile("mv %0, a1" : "=r" (handle));
                return_value = handle->close();

                // Oslobodjamo memoriju semafora!
                MemoryAllocator::mem_free(handle);
                Riscv::w_a0(return_value);


            }
                break;

            case 0x23: {
                // sem_wait
                sem_t handle;
                handle = (sem_t)a1;

                return_value = handle->wait();

                Riscv::w_a0(return_value);
            }
                break;

            case 0x24: {
                // sem_signal
                sem_t handle;
                handle = (sem_t)a1;

                return_value = handle->signal();

                Riscv::w_a0(return_value);
            }
                break;

            case 0x31: {
                // time_sleep
                time_t vreme;
                vreme = (time_t) a1;

                SleepingThreads.add_node(TCB::running,vreme);
                TCB::dispatch();
            }
                break;

            case 0x41: {
                // getc
                // Ucitava se jedan znak od znakova ucitanih sa konzole sto znaci da se uzima iz ulaznog bafera!

                char karakter = input_buffer->get();

                __asm__ volatile ("mv a0,%0" : :"r" (karakter));

            }
                break;

            case 0x42: {
                // putc
                char karakter;
                karakter = (char)a1;

                // Karakter se stavlja u izlazni bafer!
                output_buffer->put(karakter);






            }
                break;


        }

        sepc+=4;
        Riscv::w_sepc(sepc);
       // mc_sip(SIP_SSIP);
        Riscv::w_sstatus(sstatus);


    }
    else
    {
        uint64 volatile scause = r_scause();
        uint64 volatile stval = r_stval();
        uint64 volatile stvec = r_stvec();
        uint64 volatile sepc = r_sepc();

        printString("scause: ");
        printInt(scause);
        printString("\n");

        printString("stval: ");
        printInt(stval);
        printString("\n");

        printString("stvec: ");
        printInt(stvec);
        printString("\n");

        printString("sepc: ");
        printInt(sepc);
        printString("\n");
    }


}

void Riscv::supervisorTimerHandler()
{



    TCB::timeSliceCounter++;
    mc_sip(SIP_SSIP);

    SleepingThreads.otkucaj();


    if (TCB::timeSliceCounter>=TCB::running->getTimeSlice())
    {
        uint64 volatile sepc = Riscv::r_sepc();
        uint64 volatile sstatus = Riscv::r_sstatus();
        TCB::dispatch();

        Riscv::w_sepc(sepc);
        Riscv::w_sstatus(sstatus);
    }



}




void Riscv::supervisorOutsideInterruptHandler()
{


  //Posto nam treba samo prvi bajt statusnog registra pretvoricemo ga u char
    int broj_prekida_uredjaja = plic_claim();
    if (broj_prekida_uredjaja == (int)CONSOLE_IRQ)
    {
        char volatile status = *((char*)CONSOLE_STATUS);
        while (status & CONSOLE_RX_STATUS_BIT){

            //Ukoliko nema vise mesta odbacujemo preostale karaktere
            char  volatile c = *(char*)CONSOLE_RX_DATA;
           if (Riscv::input_buffer->size<256)
                Riscv::input_buffer->put(c);
            status = *((char*)CONSOLE_STATUS);
        }
    }
    plic_complete(broj_prekida_uredjaja);
}