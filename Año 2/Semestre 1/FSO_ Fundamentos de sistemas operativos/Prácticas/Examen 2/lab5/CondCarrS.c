#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <semaphore.h>
#include <unistd.h>

/*
 REPETICIONES : Número de veces que se suma/resta 1 a V
*/
#define REPETICIONES      20000000 //provoca condición de carrera
//#define REPETICIONES        20000 //no provoca condición de carrera, ya que no da tiempo a que ambos hilos se ejecuten concurrentemente, es decir, se ejecuta el primer hilo y termina antes de que el segundo hilo empiece.

//Cuanto menor es el número de repeticiones, hay menor probabilidad de que
//produzca condición de carrera

/*
   VARIABLES GLOBALES (COMPARTIDAS) 
*/

long int V = 100;      // Valor inicial
sem_t sem;

/* 
   FUNCIONES AUXILIARES
   test_and_set(int * objetivo) : devuelve 1 (cierto) si llave está siendo utilizada, 
                                  devuelve 0 (falso) si llave está libre.
*/

int test_and_set(int *spinlock) {
  int ret;
  __asm__ __volatile__(
    "xchg %0, %1"
    : "=r"(ret), "=m"(*spinlock)
    : "0"(1), "m"(*spinlock)
    : "memory");
  return ret;
}


/* 
   FUNCIONES QUE EJECUTAN LAS TAREAS o THREADS
   - Agrega : Ejecuta un bucle donde incrementa la variable V 
   - Resta  : Ejecuta un bucle donde decrementa la variable V
   - Inspecciona : Imprime cada segundo el valor de V
*/

void *agrega (void *argumento) {

  long int cont;
  long int aux;
  
  for (cont = 0; cont < REPETICIONES; cont = cont + 1) {
      sem_wait(&sem); //Sección de entrada
      V = V + 1;
      sem_post(&sem); //Sección de salida
  }
  printf("-------> Fin AGREGA (V = %ld)\n", V);
  pthread_exit(0);
}

void *resta (void *argumento) {

  long int cont;
  long int aux;
  
  for (cont = 0; cont < REPETICIONES; cont = cont + 1) {
      sem_wait(&sem); //Sección de entrada
      V = V - 1;
      sem_post(&sem); //Sección de salida
  }
  
  printf("-------> Fin RESTA  (V = %ld)\n", V);
  pthread_exit(0);
}

void *inspecciona (void *argumento) {
 
  for (;;) {
    sleep(2);
    fprintf(stderr, "Inspección: Valor actual de V = %ld\n", V);
  } 
}

//*PROGRAMA PRINCIPAL  

int main (int argc, char *argv[]) {
    
    sem_init(&sem, 0, 1); //El 0 indica que no es compartido y el 1 indica exclusión mutua (mutex). Es decir, solo podrá acceder a la variable un hilo.
    
  //Declaración de  variables 
    pthread_t hiloSuma, hiloResta, hiloInspeccion; //ID del hilo
    pthread_attr_t attr;   

  // Inicilizacion de los atributos de los hilos (por defecto)
    pthread_attr_init(&attr);
    
  // EJERCICIO: Cree los tres hilos propuestos con dichos atributos 
    pthread_create(&hiloSuma, &attr, agrega, NULL);
    pthread_create(&hiloResta, &attr, resta, NULL);
    pthread_create(&hiloInspeccion, &attr, inspecciona, NULL);

  // EJERCICIO: Hilo principal debe esperar a que 
  //las tareas "agrega" y "resta" finalicen 
    pthread_join(hiloSuma, NULL);
    pthread_join(hiloResta, NULL);
   
  // Fin del programa principal
  fprintf(stderr, "-------> VALOR FINAL: V = %ld\n\n", V);
  exit(0);
}
