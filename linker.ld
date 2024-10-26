OUTPUT_FORMAT("binary")
ENTRY(kernel)
SECTIONS
{
    . = 0x1000; /* Начало загрузки вашего ядра */
    .text : { *(.text) }
    .data : { *(.data) }
    .bss : { *(.bss) }
}
