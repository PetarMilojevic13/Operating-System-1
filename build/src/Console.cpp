//
// Created by os on 5/30/23.
//
#include "../h/syscall_cpp.hpp"


char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
