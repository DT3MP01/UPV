#include <stdio.h>
#define N 10

__global__ void media(double *a,  double *c)
{
  int tid=threadIdx.x;
  if(tid<N-2){
    c[tid]=(a[tid]+a[tid+1]+a[tid+2])/3.0f;
  }
}
 
 
 int main() {
 double a[N], c[N];
 double *dev_a, *dev_c;
 int i;
 
 //reservar memoria en GPU
  cudaMalloc((void **) &dev_a, N*sizeof(double) );
  cudaMalloc((void **) &dev_c, N*sizeof(double) );
  
  //rellenar vectores en CPU
    for (i=0;i<N;i++)
    {
     a[i]=i;
    }
    
 //enviar vectores a GPU
 cudaMemcpy( dev_a, a, N*sizeof(double) , cudaMemcpyHostToDevice );
 cudaMemcpy( dev_c, c, N*sizeof(double) , cudaMemcpyHostToDevice );
 

 media<<<1,N>>>(dev_a,dev_c);
 
 //obtener el resultado a cpu
 cudaMemcpy( c, dev_c, N*sizeof(double), cudaMemcpyDeviceToHost );

 for (i=0;i<N-2;i++)
  printf("  %f\n",  c[i]);
  cudaFree(dev_a);
  cudaFree(dev_c);

  }
	
	
