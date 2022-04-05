kernel_path := root/boot/kernel.bin
img_file := sos.img
assembly_source_files := $(wildcard *.asm)
assembly_object_files := $(patsubst %.asm, %.o, $(assembly_source_files))
linker_script := linker.ld
grub_config := root/boot/grub/grub.cfg
kernel=root/boot/kernel.bin

.PHONY: all clean img run

all: $(img_file)
build: $(kernel)

clean:
	rm -f $(img_file)
	rm -f $(kernel)
	rm -f $(assembly_object_files)

img: $(img_file)

$(img_file): $(kernel) $(grub_config)
	sudo ./create_disk.sh $(img_file)

run: $(img_file)
	sudo qemu-system-x86_64 -drive format=raw,file=$(img_file)

$(kernel): $(linker_script) $(assembly_object_files)
	x86_64-elf-ld -n -T $(linker_script) -o $(kernel) $(assembly_object_files)

%.o: %.asm
	nasm -felf64 $< -o $@
