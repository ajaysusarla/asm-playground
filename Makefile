all: asmcmdlinecount asmcmdlineargs parseargs flattenargs

asmcmdlinecount: argsc.S
	gcc -ggdb argsc.S -o asmcmdlinecount

asmcmdlineargs: argsv.S
	gcc -ggdb argsv.S -o asmcmdlineargs

parseargs: pargs.S pargs.c
	gcc -ggdb -c pargs.c
	gcc -ggdb pargs.o pargs.S -o parseargs

flattenargs: flatten.S flatten.c
	gcc -ggdb -c flatten.c
	gcc -ggdb flatten.o flatten.S -o flattenargs

clean:
	rm -f asmcmdlineargs asmcmdlinecount parseargs flattenargs *.o

