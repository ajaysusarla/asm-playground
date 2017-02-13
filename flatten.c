#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char *flatten_args(int argc, char **argv)
{
        int i, j, k;
        size_t siz = 0;
        char *args = NULL;

        for (i = 0; i < argc; i++)
                siz += strlen(argv[i]) + 1; /* additional byte for \0 between strings */

        siz += 2;               /* Our flattened string ends with 2 \0's */

        args = calloc(1, siz);
        if (!args)
                goto end;

        for (i = 0, k = 0; i < argc; i++) {
                for (j = 0; j < strlen(argv[i]); j++) {
                        args[k++] = argv[i][j];
                }
                k++;
        }

end:
        return (args ? args : "");
}
