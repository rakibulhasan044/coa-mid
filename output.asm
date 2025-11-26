.model small
.stack 100H
.data
    a db 'hello$'
    b db 'best$'
    c db 'friend$'
    d equ 10
    e equ 13
.code
main proc
    mov ax, @data
    mov ds, ax
    mov cx,5

    aa:
    lea dx,a
    mov ah,9
    int 21h

    mov ah, 2
    mov dl, d
    int 21h
    mov dl, e
    int 21h

    dec cx
    cmp cx, 3
    jg aa

    bb:
    lea dx, b
    mov ah,9
    int 21h

    mov ah, 2
    mov dl, d
    int 21h
    mov dl, e
    int 21h

    dec cx
    cmp cx, 0
    jnle bb

    lea dx,c
    mov ah,9
    int 21h

    mov ah, 2
    mov dl, d
    int 21h
    mov dl, e
    int 21h

    exit:
    lea dx, c
    mov ah, 9
    int 21h
    mov ah,4ch
    int 21h

main endp
end main