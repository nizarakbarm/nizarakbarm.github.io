segment .data
    a db 0x55,0x00,0x00,0x00
    b db 0x55,0x00,0x00,0x00
segment .text
global _start

_start:
    mov eax,[a]

    mov eax,[b]

    mov rax,1
    int 0x80
