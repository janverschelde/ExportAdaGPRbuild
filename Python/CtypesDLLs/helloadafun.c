// Basic function to write Hello world!

#include <stdio.h>

extern void adainit ( void );
extern int _ada_adahello ( void );
extern void adafinal ( void );

int helloadafun ( void )
{
    int retval;

    adainit();
    retval = _ada_adahello();
    adafinal();

    return retval;
}
