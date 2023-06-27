#include <stdio.h>
#define TAM_FILA 100
#define NUM_FILAS 10

struct FILA {
    float datos[TAM_FILA];
    float suma;
};

// A)Defina variable filas como un vector de FILA de tamano NUM_FILAS
struct FILA filas[NUM_FILAS];

//struct FILA *pf = filas;

void suma_fila(struct FILA *pf) {
// B) Implemente suma_fila
    for (int j = 0; j < NUM_FILAS; j++) {
        pf->suma += pf->datos[j]; ////
    }
}

// Inicie las filas con el valor i*j
void inicia_filas() {
    int i, j;
    for (i = 0; i < NUM_FILAS; i++) {
        for (j = 0; j < TAM_FILA; j++) {
            filas[i].datos[j] = (float) i * j;
        }
    }
}

int main() {
    int i;
    float suma_total;
    inicia_filas();
    // C) Complete bucle
    suma_total = 0;
    for (i = 0; i < NUM_FILAS; i++) {
    // Llamar a suma_fila
        suma_fila(&filas[i]); ////
        suma_total += filas[i].suma;////
        printf("La suma de la fila %d es %f\n", i, filas[i].suma);
        //sumar la fila a suma_total
    }
    printf("La suma final es %f\n", suma_total);
}
