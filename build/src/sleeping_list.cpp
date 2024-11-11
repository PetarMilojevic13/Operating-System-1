//
// Created by os on 5/17/23.
//

#include "../h/sleeping_list.hpp"
#include "../lib/console.h"
time_t SleepingList::First_remaining_time=0;

void SleepingList::add_node(TCB *thread, time_t vreme) {
    Elem* node = new Elem(thread,vreme);
    thread->setBlocked(true);   //Blokiranje niti, jer je stavljena na cekanje potrebnog vremena otkucaja tajmera!
    if (head== nullptr)
    {
        // Slucaj kada je lista prazna
        head = node;
        First_remaining_time = vreme;
        node->remaining_time=0;
        node->next= nullptr;
        return;
    }
    if (First_remaining_time==vreme)
    {
        // Ukoliko je vreme uspavljivanja jednako trenutnom preostalom vremenu prvog!

        node->next = head;
        head->remaining_time = 0; // Preostalo u odnosu na node!
        head = node;
        First_remaining_time = vreme;
        node->remaining_time=0; // Za prvog u listi je 0 u odnosu na First_remaining_time!


    }
    else if (First_remaining_time>vreme)
    {
        // Ukoliko je vreme uspavljivanja manje od  trenutnog preostalog vremena prvog!
        node->next = head;
        head->remaining_time = First_remaining_time - vreme;
        First_remaining_time = vreme;
        node->remaining_time=0; // Za prvog u listi je 0 u odnosu na First_remaining_time!
        head = node;

    }
    else
    {
        // Ukoliko je vreme uspavljivanja vece od trenutnog preostalog vremena prvog!
        time_t current = First_remaining_time;
        Elem* trenutni = head->next;
        Elem* prev = head;
        while (trenutni != nullptr)
        {
            current+= trenutni->remaining_time;
            if (current>=vreme)
            {
                prev->next = node;
                node->next=trenutni;
                time_t staro_vreme = current - trenutni->remaining_time;
                trenutni->remaining_time= current - node->remaining_time;
                node->remaining_time=node->remaining_time-staro_vreme;
                return;
            }
            prev=trenutni;
            trenutni=trenutni->next;

        }
        prev->next=node;
        node->remaining_time = node->remaining_time-prev->remaining_time;

    }

}


void SleepingList::otkucaj() {
    if (First_remaining_time>0)
    {
        First_remaining_time--;
        if (First_remaining_time==0)
         get_node();
    }

}

void SleepingList::get_node() {

    Elem* current = head;
    while (current!= nullptr)
    {
        if (current->remaining_time!=0)
        {
            head = current;
            First_remaining_time = head->remaining_time;
            head->remaining_time=0;
            return;
        }
        Elem* old = current;
        if (current->nit!= nullptr)
        {
            current->nit->setBlocked(false);
            if (current->nit->isFinished()== false)
            {
                Scheduler::put(current->nit);
            }

        }
        current=current->next;
        delete old;

    }
    // Slucaj kada uzmemo sve elemente liste i lista postane prazna!
    head = nullptr;
    First_remaining_time=0;

}

void SleepingList::operator delete(void *adress) {
    MemoryAllocator::mem_free(adress);
}

void *SleepingList::operator new(size_t size) {
    size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    void* pointer = MemoryAllocator::mem_alloc(block);
    return pointer;
}
