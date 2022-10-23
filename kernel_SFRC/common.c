// common.c -- Определения некоторых глобальных функций.
// Из руководства по разработке ядра James Molloy

#include "includes/common.h"

// Запись байта в указанный порт.
void outb(u16int port, u8int value) {
    asm volatile ("outb %1, %0" : : "dN" (port), "a" (value));
}

u8int inb(u16int port) {
   u8int ret;
   asm volatile("inb %1, %0" : "=a" (ret) : "dN" (port));
   return ret;
}

u16int inw(u16int port) {
   u16int ret;
   asm volatile ("inw %1, %0" : "=a" (ret) : "dN" (port));
   return ret;
} 