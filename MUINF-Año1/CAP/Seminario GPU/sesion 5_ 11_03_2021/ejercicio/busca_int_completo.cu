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

__global__ void contar_gpu(int *A, int *sal, int num1, int num2)
{ int i,cant=0;
  int j=blockIdx.x;

  for(i=0;i<N-1;i++)
        if ((A[i+j*N]==num1)&&(A[i+1+j*N]==num2))
            cant++;

 sal[j]=cant;

}

__global__ void contarv2(int *A, int *sal, int num1, int num2)
{
__shared__ int cache[BLOCKSIZE];
  int tid=threadIdx.x;
  int j=blockIdx.x;
  int cacheindex=threadIdx.x;
  int  cant=0;
  while (tid<N-1)
  {if ((A[j+tid*N]==num1)&&(A[j+(tid+1)*N]==num2))
            cant++;
            tid+= blockDim.x;
   } 
  cache[cacheindex]=cant;
  __syncthreads();
 int i=blockDim.x/2;
  while (i!=0)
   { if (cacheindex<i)
     cache[cacheindex]+=cache[cacheindex+i];
     __syncthreads();
   i=i/2;
   } 
  if (cacheindex==0)
     sal[j]=cache[0];

 }
 
void contar_int(int *A, int *sal, int num1, int num2)
{  int i,j,cant=0;
    for (j=0;j<N-1;j++)
       for(i=0;i<N;i++)
            if ((A[i+j*N]==num1)&&(A[i+(j+1)*N]==num2))
              cant++;

 *sal=cant;
}

 
 int main() {

 int i,j;
 
 
  int *A = (int *) malloc( N*N*sizeof(int) );
  int salcpu;
  int res=0;


 //rellenar matriz de caracteres en CPU
  for (j=0;j<N;j++)
    for(i=0;i<N;i++)
   {
      A[i+N*j]=rand()% 10;
     
    }
Print_matrix(A,N);
contar_int(A,&salcpu,6,3);
printf(" \n En cpu se cuentan %d secuencias %d %d ",salcpu, 6,3);




//Aqui pon el código para reservar memoria, copiar matriz, llamar kernel, traer resultados,
// y lo que sea necesario

//Comienzo parte GPU

  int *sal= (int *)malloc(N*sizeof(int) ); //variable para copiar resultado de gpu a cpu
//variables para gpu
  int *dev_A;
  int *dev_sal;
 cudaMalloc((void **) &dev_A, N*N*sizeof(int) ) ;
 cudaMalloc((void **) &dev_sal, N*sizeof(int) ) ;

cudaMemcpy( dev_A, A, N*N*sizeof(int) , cudaMemcpyHostToDevice );
contar_gpu<<<N,1>>> (dev_A, dev_sal,6,3);
cudaMemcpy( sal, dev_sal, N*sizeof(int), cudaMemcpyDeviceToHost );

 for (i=0;i<N;i++)
    res=res+sal[i];
   printf("\n en gpu v1  %d",res);
 
contarv2<<<N,BLOCKSIZE>>> (dev_A, dev_sal,6,3);   
 res=0;
 for (i=0;i<N;i++)
    res=res+sal[i];
   printf("\n en gpu v2  %d",res);
   
  free(A);
 
  }
	
	
