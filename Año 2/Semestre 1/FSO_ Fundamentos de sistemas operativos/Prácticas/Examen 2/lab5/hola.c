/**
* Programa de ejemplo "Hola mundo" con pthreads.
* Para compilar teclea: gcc hola.c -lpthread -o hola
**/
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <unistd.h>

void *Imprime(void *ptr) {
    char *men;
    men = (char*) ptr;
    
    //EJERCICIO1.b
    sleep(2);
    write(1,men,strlen(men));
    }
    
int main() {
    pthread_attr_t atrib;
    pthread_t hilo1, hilo2;
    
    //Asigna valores por defecto a un hilo
    pthread_attr_init(&atrib);
    
    pthread_create(&hilo1, &atrib, Imprime, "Hola \n");
    pthread_create(&hilo2, &atrib, Imprime, "mundo \n");
    
    //EJERCICIO1.a
    // pthread_exit(0) termina el hilo main, pero los hilos siguen ejecutándose por su parte;
    sleep(1);
   
    //Obliga al proceso main a que espere que los hilos creados acaben
    pthread_join(hilo1, NULL);
    pthread_join(hilo2, NULL);
}
