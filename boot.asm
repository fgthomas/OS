;Label offsets
[org 0x7c00]
KERNEL_OFFSET equ 0x1000

	mov [BOOT_DRIVE], dl

	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call puts

	call load_kernel

	call switch_to_pm

	jmp $

%include "asm/print_string.asm"
%include "asm/gdt.asm"
%include "asm/print32.asm"
%include "asm/switch_to_pm.asm"
%include "asm/load.asm"

[bits 16]
load_kernel:
	mov bx, MSG_LOAD_KERNEL
	call puts

	mov bx, KERNEL_OFFSET
	mov dh, 15		;want to load 15 sectors
	mov dl, [BOOT_DRIVE]
	call disk_load
	ret

[bits 64]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm

	call KERNEL_OFFSET

	jmp $
BOOT_DRIVE:
	db 0
MSG_REAL_MODE:
	db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE:
	db "Successfully landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL:
	db "Loading kernel into memory.", 0

;Set up boot sector
times 510-($-$$) db 0
dw 0xaa55
