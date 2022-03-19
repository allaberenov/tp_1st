//#include "stdafx.h"
#include "stdio.h"
#include "main.h"

int main()
{
    int a;
    int TRUE=1;
    int FALSE=0;
    scanf("%d", &a);
    if (is_even(a))
        printf("%d", FALSE);
    else
        printf("%d", TRUE);
}