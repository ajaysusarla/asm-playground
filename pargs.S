        .global main

        .text

main:
        # Save stack
        push %rdi
        push %rsi
        sub $8, %rsp

        # %rdi stores argc
        # %rsi stores argv
        # `parse_args` doesn't need the program name(argv[0]),
        # so we decrement argc(%rdi) and get the next entry in
        # the vector pointed by %rsi.
        dec %rdi
        mov %rdi, count
        add $8, %rsi
        mov %rsi, argv

        # parse_args(int argc, char **argv)
        mov count, %rdi # 1st argument - argc
        mov argv, %rsi  # 2nd argument - argv

        call parse_args

        # Restore stack
        add $8, %rsp
        pop %rsi
        pop %rdi

        # A call to `parse_args` puts whatever it returns
        # in %rax. Do something with it.

        # Return
        ret

        .data
count:  .quad 0
argv:   .quad 0
