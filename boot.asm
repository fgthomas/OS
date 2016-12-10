;print hello then loop forever
	mov ah, 0x0e ;int 10/ah = 0eh -> teletype routine
	
	mov al, 'H'
	int 0x10
	mov al, 'e'
	int 0x10
	mov al, 'l'
	int 0x10
	mov al, 'l'
	int 0x10
	mov al, 'o'
	int 0x10
	mov al, 0xa
	int 0x10
	mov al, 0xd
	int 0x10

jmp $ ;loop forever

;Set up boot sector
times 510-($-$$) db 0
dw 0xaa55
