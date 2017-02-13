all: asmcmdlinecount asmcmdlineargs parseargs flattenargs global

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

global: global.S global.c
	gcc -ggdb -c global.c
	gcc -ggdb global.o global.S -o global

clean:
	rm -f asmcmdlineargs asmcmdlinecount parseargs flattenargs global *.o

