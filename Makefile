all:
	gcc -m32 -fno-stack-protector -fno-builtin -c src/kernel.c -o build/kernel.o
	nasm -f elf32 src/boot.s -o build/boot.o
	grub-mkrescue -o build/badOs.iso badOS/

run:
	qemu-system-i386 build/badOs.iso 

clean:
	rm -rf build/*
