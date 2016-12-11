[bits 32]
;constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

;prints a null terminated string at ebx
print_string_pm:
	pusha
	mov edx, VIDEO_MEMORY		;edx is start of video memory

print_string_pm_loop:
	mov al, [ebx]			;store first char of string in al
	mov ah, WHITE_ON_BLACK		;store attribute in ah

	cmp al, 0
	je print_string_pm_loop_end

	mov [edx], ax			;store character in memory

	add ebx, 1
	add edx, 2

	jmp print_string_pm_loop

print_string_pm_loop_end:
	popa
	ret
