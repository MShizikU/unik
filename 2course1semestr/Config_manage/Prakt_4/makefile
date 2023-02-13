.PHONY: all clean archive

all: archive

clean:
	del prog files.lst distr.zip

archive: prog files.lst
	zip distr.zip *.*

prog: prog.c data.c
	gcc prog.c data.c -o prog

files.lst: prog
	dir /B > files.lst
