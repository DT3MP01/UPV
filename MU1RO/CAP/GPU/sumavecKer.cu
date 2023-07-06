#include <stdio.h>
#define N 12
#define M 8

__global__ void add(int *a, int *b, int *c)
{
  int tidx= threadIdx.x+blockIdx.x*blockDim.x;
  int tidy= threadIdx.y + blockIdx.y*blockDim.y;
  c[tidx+tidy*M]=a[tidx+tidy*M]+b[tidx+tidy*M];
 }
 

   
 int main() {

   
 int a[N*M], b[N*M], c[N*M];
 int *dev_a, *dev_b, *dev_c,i,j;
 //reservar memoria en GPU
 cudaMalloc((void **) &dev_a, N*M*sizeof(int) );
 cudaMalloc((void **) &dev_b, N*M*sizeof(int) );
 cudaMalloc((void **) &dev_c, N*M*sizeof(int) );
 //rellenar vectores en CPU
  for (i=0;i<M;i++)
   {
   for (j=0;j<N;j++){
     a[i+j*M]=-i;
     b[i+j*M]=i*j;
     }
    }
//enviar vectores a GPU
cudaMemcpy( dev_a, a, N*M*sizeof(int) , cudaMemcpyHostToDevice );
cudaMemcpy( dev_b, b, N*M*sizeof(int) , cudaMemcpyHostToDevice );

//llamar al Kernel
dim3 block_p_grd(2,3);
dim3 thr_p_block(4,4);

 add<<<block_p_grd,thr_p_block>>>(dev_a,dev_b,dev_c);
 //obtener el resultado de vuelta en la CPU
 cudaMemcpy( c, dev_c, N*M*sizeof(int), cudaMemcpyDeviceToHost );
 for (i=0;i<M;i++){
    for (j=0;j<N;j++){
  printf(" %d + %d = %d\n", a[i+j*M],b[i+j*M], c[i+j*M]);
  }
  }
  
  cudaFree(dev_a) ;
  cudaFree(dev_b) ;
  cudaFree(dev_c) ;
  }
	
	
