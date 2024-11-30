# Simple Kernel for 32-bit x86

# Compile the kernel file

`
export PREFIX="$HOME/opt/cross/install"
export TARGET=i686-elf
$PREFIX/bin/$TARGET-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
`

# Linking Kernel

`
export PREFIX="$HOME/opt/cross/install"
export TARGET=i686-elf
$PREFIX/bin/$TARGET-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
`
