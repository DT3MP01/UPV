#include <stdio.h>

#define PI 3.1416

int main() {

    float area;
    int radio;
    radio = 10;
    area = PI * (radio * radio);
    
    printf("El area del círculo de radio %d es: %f\n", radio, area);
}
