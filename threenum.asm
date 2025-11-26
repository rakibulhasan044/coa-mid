.model small
.stack 100H
.code

main proc

    mov ah,1
    int 21H
    mov bl, al
    int 21H
    mov bh, al
    int 21H
    mov cl, al

    cmp bl, bh
    jge a

    b:
    cmp bh, cl
    jge c
    mov ah,2
    mov dl, cl
    int 21H
    jmp exit

    c:
    mov ah, 2
    mov dl, bh
    int 21H
    jmp exit

    a:
    cmp bl,cl
    jge d
    mov ah,2
    mov dl, cl
    int 21H
    jmp exit

    d:
    mov ah,2
    mov dl, bl
    int 21H

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main



    