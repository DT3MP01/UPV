#include <stdio.h>
#define M 8
#define N 12

__global__ void filtro(double *a, double*c)
{
  int tidx= threadIdx.x; //+blockIdx.x*blockDim.x ;
  int tidy= threadIdx.y; //+ blockIdx.y*blockDim.y;
  int txm=tidx;
  int tx=tidx+1;
  int txp=tidx+2;
  int tym=tidy;
  int ty=tidy+1;
  int typ=tidy+2;
    c[tidx+tidy*(M-2)]=(a[txm+ty*M]+ a[txp+ty*M]+a[tx+tym*M]+a[tx+typ*M]+a[tidx+1+(tidy+1)*M])/5.0;
  
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
 double a[M*N], c[(M-2)*(N-2)];
 double *dev_a,  *dev_c;
 int i,j;
 //reservar memoria en GPU
 cudaMalloc((void **) &dev_a, M*N*sizeof(double) );

 cudaMalloc((void **) &dev_c, (M-2)*(N-2)*sizeof(double) );

  for (i=0;i<M;i++)
   {for (j=0;j<N;j++)
     {a[i+j*M]=i*j;}
    }
    Print_matrix(a,M,N);
//enviar vectores a GPU
cudaMemcpy( dev_a, a, M*N*sizeof(double) , cudaMemcpyHostToDevice );

//cudaMemcpy( dev_c, c, N*sizeof(int) , cudaMemcpyHostToDevice );

//llamar al Kernel
dim3 block_p_grd(2,3);
dim3 thr_p_block(M-2,N-2);
 filtro<<<1,thr_p_block>>>(dev_a,dev_c);
 //obtener el resultado de vuelta en la CPU
 cudaMemcpy( c, dev_c, (M-2)*(N-2)*sizeof(double), cudaMemcpyDeviceToHost );
 //for (i=0;i<M;i++)
 // for(j=0;j<N;j++)
 // printf(" %f + %f = %f\n", a[i+j*M],b[i+j*M], c[i+j*M]);
 printf("\n");
      Print_matrix(c,M-2,N-2);
  cudaFree(dev_a) ;
  cudaFree(dev_c) ;
  }
	
	
