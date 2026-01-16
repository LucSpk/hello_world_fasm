format ELF64 executable

SYS_write = 1
SYS_exite = 60

x = 1

macro write fd, buf, count {
    mov rax, SYS_write
    mov rdi, fd
    mov rsi, buf
    mov rdx, count
    syscall
}

macro exit code {
    mov rax, SYS_exite
    mov rdi, code
    syscall
}

x = x + 2

segment readable executable
entry main

main: 
    
repeat x
    write 1, msg, msg_len
end repeat

    exit 0
    

segment readable writeable
msg db "Hello, World!", 10
msg_len = $ - msg