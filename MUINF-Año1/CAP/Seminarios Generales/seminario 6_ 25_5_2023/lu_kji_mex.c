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
    /* POR COMPLETAR  */    
}


