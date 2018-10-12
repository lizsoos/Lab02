	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	ldr	r0, .L4
	ldr	r3, .L4+4
	push	{r4, r5, r6, lr}
	strh	r0, [r2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	r2, r2, #256
	ldr	r3, .L4+8
	ldrh	lr, [r2, #48]
	ldr	ip, .L4+12
	ldr	r1, .L4+16
	mov	r0, r3
	ldr	r2, .L4+20
	strh	lr, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, #20
	mov	r2, #1
	mov	lr, #19
	mov	r4, #15
	mov	r3, #120
	mov	ip, #17
	mov	r0, #10
	ldr	r5, .L4+24
	str	r1, [r5]
	ldr	r5, .L4+28
	str	r1, [r5]
	ldr	r5, .L4+32
	str	r1, [r5]
	ldr	r5, .L4+36
	str	r1, [r5]
	ldr	r1, .L4+40
	str	r2, [r1]
	ldr	r1, .L4+44
	str	r2, [r1]
	ldr	r1, .L4+48
	str	r2, [r1]
	ldr	r1, .L4+52
	str	r2, [r1]
	ldr	r2, .L4+56
	str	lr, [r2]
	ldr	r2, .L4+60
	ldr	lr, .L4+64
	str	r4, [r2]
	ldr	r1, .L4+68
	ldr	r2, .L4+72
	str	r3, [lr]
	str	r3, [r1]
	ldr	lr, .L4+76
	str	r3, [r2]
	ldr	r1, .L4+80
	ldr	r2, .L4+84
	str	r3, [lr]
	str	ip, [r1]
	str	r0, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	oldButtons
	.word	32736
	.word	buttons
	.word	bgColor
	.word	fillScreen
	.word	gRow
	.word	gCol
	.word	gOldRow
	.word	gOldCol
	.word	gRDel
	.word	gCDel
	.word	bRDel
	.word	bCDel
	.word	gHeight
	.word	gWidth
	.word	bRow
	.word	bCol
	.word	bOldRow
	.word	bOldCol
	.word	bHeight
	.word	bWidth
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	sub	sp, sp, #16
	beq	.L7
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L32
.L7:
	ldr	ip, .L34+8
	ldr	r3, .L34+12
	ldr	r2, .L34+16
	ldr	r0, [ip]
	ldr	lr, .L34+20
	str	r0, [r3]
	ldr	r1, [r2]
	ldr	r3, .L34+24
	str	r1, [lr]
	ldrh	lr, [r3, #48]
	ldr	r3, .L34+28
	tst	lr, #16
	ldr	r3, [r3]
	bne	.L10
	add	lr, r1, r3
	cmp	lr, #240
	addle	r1, r1, #1
	strle	r1, [r2]
.L10:
	ldr	lr, .L34+24
	ldrh	lr, [lr, #48]
	tst	lr, #32
	bne	.L11
	cmp	r1, #0
	subne	r1, r1, #1
	strne	r1, [r2]
.L11:
	ldr	r2, .L34+24
	ldrh	r2, [r2, #48]
	cmp	r0, #0
	lsr	r2, r2, #6
	moveq	r2, #1
	andne	r2, r2, #1
	cmp	r2, #0
	ldr	r2, .L34+24
	ldrh	lr, [r2, #48]
	subeq	r0, r0, #1
	ldr	r2, .L34+32
	streq	r0, [ip]
	tst	lr, #128
	ldr	r2, [r2]
	bne	.L13
	add	lr, r0, r2
	cmp	lr, #160
	addne	r0, r0, #1
	strne	r0, [ip]
.L13:
	ldr	r5, .L34+36
	ldr	ip, [r5]
	ldr	lr, .L34+40
	cmp	ip, #0
	ldr	r7, .L34+44
	ldr	r9, [lr]
	ble	.L14
	add	lr, ip, r9
	cmp	lr, #159
	bgt	.L14
.L15:
	ldr	r4, .L34+48
	ldr	lr, [r4]
	ldr	r6, .L34+52
	cmp	lr, #0
	ldr	r10, [r6]
	ble	.L16
	add	r6, lr, r10
	cmp	r6, #239
	ble	.L33
.L16:
	ldr	r6, .L34+56
	ldr	r8, [r6]
	rsb	r8, r8, #0
	str	r8, [r6]
.L17:
	str	r10, [sp, #12]
	str	r9, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r8, .L34+60
	mov	lr, pc
	bx	r8
	cmp	r0, #1
	ldreq	r2, [r7]
	ldreq	r3, [r6]
	rsbeq	r0, r2, #0
	rsbeq	r1, r3, #0
	ldr	r2, [r5]
	ldr	r3, [r4]
	ldrne	r0, [r7]
	ldrne	r1, [r6]
	add	r2, r2, r0
	add	r3, r3, r1
	streq	r0, [r7]
	streq	r1, [r6]
	str	r2, [r5]
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L14:
	ldr	lr, [r7]
	rsb	lr, lr, #0
	str	lr, [r7]
	b	.L15
.L33:
	ldr	r6, .L34+56
	b	.L17
.L32:
	ldr	r2, .L34+64
	ldr	r3, .L34+68
	ldrh	r1, [r2]
	cmp	r1, r3
	mvneq	r3, #64512
	movne	r0, r3
	strh	r3, [r2]	@ movhi
	ldreq	r0, .L34+72
	ldr	r3, .L34+76
	mov	lr, pc
	bx	r3
	b	.L7
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	bRow
	.word	bOldRow
	.word	bCol
	.word	bOldCol
	.word	67109120
	.word	bWidth
	.word	bHeight
	.word	gRow
	.word	gHeight
	.word	gRDel
	.word	gCol
	.word	gWidth
	.word	gCDel
	.word	collision
	.word	bgColor
	.word	32736
	.word	1023
	.word	fillScreen
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L38
	ldr	r7, .L38+4
	ldrh	ip, [r8]
	ldr	r6, .L38+8
	ldr	r5, .L38+12
	ldr	r1, .L38+16
	sub	sp, sp, #12
	ldr	r4, .L38+20
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r1, [r1]
	ldr	r0, [r5]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	fp, .L38+24
	ldr	lr, .L38+28
	ldrh	ip, [r8]
	ldr	r10, .L38+32
	ldr	r8, .L38+36
	ldr	r1, [lr]
	ldr	r3, [fp]
	ldr	r0, [r8]
	ldr	r2, [r10]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	mov	ip, #992
	ldr	r8, .L38+40
	ldr	r9, .L38+44
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r1, [r8]
	ldr	r0, [r9]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	mov	ip, #31744
	ldr	r6, .L38+48
	ldr	r7, .L38+52
	ldr	r3, [fp]
	ldr	r1, [r6]
	ldr	r0, [r7]
	ldr	r2, [r10]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	r0, [r9]
	ldr	r1, [r8]
	ldr	r2, [r7]
	ldr	r3, [r6]
	str	r0, [r5]
	ldr	r8, .L38+36
	ldr	r0, .L38+16
	ldr	lr, .L38+28
	str	r1, [r0]
	str	r2, [r8]
	str	r3, [lr]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	bgColor
	.word	gWidth
	.word	gHeight
	.word	gOldRow
	.word	gOldCol
	.word	drawRect
	.word	bWidth
	.word	bOldCol
	.word	bHeight
	.word	bOldRow
	.word	gCol
	.word	gRow
	.word	bCol
	.word	bRow
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L43
	mov	lr, pc
	bx	r3
	ldr	r9, .L43+4
	ldr	r4, .L43+8
	ldr	r8, .L43+12
	ldr	r7, .L43+16
	ldr	r6, .L43+20
	ldr	r5, .L43+24
.L41:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L41
.L44:
	.align	2
.L43:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	gWidth,4,4
	.comm	gHeight,4,4
	.comm	gCDel,4,4
	.comm	gRDel,4,4
	.comm	gOldCol,4,4
	.comm	gOldRow,4,4
	.comm	gCol,4,4
	.comm	gRow,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 47) 7.1.0"
