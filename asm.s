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
	# read LR value into GPR10
	mflr	10

	# voodoo to get actual value of __hwcap
	lwz	9, 0(10)
	add	8, 9, 10
	ld	7, 0(8)

	andis.	6, 7, 0x1000

	# set retval to false - altivec not supported
	addi	3, 0, 0
	beq	1f

	# set retval to true - altivec supported
	addi	3, 0, 1

	fsqrt	5, 16

1:
	# GPR14 to LR
	mtlr	14

	blr
