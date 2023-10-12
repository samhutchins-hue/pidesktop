.cpu cortex-a72
.fpu neon-fp-armv8
.data
instr: .asciz "Enter guess: "
int_inp: asciz "%d"
low: .asciz "Guess is low\n"
high: .asciz "Guess is high\n"
win: .asciz "Bingo!\n"
the_key: .asciz "The key = %d\n"

.balign 4
key: .word 0
guess: .word 0

.test
.align 2
.global main
.type main, %function

main:
	move r4, lr
	@ reset seed
	@time(0)
	mov r0, #0
	bl time @time -> r0
	bl srand
	@ generate the rand #
	@ rand() -> r0 = 0 and range #
	bl rand
	@ r0 % 100 + 1 -> key
	mov r1, #100
	@ a-> r0, n -> r1
	udiv r2, r0, r1 @r2 = r0 / r1
	mul r2, r2, r1 @ r2 = [r0/r1] * r1
	sub r2, r0, r2 @ r2 = r0 - [r0/r1] * r1
	add r2, r2, #1
	@ r2 -> key
	ldr r1, =key
	str r2, [r1]
	@ printf("The key = %d\n", key)
	ldr r0, =the_key
	ldr r1, =key
	ldr r1, [r1]
	bl printf

	mov lr, r4
	bx lr
