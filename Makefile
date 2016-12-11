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

#binary director
BINDIR=bin
SRCDIR=src

ASFILES=${ASDIR}/${PUTS} ${ASDIR}/${PUTS32} ${ASDIR}/${GDT} ${ASDIR}/${SWTCH} ${ASDIR}/${DSK}

all: os.img boot_sect.bin kernel.bin

kernel.bin: ${SRCDIR}/kernel.c
	${CC} ${FLAGS} ${SRCDIR}/kernel.c -o kernel.o && ${LD} -o ${BINDIR}/$@ ${LFLAGS} kernel.o

boot_sect.bin: boot.asm ${ASFILES} kernel.bin
	$(AS) $(RAW) $< -o ${BINDIR}/$@

os.img: boot_sect.bin kernel.bin
	cd ${BINDIR} && cat $^ > ../$@ && cd ..

clean:
	rm *.o *.bin os.img
