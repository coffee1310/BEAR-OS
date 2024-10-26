CXX = clang++
CXXFLAGS = -Wall -O2 -ffreestanding -nostdlib -std=c++20
LDFLAGS = -nostdlib -T linker.ld
TARGET = os_image.bin
SRC = main.cpp
C_SRC = terminal.c
BOOTLOADER_SRC = bootloader.asm
BOOTLOADER_BIN = bootloader.bin
KERNEL_BIN = kernel.bin

all: $(TARGET)

# 1. Собираем загрузчик
$(BOOTLOADER_BIN): $(BOOTLOADER_SRC)
	nasm -f bin $(BOOTLOADER_SRC) -o $(BOOTLOADER_BIN)

# 2. Компилируем main.cpp и terminal.c в объектные файлы
kernel.o: $(SRC)
	$(CXX) $(CXXFLAGS) -c $(SRC) -o kernel.o

terminal.o: $(C_SRC)
	clang -Wall -O2 -ffreestanding -nostdlib -c $(C_SRC) -o terminal.o

# 3. Линкуем объектные файлы в бинарный файл ядра
$(KERNEL_BIN): kernel.o terminal.o
	ld -T linker.ld -o $(KERNEL_BIN) kernel.o terminal.o

# 4. Создаем финальный образ, объединяя загрузчик и ядро
$(TARGET): $(BOOTLOADER_BIN) $(KERNEL_BIN)
	cat $(BOOTLOADER_BIN) $(KERNEL_BIN) > $(TARGET)

# Очистка
clean:
	rm -f $(BOOTLOADER_BIN) $(KERNEL_BIN) $(TARGET) kernel.o terminal.o
