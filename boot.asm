;Label offsets
[org 0x7c00]

	mov bx, hello
	call puts

	jmp $ ;loop forever

%include "print/print_string.asm" ;contains print_string function

;Data
hello:
	db "hello world!", 0

;Set up boot sector
times 510-($-$$) db 0
dw 0xaa55
