//
// Created by os on 5/17/23.
//

#ifndef PROJECT_BASE_V1_1_SLEEPING_LIST_HPP
#define PROJECT_BASE_V1_1_SLEEPING_LIST_HPP
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"
#include "../lib/mem.h"



class SleepingList
{
private:

    struct Elem
    {
        TCB* nit;
        time_t remaining_time;
        Elem* next;
        Elem(TCB* thread,time_t time,Elem* sledeci= nullptr):nit(thread),remaining_time(time),next(sledeci){}

        void *operator new(size_t size) {
            size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
            void* pointer = MemoryAllocator::mem_alloc(block);
            return pointer;
        }

        void operator delete(void *adress) {

            MemoryAllocator::mem_free(adress);
        }
    };

    static time_t First_remaining_time; // Preostalo vreme se pamti samo za prvi element liste, a za ostale se pamti samo preostalo u odnosu na onog pre njega u listi



    Elem* head= nullptr;

    void operator delete(void *adress) ;

    void *operator new(size_t size);

public:
    friend class Riscv;

    friend class Scheduler;

    void add_node (TCB* thread,time_t vreme); // Stavljamo datu nit u listu

    void otkucaj();

    void get_node ();   // Budimo neku nit, ako za tim ima uslova,odnosno ako je proslo dovoljno vremena







};



#endif //PROJECT_BASE_V1_1_SLEEPING_LIST_HPP
