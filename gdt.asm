;GDT
gdt_start:

gdt_null:	;the mandatory null descriptor
	dd 0x0
	dd 0x0

gdt_code:		;the code segment descriptor
			;base= 0x0 limit =0xfffff
			;first flags: (present)1 (privalege)00 (descriptor type) 1 -> 1001b
			;type flags: (code) 1 (conforming) 0 (readable) 1 (accessed) 0 -> 1010b
			;2nd flags: (granularity) 1 (32-bit default) 1 (64-bit seg) 0 (AVL) 0 -> 1100b
	dw 0xffff	;limit (bits 0-15)
	dw 0x0		;Base (bits 0-15)
	db 0x0		;Base (bits 16-23)
	db 10011010b	;first flags, type flags
	db 11101111b	;second flags, limit (bits 16-19)
	db 0x0

gdt_data:
			;same as code segment except for the type flags
			;type flags (code) 0 (expand down) 0 (writable) 1 (accessed) 0 -> 0010b
	dw 0xffff	;limit (bits 0-15)
	dw 0x0		;base (bits 0-15)
	db 0x0		;base (bits 16-23)
	db 10010010b	;first flags, type flags
	db 11101111b	;second flags, limit (bits 16-19)
	db 0x0		;base (bits 24-31)

gdt_end:		;need calculate size

gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start

;define some handy dandy constants
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
