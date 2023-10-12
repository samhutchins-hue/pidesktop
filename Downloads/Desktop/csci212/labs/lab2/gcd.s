.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2
.global main
.type main, %function

main:
    push {fp, lr}
    add fp, sp, #4

    @ Allocate memory for a and b on the stack
    sub sp, sp, #8

    @ user_input(&a, &b)
    add r0, sp, #4
    mov r1, sp
    bl user_input

    @ gcd(a,b) --> r0

    ldr r0, [fp, #-8]  @ a
    ldr r1, [fp, #-12]  @ b
    bl gcd

    @ print_out(r0)
    bl print_out


    sub sp, fp, #4
    pop {fp, pc}

