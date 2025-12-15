#!/bin/bash

nasm -f bin src/boot.asm -o bin/boot.bin
qemu-system-x86_64 -drive format=raw,file=bin/boot.bin -vnc :1 &
sleep 2
vncviewer localhost:5901
wait
