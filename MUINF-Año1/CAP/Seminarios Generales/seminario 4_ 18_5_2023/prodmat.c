/*==========================================================
* prodmat.c 
*
* Implementa la operación A=B*C
*
* La sintaxis de llamada es:
*
*		C = prodmat(A,B)
*
*========================================================*/

#include "mex.h"
#include <omp.h>

void prodmat(double *A, double *B, double *C, mwSize n)
{
    mwSize i,k;
    int j;
    omp_set_num_threads(1); /* Emplear 1, 2 o 4 hilos */
    #pragma omp parallel for private(k,i)
    for(j=0;j<n; j++)
        for (k=0; k<n; k++) 
             for(i=0;i<n; i++)
                C[j*n+i]= C[j*n+i]+ A[k*n+i]* B[j*n+k];                 
}

void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) 
{
	/* POR COMPLETAR */
}
