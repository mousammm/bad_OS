ASM=nasm

SRC_DIR=src
BUILD_DIR=build

all: $(BUILD_DIR)/main.img 

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/main.img: $(BUILD_DIR)/main.bin 
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main.img
	truncate -s 1440k $(BUILD_DIR)/main.img

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.s | $(BUILD_DIR)
	$(ASM) $(SRC_DIR)/main.s -f bin -o $(BUILD_DIR)/main.bin

run:
	qemu-system-i386 -fda $(BUILD_DIR)/main.img

clean:
	rm -rf $(BUILD_DIR)/
