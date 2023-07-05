#include <stdio.h>
#include <stdlib.h>
#include "ctimer.h"



int main(  ) { 


  int n=1000;


  /* Reservamos memoria para los datos */
  double *A = (double *) malloc( n*n*sizeof(double) );
  double *B = (double *) malloc( n*n*sizeof(double) );
  double *C = (double *) malloc( n*n*sizeof(double) );  

  /* Lo probamos */
  int i, j;
  for( j=0; j<n; j++ ) { 
    for( i=0; i<n; i++ ) { 
      A[i+j*n] = ((double) rand()/ RAND_MAX);
    }   
  }
  for( j=0; j<n; j++ ) { 
    for( i=0; i<n; i++ ) { 
      B[i+j*n] = ((double) rand()/ RAND_MAX);
    }   
  }   

  double elapsed, ucpu, scpu;
  ctimer_(&elapsed,&ucpu,&scpu);
  matprod( A, B, C, n );
  ctimer_(&elapsed,&ucpu,&scpu);
  printf("Elapsed: %f seconds\n", elapsed);

  /* Liberamos memoria */
  free(A);
  free(B);
  free(C);
  return 0;
}
