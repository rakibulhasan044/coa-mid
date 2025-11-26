.model small
.stack 100H
.data
m db 'bye bye $'
.code
main proc
    ;1->single key input
    ;2->single character output
    ;9->character string output

    mov ax,@data
    mov ds,ax

    mov ah, 9
    lea dx, m
    int 21h

    mov cx, 10
    mov ah,2
    mov dl, '0'

    level1:
    int 21h
    inc dl
    loop level1


    exit:
    mov ah, 4ch
    int 21h
    main endp
end main