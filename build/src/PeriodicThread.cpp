//
// Created by os on 5/31/23.
//
#include "../h/syscall_cpp.hpp"

PeriodicThread::PeriodicThread(time_t period):Thread(PeriodicThread::wrapper,this),period(period){}

void PeriodicThread::wrapper(void *arg) {
    PeriodicThread* t = (PeriodicThread*) arg;
    while (t->period>0) {
        time_sleep(t->period);
        t->periodicActivation();
    }
}

void PeriodicThread::terminate() {period=0;}
