CFLAGS ?= -mabi=elfv2 -ggdb

build:
	$(CC) $(CFLAGS) -o ppcasm main.c asm.s

clean:
	$(RM) *.o ppcasm

run:
	./ppcasm
