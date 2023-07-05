/*=========================================================================
* lu_kji_mex.c 
*
* Calcula la descomposición LU de A, en la versión kji.
*
* La sintaxis de llamada es:
*
*	LU = lu_kji_mex(A)
*========================================================================*/

#include <string.h>
#include "mex.h"

/* Esta macro permite acceder en C a los elementos de una matriz cuadrada
   empleando la notación de Matlab */
#define A(a,b) A[(a)+(b)*n]

/* Calcula la descomposición LU de A, en la versión kji, con sobreescritura
   en la matriz A. Por defecto, se incluye la notación en C para acceder a 
   los elementos de la matriz, pero se puede escoger entre dicha notación 
   o la de Matlab, comentando o descomentando las instrucciones de una u 
   otra */
void lu_kji_mex(double *A, int n) {
    int i,j,k;
    for (k=0;k<n-1;k++) {
        if (A[k+n*k]==0)  // Notación de C 
        // if (A(k,k)==0) // Notación de Matlab    
            printf("Encontrado pivote nulo\n");
        else {
            for (i=k+1;i<=n-1;i++)
                A[i+k*n]= A[i+n*k]/A[k+n*k]; // Notación de C
                // A(i,k)= A(i,k)/A(k,k);    // Notación de Matlab    
            for (j=k+1;j<=n-1;j++)
                for (i=k+1;i<=n-1;i++)
                    A[i+n*j]= A[i+n*j]- A[i+n*k]*A[k+n*j]; // Notación de C
                    // A(i,j)=A(i,j)-A(i,k)*A(k,j);   // Notación de Matlab    
        }
    }
}

void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[])
{
    double *A;    /* Matriz de entrada */
    size_t m,n;   /* Dimensión de la matriz */
    double *LU;   /* Matriz de salida */
    int i;
    /* check for proper number of arguments */
    if (nrhs!=1)
       mexErrMsgIdAndTxt("Matlab:lu_kji_mex:nrhs","One input required.");

    if (nlhs!=1)
      mexErrMsgIdAndTxt("Matlab:lu_kji_mex:nlhs","One output required.");

    /* get dimensions of the input matrix */
    m = mxGetM(prhs[0]);

    /* get dimensions of the input matrix */
    n = mxGetN(prhs[0]);

    if (m!=n) 
        mexErrMsgIdAndTxt("Matlab:lu_kji_mex:size","Square matrix required as input");   
  
    /* create a pointer to the real data in the input matrix  */
    A = mxGetPr(prhs[0]);

    /* Not possible to modify or overwrite the input data
    /* create the output matrix */
    plhs[0] = mxCreateDoubleMatrix((mwSize)n,(mwSize)n,mxREAL);

    /* get a pointer to the real data in the output matrix */
    LU = mxGetPr(plhs[0]);
    
    /* copy A to LU */
    /* for (i=0;i<n*n;i++)
       LU[i]=A[i];*/
    memcpy(LU,A,n*n*sizeof(double));
    
    /* call the computational routine */
    lu_kji_mex(LU,n);
}


