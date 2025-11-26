.model small
.stack 100H
.data
    newline db 10,13, '$'
    a db 'Enter number one :$'
    b db 10,13, 'enter number two :$'
.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, a
    int 21h

    mov ah, 9
    lea dx, b
    int 21h

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main

