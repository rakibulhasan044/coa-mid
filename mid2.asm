.model small
.stack 100H
.data
msg db 3
msg1 db ?
newline db 10,13, '$'

.code
main proc
    mov ax, @data
    mov ds, ax 

    mov ah, 2
    mov dl,msg
    int 21h

    mov ah, 9
    lea dx, newline
    int 21h

    mov ah,1
    int 21h
    mov msg1,al

    mov ah, 9
    lea dx, newline
    int 21h

    mov ah, 2
    mov dl, msg1
    int 21h


    exit:
    mov ah,4ch 
    int 21h
    main endp
end main