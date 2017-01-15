        /*
        Program to print the command line arguments
        using puts()
        */
        .global main

        .text

main:
        # We dont want to print the program name
        # So we skip that
        dec %rdi
        mov %rdi, count
        add $8, %rsi
        mov %rsi, argv

        jmp parse_args


parse_args:
        /*
        puts() needs it's arguments in %rdi
        %rsi stores the argument vector pointer
        */

        # Save stack
        push %rdi
        push %rsi
        sub  $8, %rsp #align stack

        /*
        %rsi contains the address to the string
        (%rsi) gives the contents.
        */

        mov  (%rsi), %rdi
        call puts

        # Restore stack
        add  $8, %rsp
        pop  %rsi
        pop  %rdi

        # Move to the next argument in the argument vector
        add  $8, %rsi
        dec  %rdi
        jnz  parse_args

        ret
format:
        .asciz  "%s\n"

argc_str:
        .asciz "%d\n"

        .data
count: .quad 0
argv:  .quad 0
