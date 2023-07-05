/*=========================================================================
* solve_triu_mex.c 
*
* Resuelve un sistema de ecuaciones Ax=b siendo A una matriz triangular
% superior.
*
* La sintaxis de llamada es:
*
*	x = solve_triu_mex(A,b)
*========================================================================*/

#include <string.h>
#include "mex.h"

/* Estas macros permiten acceder en C a los elementos de un vector o de una 
   matriz cuadrada empleando la notaci�n de Matlab */
#define A(a,b) A[(a)+(b)*n]
#define b(a) b[a]

/* Resuelve un sistema de ecuaciones Ax=b, siendo A una matriz triangular
   superior, con sobreescritura en el vector b. Por defecto, se incluye la 
   notaci�n en C para acceder a los elementos de la matriz o del vector, 
   pero se puede escoger entre dicha notaci�n o la de Matlab comentando o 
   descomentando las instrucciones de una u otra. */
void solve_triu_mex(double *A, double *b,int n)
{
    int i,j;
    for (i=n-1;i>=0;i--) {
        for (j=i+1;j<=n-1;j++) {
            b[i]=b[i]-A[i+n*j]*b[j]; // Notaci�n en C
            //b(i)=b(i)-A(i,j)*b(j); // Notaci�n en Matlab
        }
        b[i]=b[i]/A[i+n*i]; // Notaci�n en C
        //b(i)=b(i)/A(i,i); // Notaci�n en Matlab
    }     
}

void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[])
{
    /* POR COMPLETAR  */     
}


