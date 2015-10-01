%define     i   ebp-4
%define     x   ebp+8

segment .data
    format  db  "%d", 10, 0         ; 10 = '\n'

segment .text
    global  f
    extern  printf

f:
    enter   4, 0                    ; allocate storage for i

    mov     dword [i], 0
lp:
    mov     eax, [i]
    cmp     eax, [x]
    jnl     quit

    push    eax
    push    format
    call    printf
    add     esp, 8

    push    dword [i]              
    call    f
    pop     eax

    inc     dword [i]           
    jmp     short lp

quit:
    leave
    ret
