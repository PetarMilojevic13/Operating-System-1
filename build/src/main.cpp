
#include "../lib/hw.h"
#include "../h/riscv.hpp"




extern "C" void supervisorTrap();

extern  void userMain();


void idle_function(void* arg)
{
    while(true)
    {
        thread_dispatch();
    }
}


void user_wrapper(void* arg)
{
    userMain();
}



void ispis(void* arg) {
    while (true) {
                // Uzimanje vrednosti status registra
                char volatile status = *((char *) CONSOLE_STATUS);
                while (status & CONSOLE_TX_STATUS_BIT) {
                    // Uzimanje karaktera iz izlaznog bafera
                    char volatile c = Riscv::output_buffer->get();
                    *((char *) CONSOLE_TX_DATA) = c;
                    status = *((char*)CONSOLE_STATUS);
                }
        }

    }



int main()
{

  Riscv::input_buffer=new _Buffer();
  Riscv::output_buffer=new _Buffer();

    Riscv::w_stvec((uint64) &supervisorTrap);
    __asm__ volatile ("csrs stvec, 0x01");


    TCB* kernel = TCB::createThread(nullptr, nullptr, nullptr,true);


    TCB::running = kernel;

    size_t velicina = sizeof(uint64) * DEFAULT_STACK_SIZE;
    if (velicina%MEM_BLOCK_SIZE==0){velicina = (sizeof(uint64) * DEFAULT_STACK_SIZE)/MEM_BLOCK_SIZE; }
    else {
        velicina = (sizeof(uint64) * DEFAULT_STACK_SIZE)/MEM_BLOCK_SIZE;
        velicina = velicina+1;
    }
    TCB::idle = TCB::createIdleThread(idle_function, nullptr, (uint64*)MemoryAllocator::mem_alloc(velicina),false);

    TCB::out = TCB::createThread(ispis, nullptr, (uint64*)MemoryAllocator::mem_alloc(velicina),true);

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    TCB* nit = TCB::createThread(user_wrapper, nullptr, (uint64*)MemoryAllocator::mem_alloc(velicina),false);

    //Cekanje da se zavrsi nit koja izvrsava userMain()

    kernel->join(nit);



//Sluzi za ispis ako je jos nesto ostalo u baferu a mi nismo stigli da ga ispisemo
 while (Riscv::output_buffer->count() > 0) {  TCB::dispatch();}

 //Onemogucavanje prekida
 Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
 //Oslobadjanje memorije
 MemoryAllocator::mem_free(TCB::idle);
 MemoryAllocator::mem_free(TCB::out);
 MemoryAllocator::mem_free(Riscv::output_buffer);
 MemoryAllocator::mem_free(Riscv::input_buffer);
 MemoryAllocator::mem_free(nit);
 MemoryAllocator::mem_free(kernel);
 return 0;

}