AS=nasm
RAW=-f bin

CC=gcc
FLAGS=-ffreestanding -c
LD=ld
LFLAGS=-Ttext 0x1000 --oformat binary

#C files

#assembly libraries
ASDIR=asm
PUTS=print_string.asm
PUTS32=print32.asm
GDT=gdt.asm
SWTCH=switch_to_pm.asm
DSK=load.asm

ASFILES=${ASDIR}/${PUTS} ${ASDIR}/${PUTS32} ${ASDIR}/${GDT} ${ASDIR}/${SWTCH} ${ASDIR}/${DSK}

BOOT_IMG=boot_sect.img

all: boot_sect kernel.bin

kernel.bin: kernel.c
	${CC} ${FLAGS} kernel.c -o kernel.o && ${LD} -o $@ ${LFLAGS} kernel.o

boot_sect: boot.asm ${ASFILES} kernel.bin
	$(AS) $(RAW) $< -o $(BOOT_IMG)

clean:
	rm *.o *.bin
