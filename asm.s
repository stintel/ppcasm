	.global	_doasm
	.global doasm
	.type	_doasm,@function
	.type	doasm,@function

_doasm:
doasm:
	# print to stdout
	addi	0,0,4		# linux ppc write syscall number to GPR0
	addi	3,0,1		# first argument (fd = 1) to GPR3
	addi	4,0,0xff	# second argument (buf = 0xff) to GPR4
	addi	5,0,1		# third argument (len = 1 byte) to GPR5
	sc

	# exit 0 without mnemonics
	addi	0,0,1	# linux ppc exit syscall number to GPR0
	addi	3,0,0	# first argument (status = 0) to GPR3
	sc		# execute syscall


