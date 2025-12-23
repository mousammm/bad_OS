#include <stdio.h>

extern int test(int a, int b);

int test(int a,int b)
{
    printf("in fun!\n");
    return a+b;
}
