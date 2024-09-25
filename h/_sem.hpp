//
// Created by os on 5/8/23.
//

#ifndef PROJECT_BASE_V1_1__SEM_HPP
#define PROJECT_BASE_V1_1__SEM_HPP

#include "TCB.hpp"
#include "Scheduler.hpp"

class _sem
{
private:
    int val;
    bool finished;
    TCB* waiting_head;
    TCB* tail;


    _sem(unsigned init):finished(false),waiting_head(nullptr),tail(nullptr){};


    void add_thread(TCB* nit);

    TCB*  release_thread();


public:

    static _sem* createSemaphore(unsigned init);

    int wait();

    int signal();

    int close();



    ~_sem();

    void operator delete(void *adress) ;

    void *operator new(size_t size);

};

#endif //PROJECT_BASE_V1_1__SEM_HPP
