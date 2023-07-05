/*=========================================================================
* lu_kji_mex.c 
*
* Calcula la descomposici�n LU de A, en la versi�n kji.
*
* La sintaxis de llamada es:
*
*	LU = lu_kji_mex(A)
*========================================================================*/

#include <string.h>
#include "mex.h"

/* Esta macro permite acceder en C a los elementos de una matriz cuadrada
   empleando la notaci�n de Matlab */
#define A(a,b) A[(a)+(b)*n]

/* Calcula la descomposici�n LU de A, en la versi�n kji, con sobreescritura
   en la matriz A. Por defecto, se incluye la notaci�n en C para acceder a 
   los elementos de la matriz, pero se puede escoger entre dicha notaci�n 
   o la de Matlab, comentando o descomentando las instrucciones de una u 
   otra */
void lu_kji_mex(double *A, int n) {
    int i,j,k;
    for (k=0;k<n-1;k++) {
        if (A[k+n*k]==0)  // Notaci�n de C 
        // if (A(k,k)==0) // Notaci�n de Matlab    
            printf("Encontrado pivote nulo\n");
        else {
            for (i=k+1;i<=n-1;i++)
                A[i+k*n]= A[i+n*k]/A[k+n*k]; // Notaci�n de C
                // A(i,k)= A(i,k)/A(k,k);    // Notaci�n de Matlab    
            for (j=k+1;j<=n-1;j++)
                for (i=k+1;i<=n-1;i++)
                    A[i+n*j]= A[i+n*j]- A[i+n*k]*A[k+n*j]; // Notaci�n de C
                    // A(i,j)=A(i,j)-A(i,k)*A(k,j);   // Notaci�n de Matlab    
        }
    }
}

void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[])
{
    /* POR COMPLETAR  */    
}


