all: asmcmdlinecount asmcmdlineargs parseargs

asmcmdlinecount: argsc.S
	gcc -ggdb argsc.S -o asmcmdlinecount

asmcmdlineargs: argsv.S
	gcc -ggdb argsv.S -o asmcmdlineargs

parseargs: pargs.S pargs.c
	gcc -ggdb -c pargs.c
	gcc -ggdb pargs.c pargs.S -o parseargs
clean:
	rm -f asmcmdlineargs asmcmdlinecount parseargs *.o

