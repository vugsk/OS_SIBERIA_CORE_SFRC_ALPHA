nasm -f elf32 OS/boot/boot.s -o build/kasm.o

gcc -m32 -c OS/kernel_SFRC/kernel.c -o build/kc.o
gcc -m32 -c OS/kernel_SFRC/sys.c -o build/cmd/sys.o
gcc -m32 -c OS/kernel_SFRC/common.c -o build/cmd/common.o
gcc -m32 -c OS/kernel_SFRC/monitor.c -o build/cmd/monitor.o

ld -m elf_i386 -T build/link.ld -o kernel build/kasm.o build/kc.o build/cmd/sys.o build/cmd/common.o build/cmd/monitor.o

qemu-system-i386 -kernel kernel
