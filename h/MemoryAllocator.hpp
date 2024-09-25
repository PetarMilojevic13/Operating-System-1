//
// Created by os on 4/13/23.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator
{
private:

    // Pomocu size_t size pamtimo broj blokova koja struktura zauzima.


    struct FreeSegment
    {
        FreeSegment* next;
        FreeSegment* prev;
        size_t size;

    };
    // Za koriscene segmente pamtimo koliko smo blokova memorije zauzeli
    // zbog toga pri mem_alloc pozivu uvek vracamo deo koji je memorijski iza pocetka
    // slobodnog fragmenta za sizeof(FreeSegment).
    // Zbog ovoga pri mem_free znamo da je na lokaciji koju dajemo kao parametar
    // zapravo pocetak tog koriscenog segmenta,ali je sama struktura USedSegment na lokaciji
    // koja je za sizeof(UsedSegment) iza te lokacije date parametrom i time znamo tacno koliki prostor
    // treba da oslobodimo.
    struct UsedSegment
    {
        UsedSegment* next;
        UsedSegment* prev;
        size_t size;

    };

    static bool initialized;
    static FreeSegment* free_head;
    static UsedSegment* used_head;
    static void* starting_adress;
    static void* ending_adress;

public:
    static  int mem_free (void*);
    static void* mem_alloc (size_t size);







};



#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
