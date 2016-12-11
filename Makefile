AS=nasm
RAW=-f bin
ELF=-f elf64

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

all: os.img ${BINDIR}/boot_sect.bin ${BINDIR}/kernel.bin

${BINDIR}/kernel.bin: ${SRCDIR}/kernel.o ${ASDIR}/entry.o
	${LD} -o $@ ${LFLAGS} $^

${SRCDIR}/kernel.o: ${SRCDIR}/kernel.c
	${CC} ${FLAGS} $< -o $@

${ASDIR}/entry.o: ${ASDIR}/entry.asm
	${AS} ${ELF} -o $@ $<

${BINDIR}/boot_sect.bin: boot.asm ${ASFILES} ${BINDIR}/kernel.bin
	$(AS) $(RAW) $< -o $@

os.img: ${BINDIR}/boot_sect.bin ${BINDIR}/kernel.bin
	cat $^ > ../$@

clean:
	rm *.o ${BINDIR}/* ${SRCDIR}/*.o ${ASDIR}/*.o os.img
