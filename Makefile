AS=nasm
RAW=-f bin

#assembly libraries
PRNT=print/print_string.asm

BOOT_IMG=boot_sect.img

all: boot_sect

boot_sect: boot.asm ${PRNT}
	$(AS) $(RAW) $< -o $(BOOT_IMG)
