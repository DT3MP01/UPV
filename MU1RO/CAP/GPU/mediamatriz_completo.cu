#include <stdio.h>


#define M 5
#define N 6


__global__ void mediasmatrizcpu(double *A,  double *sal)
{
  int i;
  int j=threadIdx.x;
  double suma;
  if(j<N)
    {suma=0;
    for(i=0;i<M;i++)
       suma=suma+A[i+j*M];
    sal[j]=suma/double(M);
    }
 }

void Print_matrix(double C[], int m, int n) {
   int i, j;

   for (i = 0; i < m; i++) {
      for (j = 0; j < n; j++)
         printf("%f ", C[i+j*m]);
      printf("\n");
   }
}  /* Print_matrix */
 
 int main() {
  int i,j;

  double *A = (double *) malloc( N*M*sizeof(double) );
  double *sal1 = (double *) malloc( N*sizeof(double) );
  double *dev_a , *dev_sal1;
  
  cudaMalloc((void **) &dev_a, N*M*sizeof(double) );
  cudaMalloc((void **) &dev_sal1, N*sizeof(double) );
 
 //rellenar matriz en CPU
  for (j=0;j<N;j++)
    for(i=0;i<M;i++)
   {
      A[i+M*j]=i+j ;
    }

  Print_matrix(A,M,N);
  
 cudaMemcpy( dev_a, A, N*M*sizeof(double) , cudaMemcpyHostToDevice );

  mediasmatrizcpu<<<1,N>>>(dev_a,dev_sal1);

 //obtener el resultado a cpu
 cudaMemcpy( sal1, dev_sal1, N*sizeof(double), cudaMemcpyDeviceToHost );

   for (j=0;j<N;j++)
    printf("media columna %d = %f  \n",j,sal1[j]);

  free(A);
  free(sal1);
  cudaFree(dev_sal1);
  cudaFree(dev_a);

  }
	
	
