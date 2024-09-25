//
// Created by os on 5/27/23.
//

#ifndef PROJECT_BASE_V1_1_BUFFER_HPP
#define PROJECT_BASE_V1_1_BUFFER_HPP

#endif //PROJECT_BASE_V1_1_BUFFER_HPP
#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/_sem.hpp"
#include "../h/syscall_c.h"



class _Buffer
{
private:




    int head;
    int tail;
    int size;

    char niz[256];
    sem_t mutex;
    sem_t space_available;
    sem_t item_available;



    friend class Riscv;

public:

    void *operator new(size_t size);

    int count ();

    ~_Buffer();
    void operator delete(void *adress) ;

    _Buffer();

    char get();

    void put(char c);

};