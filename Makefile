all:
	nasm -f bin src/boot.asm -o bin/boot.bin

clean:
	rm bin/boot.bin

kill: 
	pkill -f "qemu.*-vnc.*:1" || true

run:
	qemu-system-x86_64 -drive format=raw,file=bin/boot.bin -vnc :1 &
	sleep 2
	vncviewer localhost:5901
