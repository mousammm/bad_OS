build:
	mkdir -p build

all: 
	nasm src/boot.asm -f bin -o build/boot.bin

run:
	qemu-system-x86_64 -fda build/boot.img

clean:
	rm -rf build/*
