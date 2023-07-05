#include <stdio.h>
#define N 16
#define BLOCKSIZE 4


void Print_matrix(int C[], int n) {
   int i, j;

   for (i = 0; i < n; i++) {
      for (j = 0; j < n; j++)
         printf("%d ", C[i+j*n]);
      printf("\n");
   }
}  /* Print_matrix */


void comprobar_cpu(int *A, int *sal)
{  int i,j,res=1;
    for (j=0;j<N-1;j++)
       for(i=0;i<N;i++)
            if (A[i+j*N]!=A[i+(1+j)*N])
              res=0;

    
 *sal=res;
}

 __global__ void const_gpu1(int *A,  int *sal)
{
  int i,j,res=1; 
  int tid=threadIdx.x;
 
  for (j=0;j<N-1;j++)
    if (A[tid+j*N]!=A[tid+(1+j)*N])
              res=0;
    sal[tid]=res;
    
 }
 
 __global__ void const_gpu2(int *A, int *sal)
{
__shared__ int cache[BLOCKSIZE];
  int tid=threadIdx.x;
  int j=blockIdx.x;
  int cacheindex=threadIdx.x;
  int res=1;
  while (tid<N-1)
  {if (A[j+tid*N]!=A[j+(1+tid)*N])
            res=0;
            tid+= blockDim.x;
   } 
  cache[cacheindex]=res;
  __syncthreads();
 int i=blockDim.x/2;
  while (i!=0)
   { if (cacheindex<i)
     cache[cacheindex]*=cache[cacheindex+i]; 
     __syncthreads();
   i=i/2;
   } 
  if (cacheindex==0)
     sal[j]=cache[0];

 }
 int main() {

 int i,j;
 
 
  int *A = (int *) malloc( N*N*sizeof(int) );
  int salcpu;
  int *sal= (int *) malloc( N*sizeof(int) );
 //rellenar matriz de numeros en CPU
  for (j=0;j<N;j++)
    for(i=0;i<N;i++)
   {
      A[i+N*j]=i;
     
    }
//A[5+N*5]=8;
Print_matrix(A,N);
comprobar_cpu(A,&salcpu);
if (salcpu==1)
printf(" \n La matriz es constante por filas");
else
 printf(" \n La matriz no es constante por filas");



//Aqui pon el código para reservar memoria, copiar matriz, llamar kernel, traer resultados,
// y lo que sea necesario

//Comienzo parte GPU

int *dev_A = (int *) malloc( N*N*sizeof(int) );
  int *dev_sal = (int *) malloc( N*sizeof(int) );
int salgpu=1;
cudaMalloc((void **) &dev_A, N*N*sizeof(int) );
  cudaMalloc((void **) &dev_sal, N*sizeof(int) );
 cudaMemcpy( dev_A, A, N*N*sizeof(int) ,cudaMemcpyHostToDevice );
//const_gpu1 <<<1,N>>>(dev_A, dev_sal);
const_gpu2 <<<N,BLOCKSIZE>>>(dev_A, dev_sal);
 cudaMemcpy( sal, dev_sal, N*sizeof(int), cudaMemcpyDeviceToHost );
//Aqui pon el código para reservar memoria, copiar matriz, llamar kernel, traer resultados,
// y lo que sea necesario

  for (j=0;j<N;j++)
{    printf("%d ",sal[j]);
    if (sal[j]==0)
     salgpu=0;
     }

//Comienzo parte GPU

if (salgpu==1)
printf(" \n La matriz es constante por filas");
else
 printf(" \n La matriz no es constante por filas");

 
  }
	
	
