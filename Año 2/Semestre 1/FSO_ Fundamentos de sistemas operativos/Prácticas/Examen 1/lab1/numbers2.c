#include <stdio.h>

#define N 10



int main() {
    int i;
    int num;
    
    printf("Write the number to be displayed:\n", num);
    scanf("%d", &num);
    
    printf("\nThe first %d natural numbers are:\n", num);
    
    for (i = 0; i < num; i++) {
        printf("%d\n", i);
    }
    
    printf("\nBYE\n");
    
    return(0);
}
