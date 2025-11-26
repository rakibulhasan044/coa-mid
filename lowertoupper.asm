.model small
.stack 100H
.data
    a db 'Lower from $'
    b db 'Upper from $'
    newline db 10, 13, '$'

.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, a
    int 21h

    mov ah, 1
    int 21h
    mov bl,al

    mov ah,9
    lea dx, newline
    int 21h

    mov ah, 2
    add bl, 32
    mov dl, bl
    int 21h
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
