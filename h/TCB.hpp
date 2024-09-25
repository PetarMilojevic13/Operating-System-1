//
// Created by os on 4/28/23.
//


#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP

#include "../lib/hw.h"

#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"



// Thread Control Block
class TCB
{
public:


    ~TCB() {
        delete[] stack;
        }

    bool isFinished() const { return finished; }

    bool isBlocked() const { return blocked; }

    bool isStarted() const { return started; }

    bool isSystemThread() { return system_thread;}

    void setFinished(bool value) { finished = value; }

    void setBlocked (bool value) { blocked=value; }

    void setStarted(bool value) { started = value; }



    uint64 getTimeSlice() const { return timeSlice; }

    using Body = void (*)(void*);

    static TCB *createIdleThread(Body body,void* arg,uint64* stack,bool system_thread);

    static TCB *createThread(Body body,void* arg,uint64* stack,bool system_thread);

    static TCB *makeThread(Body body,void* arg,uint64* stack,bool system_thread);

    static TCB *running;

    static TCB *idle;

    static TCB *out;

    void join(TCB* handle);

    static void dispatch();

    int start(TCB* handle);

    void *operator new(size_t size);

    void operator delete(void *adress) ;


private:


    TCB(Body body,void* a,uint64* stack_space, bool kernel_thread) :
            body(body),
            arg(a),
            stack(stack_space),
            timeSlice(DEFAULT_TIME_SLICE)

            {
                finished=false;
                blocked=false;
                started=true;
                system_thread=kernel_thread;
                next=nullptr;
                blokirani_head=nullptr;
                if (body!= nullptr)
                {
                    context = {(uint64) &threadWrapper,(uint64) &stack[DEFAULT_STACK_SIZE]};
                }
                else
                {
                  context = {0,0};
                }



            };


    struct Context
    {
        uint64 ra;
        uint64 sp;
    };


    Body body;
    void* arg;

    uint64 *stack;
    Context context;
    uint64 timeSlice;
    bool finished;
    bool blocked;
    bool started;
    bool system_thread;
    TCB* next;              //Polje koje se koristi ukoliko je nit ulancana u neku ulancanu listu recimo blokirane niti za join ili u Scheduler
    TCB* blokirani_head;    //List blokiranih niti uz pomoc join-a



    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

  friend class Scheduler;
    friend class _sem;


    static uint64 timeSliceCounter;


    static int exit();



    void add_blocked(TCB* thread);

    TCB* remove_blocked();






};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP


