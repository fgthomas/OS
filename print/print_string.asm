;print out the string at bx
;after call bx points to end of string
puts:
	mov ah, 0xe
	xor cl, cl
	cmp cl, [bx]
	je puts_end
	mov al, [bx]
	int 0x10
	inc bx
	jmp puts
puts_end:
	;print CR+LF
	mov al, 0xd
	int 0x10
	mov ah, 0xe
	mov al, 0xa
	int 0x10
	ret

