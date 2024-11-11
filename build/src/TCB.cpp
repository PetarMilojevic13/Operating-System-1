//
// Created by os on 4/28/23.
//

//
// Created by marko on 20.4.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"



TCB *TCB::running = nullptr;
TCB *TCB::idle= nullptr;
TCB *TCB::out= nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB *TCB::createIdleThread(TCB::Body body, void *arg, uint64 *stack, bool system_thread)
{
    TCB* curr = new TCB(body,arg,stack,system_thread);
    return curr;
}

TCB *TCB::createThread(Body body,void* arg,uint64* stack,bool system_thread)
{
    TCB* curr = new TCB(body,arg,stack,system_thread);
    if (curr->body!= nullptr){Scheduler::put(curr);}
    return curr;
}


void TCB::dispatch()
{
    TCB::timeSliceCounter=0; // reset za vreme zauzetosti jedne niti
    TCB *old = running;
    if (!old->isFinished() && !old->isBlocked() && old->started && old!=idle) { Scheduler::put(old); }
    running = Scheduler::get();
    if (running== nullptr)running=idle;

    Riscv::setThreadMode();
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper()
{
    Riscv::setThreadMode();
    Riscv::popSppSpie();
    running->body(running->arg);
    thread_exit();
}

void* TCB::operator new(size_t size) {
    size_t block = size;
    if (block % MEM_BLOCK_SIZE==0)block=size/MEM_BLOCK_SIZE;
    else block=(size/MEM_BLOCK_SIZE)+1;
    void* pointer = MemoryAllocator::mem_alloc(block);
    return pointer;
}


void TCB::operator delete(void *adress) {
    MemoryAllocator::mem_free(adress);
}

void TCB::join(TCB *handle) {
    if (!handle->isFinished()) {
        setBlocked(true);
        handle->add_blocked(TCB::running);
        dispatch();
    }
}

int TCB::exit() {
    if (TCB::running->isFinished() || TCB::running==nullptr){return -1;}
    TCB::running->setFinished(true);
    TCB* curr;
    while(1)
    {
        curr = TCB::running->remove_blocked();
        if (curr== nullptr)break;
        curr->setBlocked(false);
        Scheduler::put(curr);
    }

    dispatch();
    return 0;
}

void TCB::add_blocked(TCB* thread) {
    TCB* curr = blokirani_head;
    if (curr== nullptr)
    {
        blokirani_head=thread;
    }
    else
    {
        while (curr->next!= nullptr)
        {
            curr = curr->next;
        }
        curr->next=thread;
    }

}

TCB* TCB::remove_blocked()
{
    TCB* curr = blokirani_head;
    if (curr== nullptr)return nullptr;
    blokirani_head = blokirani_head->next;
    curr->next= nullptr;
    return curr;
}

int TCB::start(TCB *handle)
{
    if (!handle->isStarted()) {
        handle->setStarted(true);
        Scheduler::put(handle);
        return 0;
    }
    return -1;
}

TCB *TCB::makeThread(TCB::Body body, void *arg, uint64 *stack, bool system_thread) {
   TCB* curr = new TCB(body,arg,stack,system_thread);
    curr->setStarted(false);
    return curr;
}
