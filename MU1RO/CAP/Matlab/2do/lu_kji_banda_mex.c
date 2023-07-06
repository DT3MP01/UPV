/*=========================================================================
* lu_kji_banda_mex.c 
*
* Calcula la descomposición LU de A, en la versión kji, siendo A una matriz
* banda.
*
* La sintaxis de llamada es:
*
*	LU = lu_kji_banda_mex(A)
*========================================================================*/

#include <string.h>
#include <math.h>
#include "mex.h"

/* Esta macro permite acceder en C a los elementos de una matriz cuadrada
   empleando la notación de Matlab */
#define A(a,b) A[(a)+(b)*n]

int minimo(int a,int b){
    if (a<b)
       return a;
    else
       return b;
}   

/* Calcula la descomposición LU de A, en la versión kji, siendo A una 
   matriz banda y con sobreescritura en ella.Por defecto, se incluye la 
   notación en C para acceder a los elementos de la matriz, pero se puede 
   escoger entre dicha notación o la de Matlab, comentando o descomentando 
   las instrucciones de una u otra */
void lu_kji_banda_mex(double *A, int n,int ancho) {
    int i,j,k,limite_sup;
    for (k=0;k<n-1;k++) {
        if (A[k+n*k]==0)
        // if (A(k,k)==0)  // Notación de Matlab  
            printf("Encontrado pivote nulo\n");
        else {
            limite_sup=minimo(k+ancho,n-1);
            for (i=k+1;i<=limite_sup;i++) 
               A[i+k*n]= A[i+n*k]/A[k+n*k]; 
               // A(i,k)= A(i,k)/A(k,k);    // Notación de Matlab
            for (j=k+1;j<=limite_sup;j++)
               for (i=k+1;i<=limite_sup;i++)
                  A[i+n*j]= A[i+n*j]- A[i+n*k]*A[k+n*j]; 
                  // A(i,j)=A(i,j)-A(i,k)*A(k,j);        // Notación de Matlab
        }
    }
}

void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[])
{
    double *A;          /* Matriz de entrada */
    size_t m,n,ancho;   /* Dimensión de la matriz */
    double *LU;         /* Matriz de salida */
    int i;
    /* check for proper number of arguments */
    if (nrhs!=1)
       mexErrMsgIdAndTxt("Matlab:lu_kji_banda_mex:nrhs","One input required.");

    if (nlhs!=1)
      mexErrMsgIdAndTxt("Matlab:lu_kji_banda_mex:nlhs","One output required.");

    /* get dimensions of the input matrix */
    m = mxGetM(prhs[0]);

    /* get dimensions of the input matrix */
    n = mxGetN(prhs[0]);

    if (m!=n) 
        mexErrMsgIdAndTxt("Matlab:lu_kji_banda_mex:size","Square matrix required as input");   
    
    /* create a pointer to the real data in the input matrix  */
    A = mxGetPr(prhs[0]);

    /* create the output matrix */
    plhs[0] = mxCreateDoubleMatrix((mwSize)n,(mwSize)n,mxREAL);

    /* get a pointer to the real data in the output matrix */
    LU = mxGetPr(plhs[0]);
    
    /* copy A to LU /
    /* for (i=0;i<n*n;i++)
      LU[i]=A[i]; */
    memcpy(LU,A,n*n*sizeof(double));
    
    /* call the computational routine */
    ancho=sqrt(n);
    lu_kji_banda_mex(LU,n,ancho);
}


