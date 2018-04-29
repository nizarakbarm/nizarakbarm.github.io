segment .data
    a db 0x55
    b db 0x55
segment .text
global _start

_start:
    mov eax,[a]

    mov eax,[b]

    mov rax,1
    int 0x80
