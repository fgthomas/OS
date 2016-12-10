AS=nasm
RAW=-f bin

BOOT_IMG=boot_sect.img

all: boot_sect

boot_sect: boot.asm
	$(AS) $(RAW) $< -o $(BOOT_IMG)
