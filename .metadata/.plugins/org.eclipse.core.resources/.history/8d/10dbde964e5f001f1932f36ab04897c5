.include "stm32f40x.inc"


.global delay
delay:
delay_loop:
	subs	r0, #1
	bne		delay_loop
	bx		lr
