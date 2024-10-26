// main.cpp

#include "terminal.h"


extern "C" void kernel() {
    // Пример вызова функции из terminal.c
    terminal_initialize();
    terminal_writestring("Hello, Kernel!");
}
