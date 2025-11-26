.model small
.stack 100h
.data
    prompt db "ENTER TWO ALPHABETS: $"
    out_msg db "THE CORRECT ORDER IS: $"
    newline db 10, 13, '$'
.code

main proc
    mov ax, @data
    mov ds, ax

    ; Part a: Display '@' 5 times using loop
    mov cx, 5
print_loop:
    mov ah, 2
    mov dl, '@'
    int 21h
    loop print_loop

    ; Newline after '@@@@@'
    mov ah, 9
    lea dx, newline
    int 21h

    ; Part b: Print prompt and read 2 alphabets with space
    mov ah, 9
    lea dx, prompt
    int 21h

    mov ah, 1
    int 21h
    mov bl, al  ; First alphabet in BL

    ; Print space between inputs
    mov ah, 2
    mov dl, 32
    int 21h

    mov ah, 1
    int 21h
    mov bh, al  ; Second alphabet in BH

    ; Newline after input
    mov ah, 9
    lea dx, newline
    int 21h

    ; Part c: Print output message, then display in correct order using XCHG
    mov ah, 9
    lea dx, out_msg
    int 21h

    cmp bl, bh
    jle no_swap
    xchg bl, bh  ; Swap if BL > BH
no_swap:
    mov ah, 2
    mov dl, bl
    int 21h
    mov dl, bh
    int 21h

    ; Newline after output (for clean display)
    mov ah, 9
    lea dx, newline
    int 21h

exit:
    mov ah, 4ch
    int 21h
main endp
end main