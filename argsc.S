        /*
        Program to the number of command line arguments
        using printf()
        */
        .global main

        .text

        /*
        The argument count is stored in %rdi
        The pointer to the argument vector is stored in %rsi

        printf() takes variable args and is structured:

        rdi - takes the format string
        rax - stores the number of arguments
        rsi - stores the actual argument to print
              (count in our case)
        */
main:
        dec %rdi
        mov %rdi, count
        mov $argc_str, %rdi
        mov count, %rsi
        xor %rax, %rax
        call printf
        ret

argc_str:
        .asciz "%d\n"

        .data
count:  .quad 0
