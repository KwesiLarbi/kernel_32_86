#!/bin/bash

if ! [ -d isodir/boot/grub ]; then 
    mkdir -p isodir/boot/grub
fi

cp myos.bin isodir/boot/myos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o myos.iso isodir