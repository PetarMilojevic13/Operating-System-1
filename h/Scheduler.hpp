//
// Created by os on 4/28/23.
//


#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_SCHEDULER_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_SCHEDULER_HPP


#include "TCB.hpp"


//Klasa Scheduler napravljena je samo ulancavnjem niti u listu!

class Scheduler
{
private:


    static TCB* head;
    static TCB* tail;

    static int count;

public:
    static TCB *get();

    static void put(TCB *ccb);

};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_SCHEDULER_HPP
