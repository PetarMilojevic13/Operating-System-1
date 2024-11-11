//
// Created by os on 4/28/23.
//

#include "../h/syscall_c.h"


//Funkcija koja poziva ecall i stavlja kod operacije za svaku operaciju u a0!
 void inline sys_call_preparation (const uint64 CODE)
{
    __asm__ volatile ("mv a0,%0" : :"r" (CODE));
    __asm__ volatile("ecall");
}


void* mem_alloc (size_t size)
{
    size_t num_of_blocks = size;
    if (size % MEM_BLOCK_SIZE == 0)
    {
        num_of_blocks = size / MEM_BLOCK_SIZE;
    }
    else
    {
        num_of_blocks = size / MEM_BLOCK_SIZE;
        num_of_blocks++;
    }
    __asm__ volatile ("mv a1,%0" : :"r" (num_of_blocks));


    sys_call_preparation(MEM_ALLOC);

    uint64  return_adress;

    __asm__ volatile ("mv %0,a0" :"=r"(return_adress));

    return (void*)return_adress;
}

int mem_free (void* arg)
{

    __asm__ volatile ("mv a1,%0" : :"r" (arg));


    sys_call_preparation(MEM_FREE);

    int result;

    __asm__ volatile ("mv %0,a0" :"=r"(result));

    return result;


}

int thread_create (thread_t* handle,void(*start_routine)(void*),void* arg)
{
    void* stack_space = nullptr;
    if (handle== nullptr) return -1;


    if (start_routine != nullptr){
        size_t velicina = sizeof(uint64) * DEFAULT_STACK_SIZE;
        stack_space= mem_alloc(velicina);

    if (stack_space== nullptr)return -3;}


    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    __asm__ volatile ("mv a2,%0" : :"r" (start_routine));
    __asm__ volatile ("mv a3,%0" : :"r" (arg));
    __asm__ volatile ("mv a4,%0" : :"r" (stack_space));


    sys_call_preparation(THREAD_CREATE);

    if (*handle!= nullptr) return 0;
    else return -4;
}

int thread_exit ()
{

    sys_call_preparation(THREAD_EXIT);

    int result;

    __asm__ volatile ("mv %0,a0" :"=r"(result));
    return result;
}

void thread_dispatch ()
{
    sys_call_preparation(THREAD_DISPATCH);
}

void thread_join (thread_t handle)
{
    if (handle == nullptr)return;

    __asm__ volatile ("mv a1,%0" : :"r" (handle));

    sys_call_preparation(THREAD_JOIN);

}

int thread_start (thread_t handle)
{
    if (handle== nullptr) return -1;

    __asm__ volatile ("mv a1,%0" : :"r" (handle));

    sys_call_preparation(THREAD_START);

    int result;

    __asm__ volatile ("mv %0,a0" :"=r"(result));
    return result;
}

int thread_make (thread_t* handle,void(*start_routine)(void*),void* arg)
{
    void* stack_space = nullptr;
    if (handle== nullptr) return -1;


    if (start_routine != nullptr){
        stack_space = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);

        if (stack_space== nullptr)return -3;}


    __asm__ volatile ("mv a1,%0" : :"r" (handle));
    __asm__ volatile ("mv a2,%0" : :"r" (start_routine));
    __asm__ volatile ("mv a3,%0" : :"r" (arg));
    __asm__ volatile ("mv a4,%0" : :"r" (stack_space));

    sys_call_preparation(THREAD_MAKE);

    if (*handle!= nullptr) return 0;
    else return -4;
}

void thread_delete(thread_t handle)
{
   if (handle== nullptr)return;

    __asm__ volatile ("mv a1,%0" : :"r" (handle));

    sys_call_preparation(THREAD_DELETE);

}


int sem_open (sem_t* handle,unsigned init)
{
    if (handle== nullptr) return -2;

    __asm__ volatile ("mv a2, a1");
    __asm__ volatile ("mv a1, a0");

    sys_call_preparation(SEM_OPEN);

    if (*handle!= nullptr) return 0;
    else return -1;
}

int sem_close (sem_t handle)
{
    if (handle == nullptr) return -2;

    __asm__ volatile ("mv a1,%0" : :"r" (handle));

    sys_call_preparation(SEM_CLOSE);

    int result;
    __asm__ volatile ("mv %0,a0" :"=r"(result));
    return result;
}

int sem_wait (sem_t id)
{
    if (id== nullptr)return -2;

    __asm__ volatile ("mv a1,%0" : :"r" (id));

    sys_call_preparation(SEM_WAIT);

    int result;
    __asm__ volatile ("mv %0,a0" :"=r"(result));
    return result;

}

int sem_signal (sem_t id)
{
    if (id== nullptr)return -2;

    __asm__ volatile ("mv a1,%0" : :"r" (id));

    sys_call_preparation(SEM_SIGNAL);

    int result;
    __asm__ volatile ("mv %0,a0" :"=r"(result));
    return result;

}

int time_sleep (time_t vreme)
{
    if (vreme==0)return -1; //Ovo je jedini moguci izvor greske,tako da ako on prodje onda sigurno vracamo 0!

    __asm__ volatile ("mv a1,%0" : :"r" (vreme));

    sys_call_preparation(TIME_SLEEP);

   return 0;


}


char getc ()
{

    sys_call_preparation(GETC);

    char karakter;
    __asm__ volatile ("mv %0,a0" :"=r"(karakter));
    return karakter;
}


void putc (char c)
{
    __asm__ volatile ("mv a1,%0" : :"r" (c));

    sys_call_preparation(PUTC);

}