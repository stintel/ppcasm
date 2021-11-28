	.global	_doasm
	.global doasm
	.type	_doasm,@function
	.type	doasm,@function

_doasm:
doasm:
	# exit 0 without mnemonics
	addi	0,0,1	# linux ppc exit syscall number to GPR0
	addi	3,0,0	# first argument (status = 0) to GPR3
	sc		# execute syscall


