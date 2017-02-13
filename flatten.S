        .global main

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

        # parse_args(int argc, char **argv)
        mov argc, %rdi # 1st argument - argc
        mov argv, %rsi  # 2nd argument - argv

        call flatten_args

        # Restore stack
        add $8, %rsp
        pop %rsi
        pop %rdi

        # A call to `flatten_args` puts whatever it returns
        # in %rax. Process that.
        # This is currently stored in `flatstr`.
        mov %rax, flatstr

        # Return
        ret

        .data
argc:           .quad 0
argv:           .quad 0
flatstr:        .quad 0
