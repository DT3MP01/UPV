#include <stdio.h>


#define M 8
#define N 12


__global__ void mediasmatrizcpu(double *A,  double *c)
{
  int tidx= threadIdx.x+blockIdx.x*blockDim.x;
  int tidy= threadIdx.y + blockIdx.y*blockDim.y;
  int txm= tidx;
  int tx = tidx+1;
  int txp = tidx+2;
  
  int tym= tidy;
  int ty = tidy+1;
  int typ = tidy+2;
  
  c[tidx+tidy*(M-2)]=(a[txm+ty*M)]+a[txp+ty*M)]+a[tx+tym*M)]+a[tx+typ*M)+a[tx+ty*M])/5.0;
  
 }

void Print_matrix(double C[], int m, int n) {
   int i, j;

   for (i = 0; i < m; i++) {
      for (j = 0; j < n; j++)
         printf("%.2f ", C[i+j*m]);
      printf("\n");
   }
}  /* Print_matrix */
 
 int main() {
  int i,j;

  double *A = (double *) malloc( N*M*sizeof(double) );
  double *sal1 = (double *) malloc( (N-2)*(M-2)*sizeof(double) );
  double *dev_a , *dev_sal1;
  
  cudaMalloc((void **) &dev_a, N*M*sizeof(double) );
  cudaMalloc((void **) &dev_sal1, (N-2)*(M-2)*sizeof(double) );
 
 //rellenar matriz en CPU
  for (j=0;j<N;j++)
    for(i=0;i<M;i++)
   {
      A[i+M*j]=i+j ;
    }

  Print_matrix(A,M,N);
  
 cudaMemcpy( dev_a, A, N*M*sizeof(double) , cudaMemcpyHostToDevice );
  
    dim3 block_p_grd(2,3);
    dim3 thr_p_block(4,4);

  mediasmatrizcpu<<<block_p_grd,thr_p_block>>>(dev_a,dev_sal1);

 //obtener el resultado a cpu
 cudaMemcpy( sal1, dev_sal1, (N-2)*(M-2)*sizeof(double), cudaMemcpyDeviceToHost );
 
  Print_matrix(sal1,M,N);

  free(A);
  free(sal1);
  cudaFree(dev_sal1);
  cudaFree(dev_a);

  }
	
	
