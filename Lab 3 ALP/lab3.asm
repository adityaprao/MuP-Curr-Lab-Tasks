.model tiny
.386
.data
	len equ 10
	NM db 'Aditya Rao' ; name cannot be used as it is a keyword
	FLIP db 10 DUP(?) 

.code 
.startup
    mov cx,10
    mov bx,2019h
    mov es,bx
    lea si,NM
    mov di,0576h
    add di,len
x1: lodsb               ; loads original name to register
    mov es:[di],al
    dec di
    dec cx
    jnz x1
.exit
END