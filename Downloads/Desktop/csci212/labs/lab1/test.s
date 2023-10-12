# using armv8
	.arch armv8-a
	# file name
	.file	"test.c"
	.text
	# shift by two bytes?
	.align	2
	# setting to global
	.global	test
	# declaring test as a function
	.type	test, %function
test:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	# load the value of the address 12 with stack pointer into w0
	str	w0, [sp, 12]
	# load the value of the address 12 with stack pointer into w1
	ldr	w1, [sp, 12]
	# move the address 26215 into w0
	mov	w0, 26215
	# logical shift 0x6666 16 digits and move value to w0
	movk	w0, 0x6666, lsl 16
	# signed long multiply w1 and w0 and store address in x0
	smull	x0, w1, w0
	#  logical shift x0 right 32 places
	lsr	x0, x0, 32
	# arithmetic shift w0 right 2 digits and store in w2
	asr	w2, w0, 2
	# arithmetic shift w1 right 31 digits and store in w0
	asr	w0, w1, 31
	# subtracts w0 value by w2 and stores in w2
	sub	w2, w2, w0
	# moves w2 address to w0
	mov	w0, w2
	# logical shift left w0 by 2 digits
	lsl	w0, w0, 2
	# add w0 and w2 and stores in w0
	add	w0, w0, w2
	# logical shift left w0 by 1 digit and store in w0
	lsl	w0, w0, 1
	# subtract w1 by w0 and store in w2
	sub	w2, w1, w0
	# move w2 to w0
	mov	w0, w2
	# add stack pointer to 16 and store in stack pointer
	add	sp, sp, 16
	# I don't know what this does
	.cfi_def_cfa_offset 0
	# I don't know what this does
	ret
	# I don't know what this does
	.cfi_endproc
.LFE0:
    # I don't know what this does
	.size	test, .-test
	# I don't know what this does
	.section	.rodata
	# align by 3 bytes
	.align	3
.LC0:
    # defines a string with given text
	.string	"The digit in the ones place of %d is %d\n"
	# not sure what this does
	.text
	# aligns by 2 bytes
	.align	2
	# makes main global
	.global	main
	# sets main as a function
	.type	main, %function
main:
.LFB1:
    # I don't know what this does
	.cfi_startproc
	# I don't know what this does
	stp	x29, x30, [sp, -48]!
	# I don't know what this does
	.cfi_def_cfa_offset 48
	# I don't know what this does
	.cfi_offset 29, -48
	# I don't know what this does
	.cfi_offset 30, -40
	# moves stack pointer to x29
	mov	x29, sp
	# creates a string w0 and stores the value stored in the address 28 with stack pointer in w0
	str	w0, [sp, 28]
	# creates a string x1 and stores the value stored in the address 16 with stack pointer in x1
	str	x1, [sp, 16]
	# moves the address 294 to w0
	mov	w0, 294
	# creates a string w0 and stores the value stored in the address 44 with stack pointer in w0
	str	w0, [sp, 44]
	# loads the value of the address 44 with stack pointer into w0
	ldr	w0, [sp, 44]
	# branch and link current register to test?
	bl	test
	# moves the address w0 to w2
	mov	w2, w0
	# loads the value of the address 44 with stack pointer into w1
	ldr	w1, [sp, 44]
	# not sure what this does
	adrp	x0, .LC0
	# not sure what this does
	add	x0, x0, :lo12:.LC0
	# branch and link current register to the printf function?
	bl	printf
	# moves address 0 to w0
	mov	w0, 0
	# not sure what this does
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
