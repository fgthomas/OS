AS=nasm
RAW=-f bin

#assembly libraries
PUTS=print/print_string.asm
PHEX=print/print_hex.asm
DSK=disk/load.asm

BOOT_IMG=boot_sect.img

all: boot_sect

boot_sect: boot.asm ${PUTS} ${PHEX} ${DSK}
	$(AS) $(RAW) $< -o $(BOOT_IMG)
