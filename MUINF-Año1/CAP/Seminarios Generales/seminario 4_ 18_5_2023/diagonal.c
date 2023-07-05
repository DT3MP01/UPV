/*==========================================================
 * diagonal.c 
 *
 * Reproduce el comportamiento de la función diag de Matlab 
 *
 * La sintaxis de llamada es:
 *
 *		x = diagonal(A) o A = diagonal(x)
 *
 *========================================================*/

#include "mex.h"

void matriz2vector(double *A, double *v, mwSize n)
{
    mwSize i;   
    for(i=0;i<n; i++)
        v[i]= A[i+n*i];                 
} 

void vector2matriz(double *A, double *v, mwSize n)
{
    mwSize i;   
    for(i=0;i<n; i++)
        A[i+n*i]= v[i];                 
} 

void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) 
{
  /* POR COMPLETAR */
}