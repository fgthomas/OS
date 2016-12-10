;Label offsets
[org 0x7c00]

;print hello then loop forever
	mov ah, 0x0e ;int 10/ah = 0eh -> teletype routine
	
	mov al, [val]
	int 0x10

val:
	db 'X'

jmp $ ;loop forever

;Set up boot sector
times 510-($-$$) db 0
dw 0xaa55
