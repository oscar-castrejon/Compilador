pila segment para stack 'stack'
db 1000 dup(?)
pila ends
datos segment para public 'data'
no_val DB 'Dato invalido, se espera un numero. Terminando programa$'
a DW 0
b DB 61,?,61 DUP(?)
o DB ' Ingrese_el_numero_de_veces $'
u DB ' Ingrese_el_dato_a_repetir $'
n DB ' Se_va_a_ejecutar_el_ciclo: $'
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
lea dx,b
mov ah,0ah
int 21h
lea bx,b
inc bx
mov cx,[bx]
mov ch,0
ciclo0:
inc bx
mov dl,[bx]
cmp dl,48
jb sale0
cmp dl,57
ja sale0
loop ciclo0
mov ax,byte ptr 0
jmp fin0
sale0:
mov ax,1
fin0:
cmp ax,byte ptr 1
jne val0
lea dx,no_val
mov ah,9
int 21h
mov ah,4ch
int 21h
val0:
mov ah,2
mov bh,0
mov dh,2
mov dl,25
int 10h
mov ax,0
mov dx,16
cmp ax,dx
JA salto1
lea bx,b
inc bx
mov cl,[bx]
mov ch,0
push cx
cdr1:
inc bx
sub [bx], byte ptr 30h
loop cdr1
lea bx,b+2
mov al,[bx]
mov di,0ah
mov ah,0
pop cx
cmp cl,1
je sale1
dec cx
mys1:
inc bx
mul di
mov dl,[bx]
mov dh,0
add ax,dx
loop mys1
sale1:
mov cx, ax
mov dh,3
repite1: 
push dx
mov ah,2
mov bh,0
mov dl,25
int 10h
push cx
mov ah,2
mov bh,0
mov dh,4
mov dl,24
int 10h
lea dx,o
mov ah,9
int 21h
pop cx
pop dx
inc dh
loop repite1
salto1:
	ret
p0	endp


codigo ends
	end p0
