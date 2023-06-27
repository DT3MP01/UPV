#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <unistd.h>

void *Imprime(void *ptr) {
    char *men;
    men = (char*) ptr;
    
    //EJERCICIO1.b
    write(1, men, strlen(men));
    }
    
int main() {
    pthread_attr_t atrib; //atributo estándar para el hilo
    //si no se hubiera especificado, no importaría, la creación de los hilos sería:
    //pthread_create(&hilo1, NULL, Imprime, "Hola \n")
    //pthread_create(&hilo2, NULL, Imprime, "mundo \n");
    //Y el programa funcionaría exactamente igual
    
    pthread_t hilo1, hilo2; //ID del hilo
    
    pthread_attr_init(&atrib); //Inicialización del atributo estándar
    
    //Cabecera de phthread_create:
    //phthread_create(ID, atrib, función, lo que hace)
    pthread_create(&hilo1, &atrib, Imprime, "Hola \n"); //Crea el hilo1
    
    //EJERCICIO 1a modificado
    //pthread_exit(0); //Termina el proceso. 
    //En este caso, si se incluyera aquí, solo se imprimiría por pantalla "Hola"
    
    //sleep(3); //Duerme el proceso durante tres segundos
    //Lo que es equivalente a: (usleep(3000000)
    
    pthread_create(&hilo2, &atrib, Imprime, "mundo \n"); //Crea el hilo2
    
    //NOTA: Como se ejecutan a la vez, puede salir cualquier mensaje por pantalla primero
   
    pthread_join(hilo1, NULL); //Suspende el main hasta que hilo1 acaba
    pthread_join(hilo2, NULL); //Suspende el main hasta que hilo2 acaba
    
    //NOTA IMPORTANTE: sin los pthread_join, no se aseguraría que saliesen por pantalla ambos mensajes. La función de los join es que ambos hilos acaben sí o sí
}
