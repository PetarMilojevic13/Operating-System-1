//
// Created by os on 4/28/23.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_H
#define PROJECT_BASE_V1_1_SYSCALL_C_H

#include "../lib/hw.h"




//Memorija

static const uint64 MEM_ALLOC=0x01;
static const uint64 MEM_FREE=0x02;

void* mem_alloc (size_t size);

int mem_free (void*);

//Niti

class TCB;
typedef TCB* thread_t;

static const uint64 THREAD_CREATE=0x11;
static const uint64 THREAD_EXIT=0x12;
static const uint64 THREAD_DISPATCH=0x13;
static const uint64 THREAD_JOIN=0x14;
static const uint64 THREAD_START=0x15;
static const uint64 THREAD_MAKE=0x16;
static const uint64 THREAD_DELETE=0x17;

int thread_create (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

int thread_exit ();

void thread_dispatch ();

void thread_join (
        thread_t handle
);

// Poziv dodat za Thread C++ API

int thread_start (thread_t handle);

// Poziv dodat za Thread C++ API

int thread_make(
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

// Poziv dodat za Thread C++ API

void thread_delete(thread_t handle);


//Semafori

class _sem;
typedef _sem* sem_t;

static const uint64 SEM_OPEN=0x21;
static const uint64 SEM_CLOSE=0x22;
static const uint64 SEM_WAIT=0x23;
static const uint64 SEM_SIGNAL=0x24;


int sem_open (
        sem_t* handle,
        unsigned init
);


int sem_close (sem_t handle);

int sem_wait (sem_t id);

int sem_signal (sem_t id);


//Uspavljene niti

static const uint64 TIME_SLEEP=0x31;

typedef unsigned long time_t;
int time_sleep (time_t);


//Ulaz izlaz

static const uint64 GETC=0x41;
static const uint64 PUTC=0x42;

const int EOF = -1;
char getc ();

void putc (char);

#endif //PROJECT_BASE_V1_1_SYSCALL_C_H
