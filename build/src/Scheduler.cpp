//
// Created by os on 4/28/23.
//


#include "../h/Scheduler.hpp"



TCB* Scheduler:: head = nullptr;
TCB* Scheduler:: tail = nullptr;
int Scheduler:: count = 0;

TCB *Scheduler::get()
{
    if (head== nullptr)return nullptr;
    else
    {
        TCB* curr = head;
        head = head->next;
        count--;
        if (head== nullptr)tail= nullptr;
        curr->next= nullptr;
        return curr;
    }

}

void Scheduler::put(TCB *data)
{
    if (head == nullptr)
    {
        head = data;
        count++;
        tail = data;
        data->next= nullptr;
    }
    else
    {
        tail->next = data;
        tail = data;
        count++;
        data->next= nullptr;
    }
}

