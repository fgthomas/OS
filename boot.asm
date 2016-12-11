;Label offsets
[org 0x7c00]

	mov bp, 0x8000
	mov sp, bp

	mov bx, 0x9000			;move 5 sectores to 0x9000
	mov dh, 5
	mov dl, [BOOT_DRIVE]
	call disk_load

	mov dx, [0x9000]
	call print_hex

	mov dx, [0x9200]
	call print_hex

	jmp $ ;loop forever

%include "print/print_string.asm" 	;contains print_string function
%include "disk/load.asm"		;contains disk_read function
%include "print/print_hex.asm"		;contains print_hex function

;vars
BOOT_DRIVE:
	db 0

;Data
hello:
	db "hello world!", 0

;Set up boot sector
times 510-($-$$) db 0
dw 0xaa55

;add two sectors for space
times 256 dw 0xdead
times 256 dw 0xbeef
