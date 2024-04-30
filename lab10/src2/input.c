#include "rlin.h"
double a = 0;
double b = 0;

void WczytajDane(void)
{
        printf("Podaj wspolczynniki rownania liniowego ax + b = 0\n");
        printf("a = ");
        scanf("%lf",&a);
        printf("b = ");
        scanf("%lf",&b);
	printf("\n");
        return;
}

