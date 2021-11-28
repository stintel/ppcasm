build:
	gcc -mabi=elfv2 -o ppcasm main.c asm.s

clean:
	$(RM) ppcasm

run:
	./ppcasm
