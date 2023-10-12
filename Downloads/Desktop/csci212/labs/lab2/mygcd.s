.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2
.global gcd
.type gcd, %function

gcd:
    push {fp, lr}
    add fp, sp, #4

    @ r0 = a, r1 = b, a>= b

    push {r0}
    push {r1}

    do_while:
         ldr r0, [fp, #-8]   @ a
         ldr r1, [fp, #-12]  @ b
         bl mod  @ m = a % b

         @ a = b
         @ b = m
         str r1, [fp, #-8]
         str r0, [fp, #-12]

    cmp r0, #0
    bne do_while

    @ a contains the result
    ldr r0, [fp, #-8]


    sub sp, fp, #4
    pop {fp, pc}

