CFLAGS ?= -mabi=elfv2 -ggdb

build:
	gcc $(CFLAGS) -o ppcasm main.c asm.s

clean:
	$(RM) *.o ppcasm

run:
	./ppcasm
