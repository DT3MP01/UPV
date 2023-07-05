#include <stdio.h>
#define N 10

__global__ void media(double *a,  double *c)
{
  int tid=threadIdx.x; 
  c[tid]=(a[tid]+a[tid+1]+a[tid+2])/3.0f;
 }
 
 int main() {
 double a[N], c[N];
  int i;
double *dev_a, *dev_c;
 //rellenar vectores en CPU
  for (i=0;i<N;i++)
   {
     a[i]=i*i;
    }
cudaMalloc((void **) &dev_a, N*sizeof(double) );
cudaMalloc((void **) &dev_c, (N-2)*sizeof(double) );
cudaMemcpy( dev_a, a, N*sizeof(double) , cudaMemcpyHostToDevice );
 media<<<1,N-2>>>(dev_a,dev_c);
 //media(a,c);
cudaMemcpy( c, dev_c, (N-2)*sizeof(double), cudaMemcpyDeviceToHost );

 for (i=0;i<N-2;i++)
  printf("  %f\n",  c[i]);
  

  }
	
	
