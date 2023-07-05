#include <stdio.h>
#include <stdlib.h>
#include "ctimer.h"

void matprod(double *A, double *B, double *C, int n)
{
    int i,j,k;
 //#pragma omp parallel for private(j,k)
    for (j=0; j<n; j++) 
         for(k=0;k<n; k++)
             for(i=0;i<n; i++)
       {
        C[i+j*n]= C[i+j*n]+ A[i+k*n]* B[k+j*n];
    }
}


int main(  ) { 


  int n=2000;
  // printf("numero threads %d \n",omp_get_num_threads());
  // omp_set_num_threads(2);

  /* Reservamos memoria para los datos */
  double *A = (double *) malloc( n*n*sizeof(double) );
  double *B = (double *) malloc( n*n*sizeof(double) );
  double *C = (double *) calloc( n*n,sizeof(double) );  

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
