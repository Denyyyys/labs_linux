#include <stdio.h>
#include <math.h>
/* prototypy*/
double Delta(double, double, double);
double Pierw(double, double, double, int);
double* PierwZesp(double, double, double, int);
void main(int argc, char* argv[])
{
    double a, b, c, delta;
    double x1, x2;
    if (argc != 4)
    {
        printf("Poprawna skladnia:\t%s a b c\n", argv[0]);
        exit(1);
    }
    sscanf(argv[1], "%lf", &a);
    sscanf(argv[2], "%lf", &b);
    sscanf(argv[3], "%lf", &c);
    delta = Delta(a, b, c);
    if (delta >= 0)
    {
        x1 = Pierw(a, b, delta, 1);
        x2 = Pierw(a, b, delta, 2);
        printf("x1 = %lf\nx2 = %lf\n", x1, x2);
    }
    else
        printf("Brak pierwiastkow rzeczywistych.\n");
    return;
}

double Delta(double a, double b, double c)
{
    return (b * b - 4 * a * c);
}

double Pierw(double a, double b, double delta, int flaga)
{
    if (flaga == 1)
    return (-b - sqrt(delta))/2*a;
    else if (flaga == 2)
    return (-b + sqrt(delta))/2*a;
}
