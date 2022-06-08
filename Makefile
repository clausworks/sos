kernel_path := root/boot/kernel.bin
img_file := sos.img
asm_src_files := $(wildcard *.asm)
asm_obj_files := $(patsubst %.asm, %.o, $(asm_src_files))
c_hdr_files := $(wildcard *.h)
c_src_files := $(wildcard *.c)
c_obj_files := $(patsubst %.c, %.o, $(c_src_files))
linker_script := linker.ld
grub_config := root/boot/grub/grub.cfg
kernel=root/boot/kernel.bin

.PHONY: all clean img run

all: $(img_file)
build: $(kernel)

clean:
	rm -f $(img_file)
	rm -f $(kernel)
	rm -f $(asm_obj_files) $(c_obj_files)

img: $(img_file)

$(img_file): $(kernel) $(grub_config)
	sudo ./create_disk.sh $(img_file)

run: $(img_file)
	sudo qemu-system-x86_64 -s -drive format=raw,file=$(img_file) -serial stdio

$(kernel): $(linker_script) $(asm_obj_files) $(c_obj_files) $(c_hdr_files)
	x86_64-elf-ld -n -T $(linker_script) -o $(kernel) $(asm_obj_files) $(c_obj_files)

%.o: %.asm
	nasm -felf64 $< -o $@

asm_isr.asm: generate_isr.py
	python3 generate_isr.py

$(c_obj_files): $(c_src_files) $(c_hdr_files)
	x86_64-elf-gcc -g -c $(c_src_files) -Wall -Werror -mno-red-zone
