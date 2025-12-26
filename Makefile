ASM=nasm
SRC_DIR=src
BUILD_DIR=build

all: $(BUILD_DIR)/boot.img

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/boot.img: $(BUILD_DIR)/boot.bin
	cp $(BUILD_DIR)/boot.bin $(BUILD_DIR)/boot.img
	truncate -s 1440k $(BUILD_DIR)/boot.img

$(BUILD_DIR)/boot.bin: $(SRC_DIR)/boot.s | $(BUILD_DIR)
	$(ASM) $(SRC_DIR)/boot.s -f bin -o $(BUILD_DIR)/boot.bin

run:
	qemu-system-i386 -fda $(BUILD_DIR)/boot.img

clean:
	rm -rf $(BUILD_DIR)/*
