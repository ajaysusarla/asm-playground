#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
  I'm not sure yet, what this should return.
 */
char * parse_args(int argc, char **argv)
{
        int i;
        char *args = NULL;

        for (i = 0; i < argc; i++) {
                printf("%d: %s\n", i, argv[i]);
        }

        return args;
}
