        org 100h

EntryPoint:
        mov ah, 09h
        mov dx, task
        int 21h
        mov ah, 0Ah
        mov dx, string
        int 21h
        mov dx, nextWord
        mov ah, $09
        int 21h
        mov ch, byte[string + 5]
        mov cl, byte[string + 6]
        mov byte[string + 5], cl
        mov byte[string + 6], ch
        mov cl, byte[string + 7]
        mov bh, byte[string + 9]
        mov bl, byte[string + 10]
        sub bl, bh
        add bl, cl
        mov byte[string + 2], bl
        mov dx, string + 2
        mov ah, $09
        int 21h
        mov ah, $08
        int 21h
        ret
nextWord db 10,13,'$'
task db 'inter a string: $'
string db 10,0,  10 dup ?, '$'