.cpu cortex-a72
.fpu neon-fp-armv8

.data

print_output:   .asciz   "The gcd = %d\n"

.text
.align 2
.global print_out
.type print_out, %function

print_out:
    push {fp, lr}
    add fp, sp, #4

    @ r0 = n
    mov r1, r0
    ldr r0, =print_output
    bl printf


    sub sp, fp, #4
    pop {fp, pc}
