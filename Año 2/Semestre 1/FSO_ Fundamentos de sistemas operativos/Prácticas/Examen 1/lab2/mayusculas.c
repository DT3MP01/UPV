#include <stdio.h>
#include <ctype.h> 
#define TAM_CADENA 200

int main() {
    
    char *p1, *p2;
    // A) Definir las variables cadena y cadena2
    // Puntero a caracter para copiar las cadenas
    char cadena[TAM_CADENA];
    char cadena2[TAM_CADENA];
    
    // B) Leer cadena de consola
    printf("Introduce un texto a convertir en mayúsculas:\n");
    scanf("%s", cadena);
    
    // C) Convertir a mayúsculas
        p1 = cadena;
        p2 = cadena2;
        int i = 0;
        
        while(p1[i] != '\0') {
            if (p1[i] >= 'a' && p1[i] <= 'z') {
                p2[i] = p1[i] - 32;
            }
            i++;
        }
        
    // D) Sacar por consola la cadena2.
    printf("%s\n", p2);
}
