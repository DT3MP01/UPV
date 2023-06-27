#include <stdio.h>

int a = 0; /* variable global */

// Función que incrementa en 1 el valor de la variable global --> void inc_a(void) {
void inc_a() {
    a++;
}

//Función que retorna el valor anterior de v y guarda el nuevo valor v int

int valor_anterior(int v) {
    int temp;
    static int s;
    temp = s;
    s = v;
    return temp;
}
    
    int main() {
      int b = 2; /* variable local */
      inc_a();
      valor_anterior(b);
      
      printf("a= %d, b= %d\n", a, b);
      
      a++;
      b++;
      inc_a();
      b = valor_anterior(b);
      
      printf("a= %d, b= %d\n", a, b);
}
