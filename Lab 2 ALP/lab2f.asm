.model tiny
.data
	array1 db '2019B3A30576'
	sz equ 12

.code
.startup

; Memory Initialisation
    lea bx,array1
    mov cl,sz
    mov ah,[bx]
    sub ah,48
    mov al,ah
    mov ch,58

x1:    add bx,1
    dec cl
    jz x2
    cmp [bx],ch
    jae x1

; Ascii Value subtract
x3:    mov ah,[bx]
    sub ah,48
    add al,ah
    jmp x1


x2:    mov dx,2019h
    mov ds,dx
    mov di,0576h
    mov [di],al
.exit
end
