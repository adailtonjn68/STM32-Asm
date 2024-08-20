.include "stm32f40x.inc"


.global main
main:
	@ Enable clock to GPIOA
	ldr		r0, =RCC_AHB1ENR
	ldr		r1, [r0]
	orr		r1, RCC_AHB1ENR_GPIOAEN
	str		r1, [r0]
	@ Set GPIOA6 as output
	ldr		r0, =GPIOA_MODER
	ldr		r1, [r0]
	and		r1, ~GPIO_MODER_6_MASK
	orr		r1, GPIO_MODER_6_OUTPUT
	str		r1, [r0]

loop:
	ldr		r0, =GPIOA_BSRR
	ldr		r1, [r0]
	orr		r1, 1 << 6
	str		r1, [r0]

	ldr		r0, =2000000
	bl		delay

	ldr		r0, =GPIOA_BSRR
	ldr		r1, [r0]
	orr		r1, 1 << (6 + 16)
	str		r1, [r0]

	ldr		r0, =2000000
	bl		delay

	b	loop

