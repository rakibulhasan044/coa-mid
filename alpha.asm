.model small
.stack 100h
.code

main proc
    ; Read three chars
    mov ah, 1
    int 21h
    mov bl, al      ; First in BL
    int 21h
    mov bh, al      ; Second in BH
    int 21h
    mov cl, al      ; Third in CL

    ; Bubble sort: Pass 1 (compare BL-BH, BH-CL)
    cmp bl, bh
    jle no_swap1    ; If BL <= BH, no swap
    xchg bl, bh     ; Swap BL and BH
no_swap1:
    cmp bh, cl
    jle no_swap2    ; If BH <= CL, no swap
    xchg bh, cl     ; Swap BH and CL
no_swap2:

    ; Pass 2 (compare BL-BH again, as CL may have bubbled)
    cmp bl, bh
    jle no_swap3
    xchg bl, bh
no_swap3:

    ; Now print in order: BL (min), BH (mid), CL (max)
    mov ah, 2
    mov dl, bl
    int 21h
    mov dl, bh
    int 21h
    mov dl, cl
    int 21h

exit:
    mov ah, 4ch
    int 21h
main endp
end main