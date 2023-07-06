#include <stdio.h>
#define N 16
#define BLOCKSIZE 4






__global__ void comprobar_gpu(int *A, int *sal)
{ int j,res=1;
  int i=blockIdx.x;

  for(j=0;j<N-1;j++)
        if (A[i+j*N]!=A[i+(1+j)*N])
            res=0;
 sal[i]=res;

}


__global__ void comprobar_gpuv2(int *A, int *sal)
{ __shared__ int cache[BLOCKSIZE];
  int tid=threadIdx.x;
  int cacheindex=threadIdx.x;
 
  int res=1;
  int i=blockIdx.x;

  while (tid<N-1){
        if (A[i+tid*N]!=A[i+(1+tid)*N])
            res=0;
            tid+= blockDim.x;
   }
  cache[cacheindex]=res;
  __syncthreads(); 
    
  int j=blockDim.x/2;
  while (j!=0)
   { if (cacheindex<j && cache[cacheindex+j] == 0)
        cache[cacheindex]=0;
     __syncthreads();
   j=j/2;
   } 
  if (cacheindex==0)
     sal[i]=cache[0];

}





void comprobar_cpu(int *A, int *sal)
{  int i,j,res=1;
    for (j=0;j<N-1;j++)
       for(i=0;i<N;i++)
            if (A[i+j*N]!=A[i+(1+j)*N])
              res=0;

    
 *sal=res;
}




void Print_matrix(int C[], int n) {
   int i, j;

   for (i = 0; i < n; i++) {
      for (j = 0; j < n; j++)
         printf("%d ", C[i+j*n]);
      printf("\n");
   }
}  /* Print_matrix */




 
 int main() {

 int i,j;
 
 
  int *A = (int *) malloc( N*N*sizeof(int) );
  int salcpu;

 //rellenar matriz de numeros en CPU
  for (j=0;j<N;j++)
    for(i=0;i<N;i++)
   {
      A[i+N*j]=i;
     
    }
A[5+N*5]=8;
Print_matrix(A,N);
comprobar_cpu(A,&salcpu);
if (salcpu==1)
printf(" \n CPU:La matriz es constante por filas");
else
 printf(" \n CPU:La matriz no es constante por filas");



//Aqui pon el código para reservar memoria, copiar matriz, llamar kernel, traer resultados,
// y lo que sea necesario
  int *sal= (int *)malloc(N*sizeof(int) );
  int *dev_A;
  int *dev_sal; 
  int salgpu;
 cudaMalloc((void **) &dev_A, N*N*sizeof(int) ) ;
 cudaMalloc((void **) &dev_sal, N*sizeof(int) ) ;

cudaMemcpy( dev_A, A, N*N*sizeof(int) , cudaMemcpyHostToDevice );
//VERSION 1

comprobar_gpu<<<N,1>>> (dev_A, dev_sal);

cudaMemcpy( sal, dev_sal, N*sizeof(int), cudaMemcpyDeviceToHost );

 salgpu=1;
 for (i=0;i<N;i++)
if (sal[i]==0)
salgpu=0;
    
    
if (salgpu==1)
printf(" \n GPU:La matriz es  constante por filas");
else
 printf(" \n GPU:La matriz no es constante por filas");

//VERSION 2

comprobar_gpuv2<<<N,BLOCKSIZE>>> (dev_A, dev_sal);   

cudaMemcpy( sal, dev_sal, N*sizeof(int), cudaMemcpyDeviceToHost );

 salgpu=1;
 for (i=0;i<N;i++)
if (sal[i]==0)
salgpu=0;
    
    
if (salgpu==1)
printf(" \nGPUv2:La matriz es  constante por filas\n");
else
 printf(" \n GPUv2:La matriz no es constante por filas\n");

free(A);

 
  }
	
	
