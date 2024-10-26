// terminal.h
#ifndef TERMINAL_H
#define TERMINAL_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

    void terminal_initialize();
    void terminal_writestring(const char* data);

    extern int terminal_row;
    extern int terminal_column;
    extern uint8_t terminal_color;
    extern uint16_t* terminal_buffer;

#ifdef __cplusplus
}
#endif

#endif
