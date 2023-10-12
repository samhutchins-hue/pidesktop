.cpu cortex-a72
.fpu neon-fp-armv8

.data
user_input_instr:    .asciz "Enter a and b: "
inp_instr:     .asciz "%d %d"


.text align 2
.global user_input
.type user_input, %function


user_input:

    push {fp, lr}
    add fp, sp, #4

    # r0 = &a, r1 =&b
    push {r0}
    push{r1}

    #printf("Enter a and b: ")
    ldr r0, =user_input_instr
    bl printf

    # scanf("%d %d", &a, &b)
    ldr r0, =input_instr
    ldr r1, [fp, #-8]
    ldr r2, [fp, #-12]
    bl scanf


    # if a < b, swap them
    ldr r0, [fpm #-8] # r0 = &a
    ldr r0, [r0] # r0 = a
    ldr r1, [fp, #-12] # r1 = &b
    ldr r1, [r1] # r1 = b

    cmp r0, r1 # a < b
    bge else_stop

    # swap
    ldr r3, [fp, #-8] # r3 = &a
    str r1, [r3]      # *(&a) = r1 = b
    ldr r3, [fp, #12] # r3 = &b
    str r0, [r3]      # *(&b) = r0 = a


    else_stop:

    sub sp, fp, #4
    pop {fp, pc}


