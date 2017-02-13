        .global main
        .global argc
        .global argv

        .text

main:
        # Save stack
        push %rdi
        push %rsi
        sub $8, %rsp

        # %rdi stores argc
        # %rsi stores argv
        mov %rdi, argc
        mov %rsi, argv

        call flatten_args

        # Restore stack
        add $8, %rsp
        pop %rsi
        pop %rdi

        # Return
        ret

        .data
argc:           .quad 0
argv:           .quad 0
