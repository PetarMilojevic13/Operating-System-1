//
// Created by os on 5/27/23.
//

#include "../h/_Buffer.hpp"


void *_Buffer::operator new(size_t size) {


    size_t block = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    void* pointer = MemoryAllocator::mem_alloc(block);
    return pointer;
}


_Buffer::~_Buffer()
{
    delete mutex;
    delete space_available;
    delete item_available;
}

void _Buffer::operator delete(void *adress) {
    MemoryAllocator::mem_free(adress);
}

_Buffer::_Buffer():head(0),tail(0),size(0) {
    mutex = _sem::createSemaphore(1);
    space_available = _sem::createSemaphore(256);
    item_available = _sem::createSemaphore(0);
}



void _Buffer::put(char c) {
    space_available->wait();
    mutex->wait();
    niz[tail] = c;
    tail = (tail + 1) % 256;
    size++;
    mutex->signal();
    item_available->signal();
}

char _Buffer::get()
{
        item_available->wait();
        mutex->wait();
        char c = niz[head];
        head = (head + 1) % 256;
        size--;
        mutex->signal();
        space_available->signal();
        return c;
}

int _Buffer::count() {
    return size;
}
