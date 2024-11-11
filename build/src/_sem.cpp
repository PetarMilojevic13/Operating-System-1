//
// Created by os on 5/8/23.
//

#include "../h/_sem.hpp"




void _sem::operator delete(void *adress) {
    MemoryAllocator::mem_free(adress);
}



void *_sem::operator new(size_t size) {



   size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    void* pointer = MemoryAllocator::mem_alloc(block);
    return pointer;
}






int _sem::wait() {
    if (this->finished){return -1;}
    else
    {
        if (--val<0)
        {
            TCB::running->blocked= true;
            add_thread(TCB::running);
            TCB::dispatch();
        }
    }
    if (this->finished){return -1;}
    else return 0;
}

void _sem::add_thread(TCB *nit) {

    if (waiting_head== nullptr)
    {
        waiting_head=nit;
        tail=nit;
        nit->next= nullptr;
    }
    else
    {
        tail->next=nit;
        tail=nit;
        nit->next= nullptr;

    }

}

TCB *_sem::release_thread() {
    TCB* curr = waiting_head;
    if (curr== nullptr)return nullptr;
    waiting_head = waiting_head->next;
    if (waiting_head== nullptr)tail= nullptr;
    curr->next= nullptr;
    return curr;
}

int _sem::signal() {
    if (this->finished)return -1;
    if (++val<=0)
    {
        TCB* curr = release_thread();
        curr->setBlocked(false);
        Scheduler::put(curr);
    }
    return 0;
}

int _sem::close() {
    if (finished)return -1;
    finished=true;
    val = 0;
    while (true)
    {
        TCB* curr = release_thread();
        if (curr== nullptr)break;
        curr->setBlocked(false);
        Scheduler::put(curr);
    }
    return 0;
}

_sem::~_sem() {
    this->close();
}


_sem* _sem::createSemaphore(unsigned init) {
    _sem* curr = new _sem(init);
    curr->val=(int)init;
    return curr;
}
