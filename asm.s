	.global	_doasm
	.global doasm
	.type	_doasm,@function
	.type	doasm,@function

_doasm:
doasm:
	# LR to GPR10
	mflr	10

	# need to skip .long because it's not a valid instruction
	# is this the only way of loading in a variable?
	bl	0f
	.string "foo"

0:
	# read LR value into GPR4
	mflr	4

	# print to stdout
	addi	0,0,4		# linux ppc write syscall number to GPR0
	addi	3,0,1		# first argument (fd = 1) to GPR3
				# second argument is already in GPR4 by mflr
	addi	5,0,4		# third argument (len = 4 bytes) to GPR5
	sc

	# GPR10 to LR
	mtlr	10

	blr
