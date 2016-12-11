;prints the dw at dx
print_hex:
	;print out '0x'
	mov ah, 0xe
	mov al, 0x30
	int 0x10
	mov ah, 0xe
	mov al, 0x78
	int 0x10

;prints out 4, 4 bit hex values
	mov bx, 4
print_hex_loop:
	push bx
	push dx
	and dx, 0xf000
	shr dx, 12
	cmp dx, 0xa
	jge hex_num

	;bits are 0-9
	add dl, 0x30
	mov ah, 0xe
	mov al, dl
	int 0x10
	jmp print_hex_end_loop

hex_num:
	;bits are A-F
	add dl, 0x37
	mov ah, 0xe
	mov al, dl
	int 0x10
	
print_hex_end_loop:
	pop dx
	shl dx, 4
	pop bx
	dec bx
	cmp bx, 0
	jne print_hex_loop

	;new line
	mov al, 0xd
	int 0x10
	mov ah, 0xe
	mov al, 0xa
	int 0x10

	ret
