.model small
.stack 100H
.data
    msg db ?
    newline db 10, 13, '$'
.code
main proc

    mov ax, @data
    mov ds, ax
    
    mov ah,1
    int 21h
    mov bl, al

    mov ah, 1
    int 21h
    mov bh, al

    mov ah, 1
    int 21h
    mov cl, al

    sub bl, 30H
    sub bh, 30H
    sub cl, 30H
    add bl, bh
    add bl, cl

    add bl,30h

    mov msg, bl

    mov ah, 9
    lea dx, newline
    int 21h

    mov ah, 2
    mov dl, msg
    int 21h

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main


