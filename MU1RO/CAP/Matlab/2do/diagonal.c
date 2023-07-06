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
    double *inMatrix;               
    size_t ncols;                   
    double *outMatrix; 
    
    if(nrhs!=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","One inputs required.");
    }
    if( mxIsComplex(prhs[0])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notScalar","Complex arguments.");
    }
    
     inMatrix = mxGetPr(prhs[0]);
    
    /* check for proper number of arguments */
    if(mxGetM(prhs[0])==1) { // Es un vector fila
        ncols = mxGetN(prhs[0]);
        plhs[0] = mxCreateDoubleMatrix((mwSize)ncols,(mwSize)ncols,mxREAL);
        outMatrix = mxGetPr(plhs[0]);
        vector2matriz(outMatrix,inMatrix,(mwSize)ncols);
    }
    else if(mxGetN(prhs[0])== mxGetM(prhs[0])) { //Es una matriz Cuadrada
        ncols = mxGetN(prhs[0]);
        plhs[0] = mxCreateDoubleMatrix(1,(mwSize)ncols,mxREAL);
        outMatrix = mxGetPr(plhs[0]);
        matriz2vector(inMatrix,outMatrix,(mwSize)ncols);
    }
    else{ // Es un vector columna
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","Argumento invalido( Matriz no es cuadrada o no es un vector fila).");}
        
}