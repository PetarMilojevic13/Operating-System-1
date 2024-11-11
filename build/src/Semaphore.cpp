//
// Created by os on 5/30/23.
//
#include "../h/syscall_cpp.hpp"

Semaphore::Semaphore(unsigned int init) {
    myHandle = nullptr;
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}


