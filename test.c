#define F_CPU 20000000UL
#include <avr/io.h>
#include <util/delay.h>
 
int main(void)
{
	DDRB |= (1 << 2);
	while(1)
	{
		PORTB |= (1 << 2);
		_delay_ms(1000);
		PORTB &= ~(1 << 2);
		_delay_ms(1000);
	}
}