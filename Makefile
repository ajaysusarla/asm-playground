all: asmcmdlinecount asmcmdlineargs

asmcmdlinecount: argsc.S
	gcc -ggdb argsc.S -o asmcmdlinecount

asmcmdlineargs: argsv.S
	gcc -ggdb argsv.S -o asmcmdlineargs
clean:
	rm -f asmcmdlineargs asmcmdlinecount *.o

