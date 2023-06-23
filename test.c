#define F_CPU 20000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
 
int main(void)
{
	_delay_ms(1000);
	printf("Embeded");
}