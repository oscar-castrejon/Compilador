pila segment para stack 'stack'
db 1000 dup(?)
pila ends
datos segment para public 'data'
b DB '8$'
n DB 61,?,61 DUP(?)
k DB ' Hola $'
p DB '17$'
datos ends
extra segment para public 'data'
extra ends
assume	cs:codigo, ds:datos, ss:pila,	es:extra
public p0
codigo segment para public 'code'
p0	proc far 
push ds
mov ax, 0
push ax
mov ax,datos
mov ds,ax
mov ax, extra
mov es,ax
mov ah,06
mov al,0
mov bh,7
mov ch,00
mov cl,0
mov dh,24
mov dl,79
int 10h
mov ah,2
mov bh,0
mov dh,1
mov dl,25
int 10h
lea dx,n
mov ah,0ah
int 21h
mov ah,2
mov bh,0
mov dh,2
mov dl,25
int 10h
lea bx,n
inc bx
mov cx,[bx]
mov ch,0
Ln1:
inc bx
mov dl,[bx]
mov ah,2
int 21h
loop Ln1
mov ah,2
mov bh,0
mov dh,3
mov dl,24
int 10h
lea dx,k
mov ah,9
int 21h
mov ah,2
mov bh,0
mov dh,4
mov dl,25
int 10h
lea dx,n
mov ah,0ah
int 21h
mov ah,2
mov bh,0
mov dh,5
mov dl,25
int 10h
lea dx,b
mov ah,9
int 21h
mov ah,2
mov bh,0
mov dh,6
mov dl,25
int 10h
lea bx,n
inc bx
mov cx,[bx]
mov ch,0
Ln5:
inc bx
mov dl,[bx]
mov ah,2
int 21h
loop Ln5
	ret
p0	endp


codigo ends
	end p0
