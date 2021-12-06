	.global	_doasm
	.global doasm
	.type	_doasm,@function
	.type	doasm,@function

_doasm:
doasm:
	# LR to GPR14
	mflr	14

	# need to skip .long because it's not a valid instruction
	# is this the only way of loading in a variable?
	# also why is this -. voodoo needed and where is it explained properly
	bl	0f
	.long	__hwcap-.
	# this emits difference between the address of __hwcap and the current address
	# current address is directly after the bl, where the LR now points
	# wat? welp

0:
	# read LR value into GPR4
	mflr	4

	# print to stdout
	addi	0,0,4		# linux ppc write syscall number to GPR0
	addi	3,0,1		# first argument (fd = 1) to GPR3
				# second argument is already in GPR4 by mflr
	addi	5,0,1		# third argument (len = 1 byte) to GPR5
	sc

	# GPR14 to LR
	mtlr	14

	blr
