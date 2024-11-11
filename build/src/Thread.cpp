//
// Created by os on 5/19/23.
//
#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void *), void *arg) :body(body),arg(arg){
    //Pravimo nit ali je ne stavljamo u Scheduler, za to imamo posebni sistemski poziv!
    thread_make(&myHandle, body, arg);
}

Thread::Thread(): Thread(Thread::wrapper, this){}

void Thread::wrapper(void *thr)
{
    ((Thread*)thr)->run();
}

int Thread::start ()
{
    // Sistemski poziv dodat za thread_start()
   return thread_start(myHandle);
}

void Thread::join()
{
    thread_join(myHandle);
}

void Thread::dispatch ()
{
    thread_dispatch();
}

int Thread::sleep (time_t vreme)
{
    return time_sleep(vreme);
}

Thread::~Thread() {
    // Ukoliko nit jos uvek radi cekamo nit da zavrsi!
    thread_join(myHandle);
    thread_delete(myHandle);
}
