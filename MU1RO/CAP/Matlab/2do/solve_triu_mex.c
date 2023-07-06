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
#include <math.h>
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
    double *A;    /* Matriz de entrada */
    double *b,*x; /* Vectores parte derecha e inc�gnita */
    size_t mA,nA; /* Dimensi�n de la matriz */
    size_t mb,nb; /* Dimensi�n del vector */
    double *lu;   /* Matriz de salida */
    int i;
    /* check for proper number of arguments */
    if (nrhs!=2)
       mexErrMsgIdAndTxt("Matlab:solve_triu_mex:nrhs","Two inputs required.");

    if (nlhs!=1)
      mexErrMsgIdAndTxt("Matlab:solve_triu_mex:nlhs","One output required.");

    /* get dimensions of the input matrix */
    mA = mxGetM(prhs[0]);

    /* get dimensions of the input matrix */
    nA = mxGetN(prhs[0]);

    if (mA!=nA) 
        mexErrMsgIdAndTxt("Matlab:solve_triu_mex:size","Square matrix required as input");  
    
    /* get dimensions of the input vector */
    mb = mxGetM(prhs[1]);

    /* get dimensions of the input vector */
    nb = mxGetN(prhs[1]);

    if (nb!=1)
        mexErrMsgIdAndTxt("Matlab:solve_tril_unidad_mex:size","Column vector required as input");   

    if (mA!=mb)
        mexErrMsgIdAndTxt("Matlab:solve_tril_unidad_mex:size","Matrix and vector dimensions must agree");   
    
    /* create a pointer to the real data in the input matrix  */
    A = mxGetPr(prhs[0]);
    
    /* create a pointer to the real data in the input vector  */
    b = mxGetPr(prhs[1]);

    /* create the output matrix */
    plhs[0] = mxCreateDoubleMatrix((mwSize)nA,(mwSize)1,mxREAL);

    /* get a pointer to the real data in the output matrix */
    x = mxGetPr(plhs[0]);
    
    /* copy b to x */
    /*for (i=0;i<nA;i++)
      x[i]=b[i];*/
    memcpy(x,b,nA*sizeof(double));
    /* call the computational routine */
    solve_triu_mex(A,x,nA);
}


