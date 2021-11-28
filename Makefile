build:
	gcc -mabi=elfv2 -o ppcasm main.c

clean:
	$(RM) ppcasm

run:
	./ppcasm
