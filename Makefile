AS=nasm
RAW=-f bin

#assembly libraries
PUTS=print/print_string.asm
PUTS32=print/print32.asm
GDT=gdt.asm
SWTCH=switch_to_pm.asm


BOOT_IMG=boot_sect.img

all: boot_sect

boot_sect: boot.asm ${PUTS} ${PUTS32} ${GDT} ${SWITCH}
	$(AS) $(RAW) $< -o $(BOOT_IMG)
