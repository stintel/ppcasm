CFLAGS ?= -mabi=elfv2

build:
	gcc $(CFLAGS) -o ppcasm main.c asm.s

clean:
	$(RM) ppcasm

run:
	./ppcasm
