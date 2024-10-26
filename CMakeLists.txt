cmake_minimum_required(VERSION 3.29)
project(BearOS)

set(CMAKE_CXX_STANDARD 20)
set(SOURCE_FILES main.cpp bootloader.asm)

add_executable(BearOS main.cpp
        terminal.h)
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)  # Для 64-битной архитектуры
set(CMAKE_ASM_COMPILER GAS)