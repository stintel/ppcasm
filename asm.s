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
	# read LR value into GPR3
	mflr	3

	# GPR14 to LR
	mtlr	14

	blr
