/*=========================================================================
* solve_tril_unidad_banda_mex.c 
*
* Resuelve un sistema de ecuaciones Ax=b siendo A una matriz banda 
* triangular inferior unidad.
*
* La sintaxis de llamada es:
*
*	x = solve_tril_unidad_banda_mex(A,b)
*========================================================================*/

#include <string.h>
#include <math.h>
#include "mex.h"

/* Estas macros permiten acceder en C a los elementos de un vector o de una 
   matriz cuadrada empleando la notación de Matlab */
#define A(a,b) A[(a)+(b)*n]
#define b(a) b[a]

int maximo(int a,int b) {
    if (a>b)
       return a;
    else
       return b;
}  

/* Resuelve un sistema de ecuaciones Ax=b, siendo A una matriz banda 
   triangular inferior unidad, con sobreescritura en el vector b. Por 
   defecto, se incluye la notación en C para acceder a los elementos de la 
   matriz o del vector, pero se puede escoger entre dicha notación o la de 
   Matlab comentando o descomentando las instrucciones de una u otra. */
void solve_tril_unidad_banda_mex(double *A, double *b,int n,int ancho){
    int i,j;    
    /* Versión 1, por filas */
    for (i=0;i<n;i++) {
       for (j=maximo(0,i-ancho);j<i;j++)
           b[i]=b[i]-A[i+n*j]*b[j]; // Notación de C
           //b(i)=b(i)-A(i,j)*b(j); // Notación de Matlab
    }    
}

void mexFunction(int nlhs, mxArray *plhs[],int nrhs, const mxArray *prhs[])
{
    double *A;    /* Matriz de entrada */
    double *b,*x; /* Vectores parte derecha e incógnita */
    size_t mA,nA; /* Dimensión de la matriz */
    size_t mb,nb; /* Dimensión del vector */
    size_t ancho; /* Ancho de banda */
    double *lu;   /* Matriz de salida */
    int i;
    /* check for proper number of arguments */
    if (nrhs!=2)
       mexErrMsgIdAndTxt("Matlab:solve_tril_unidad_banda_mex:nrhs","Two inputs required.");

    if (nlhs!=1)
      mexErrMsgIdAndTxt("Matlab:solve_tril_unidad_banda_mex:nlhs","One output required.");

    /* get dimensions of the input matrix */
    mA = mxGetM(prhs[0]);

    /* get dimensions of the input matrix */
    nA = mxGetN(prhs[0]);

    if (mA!=nA) 
        mexErrMsgIdAndTxt("Matlab:solve_tril_unidad_banda_mex:size","Square matrix required as input");      
    
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
      x[i]=b[i]; */
    memcpy(x,b,nA*sizeof(double));        
    
    /* call the computational routine */
    ancho=sqrt(nA);
    solve_tril_unidad_banda_mex(A,x,nA,ancho);
}


