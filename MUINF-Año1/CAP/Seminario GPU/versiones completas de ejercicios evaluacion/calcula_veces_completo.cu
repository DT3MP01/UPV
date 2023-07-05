#include <stdio.h>

#define N 8
#define BLOCKSIZE 4


void Print_matrix(int C[]) {
   int i, j;

   for (i = 0; i < N; i++) {
      for (j = 0; j < N; j++)
         printf("%d ", C[i+j*N]);
      printf("\n");
   }
}  /* Print_matrix */


void calcula_veces(int *A, int *sal)
{  int i,j;
    int cont=0;
    for (i=0;i<N;i++)
       for(j=0;j<N-1;j++)
            if (A[i+(j+1)*N]%A[i+j*N]==0)
              cont++;


 *sal=cont;
}

 __global__ void calc_veces_gpu1(int *A,  int *sal)
{
  int i,j,cont=0; 
  int tid=threadIdx.x;
 
  for (j=0;j<N-1;j++)
    if (A[tid+(j+1)*N]%A[tid+j*N]==0)
              cont++;

    sal[tid]=cont;   
 }
 
  __global__ void calc_veces_gpu2(int *A, int *sal)
  {
__shared__ int cache[BLOCKSIZE];
  int tid=threadIdx.x;
  int j=blockIdx.x;
  int cacheindex=threadIdx.x;
  int cont=0;
  while (tid<N-1)
  {if (A[j+(tid+1)*N]%A[j+tid*N]==0)
              cont++;
            tid+= blockDim.x;
   } 
  cache[cacheindex]=cont;
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
 
 int main() {

 int i,j;
 
 
  int *A = (int *) malloc( N*N*sizeof(int) );
  int salcpu;


 //rellenar matriz de enteros en CPU
  for (i=0;i<N;i++)
    for(j=0;j<N;j++)
   {
      A[i+N*j]=1+rand()% 10;
     
    }
Print_matrix(A);
calcula_veces(A,&salcpu);
printf(" \n El numero de veces en que un numero va seguido de un multiplo suyo, calculado en cpu, es %d ",salcpu);




//Aqui pon el código para reservar memoria, copiar matriz, llamar kernel, traer resultados,
// y lo que sea necesario

//Comienzo parte GPU

  int *sal= (int *)malloc(N*sizeof(int) ); //variable para copiar resultado parcial de gpu a cpu
//variables para gp
  
int *dev_A = (int *) malloc( N*N*sizeof(int) );
  int *dev_sal = (int *) malloc( N*sizeof(int) );
int salgpu=0;
cudaMalloc((void **) &dev_A, N*N*sizeof(int) );
  cudaMalloc((void **) &dev_sal, N*sizeof(int) );
 cudaMemcpy( dev_A, A, N*N*sizeof(int) ,cudaMemcpyHostToDevice );
calc_veces_gpu1 <<<1,N>>>(dev_A, dev_sal);
//calc_veces_gpu2 <<<N,BLOCKSIZE>>>(dev_A, dev_sal);
 cudaMemcpy( sal, dev_sal, N*sizeof(int), cudaMemcpyDeviceToHost );
//Aqui pon el código para reservar memoria, copiar matriz, llamar kernel, traer resultados,
// y lo que sea necesario

  for (j=0;j<N;j++)
     salgpu=salgpu+sal[j];



printf(" \n El numero de veces en que un numero va seguido de un multiplo suyo, calculado en gpu, es %d ",salgpu);

  free(A);
 
  }
	
	
