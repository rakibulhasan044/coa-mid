.model small
.stack 100h
.data
    prompt db "Input two numbers: $"
    msg db 13, 10, "Largest number: $"
.code

main proc
    mov ax, @data
    mov ds, ax

    ; Print prompt
    mov ah, 9
    lea dx, prompt
    int 21h

    ; Read first digit
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 30h  ; Convert to numeric

    ; Print space
    mov ah, 2
    mov dl, 32
    int 21h

    ; Read second digit
    mov ah, 1
    int 21h
    mov bh, al
    sub bh, 30h  ; Convert to numeric

    ; Newline after inputs
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; Compare and branch
    cmp bl, bh
    jg l1

l2:
    ; Print message
    mov ah, 9
    lea dx, msg
    int 21h

    ; Convert and print BH (larger)
    add bh, 30h
    mov ah, 2
    mov dl, bh
    int 21h
    jmp exit

l1:
    ; Print message
    mov ah, 9
    lea dx, msg
    int 21h

    ; Convert and print BL (larger)
    add bl, 30h
    mov ah, 2
    mov dl, bl
    int 21h

exit:
    ; Newline after output
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; Terminate
    mov ah, 4ch
    int 21h
main endp
end main