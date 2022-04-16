.model tiny
.data
	fil1 db 'File_1.txt',0
	fil2 db 'File_2.txt',0
	dat1 db 'Aditya Rao'
	new1 db 0dh, 0ah
	dat2 db '2019B3A30576P'
	new2 db 0dh, 0ah
	handle1 dw ?
	handle2 dw ?
	stored db 13 dup(?)
	ans db 50 dup(?)

.code
.startup
	;create file1

	mov ah, 3ch
	mov cx, 0
	lea dx, fil1
	int 21h
	mov handle1, ax

	;create file2

	mov ah, 3ch
	lea dx, fil2
	int 21h
	mov handle2, ax

	;write name in file1

	mov bx, handle1
	lea dx, dat1
	mov cx, 12
	mov ah, 40h
	int 21h

	;close file1

	mov ah,3eh
	int 21h

	;write id in file2

	mov bx, handle2
	lea dx, dat2
	mov cx, 15
	mov ah, 40h
	int 21h

	;moving file pointer to start

	mov bx, handle2
	mov ah, 42h
	mov al, 0h
	mov dx, 0h
	mov cx, 0h
	int 21h

	;reading file2
	mov bx, handle2
	mov ah, 3fh
	mov cx, 13
	lea dx, stored
	int 21h

	;close file2

	mov ah,3eh
	int 21h

	;opening file1
	
	mov ah, 3dh
	mov al, 02h
	lea dx, fil1
	int 21h
	mov handle1, ax
	
	;moving file pointer to end

	mov bx, handle1
	mov ah, 42h
	mov al, 02h
	mov dx, 0h
	mov cx, 0h
	int 21h
	
	;append contents of file 2
	mov ah, 40h
	mov bx, handle1
	mov cx, 13
	lea dx, stored
	int 21h

	;moving file pointer to start

	mov bx, handle1
	mov ah, 42h
	mov al, 0h
	mov dx, 0h
	mov cx, 0h
	int 21h

	
	; read
	mov ah, 3fh
	mov bx, handle2
	mov cx, 28h
	lea dx, ans
	int 21h

	mov cx, ax
	mov bx, 02h
	lea dx, ans
	mov ah, 40h
	int 21h


	;close file1
	mov bx, handle1
	mov ah,3eh
	int 21h	

	;close file2
	mov bx, handle2
	mov ah,3eh
	int 21h	
	
	
.exit
end
