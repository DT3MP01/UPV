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
    omp_set_num_threads(4); /* Emplear 1, 2 o 4 hilos */
    #pragma omp parallel for private(k,i)
    for(j=0;j<n; j++)
        for (k=0; k<n; k++) 
             for(i=0;i<n; i++)
                C[j*n+i]= C[j*n+i]+ A[k*n+i]* B[j*n+k];                 
}

void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) 
{
    double *AMatrix;              /* input scalar */
    double *BMatrix;               /* 1xN input matrix */
    size_t ncols;                   /* size of matrix */
    size_t nrows;
    double *outMatrix;              /* output matrix */

    /* check for proper number of arguments */
    if(nrhs!=2) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","Two inputs required.");
    }
    if(nlhs>=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","One output is required.");
    }
    if(mxGetN(prhs[0])!= mxGetM(prhs[0])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","Primera matriz no es cuadrada");
    }
    if(mxGetN(prhs[1])!= mxGetM(prhs[1]) ) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","Segunda matriz no es cuadrada");
    }
    if(mxGetM(prhs[1])!= mxGetM(prhs[0]) ) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","Las martices no tienen misma dimension");
    }
    if( mxIsComplex(prhs[0]) || mxIsComplex(prhs[1])) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notScalar","Complex arguments.");
    }
    
    
    /* get dimensions of the input matrix */
    ncols = mxGetN(prhs[1]);
    nrows = mxGetM(prhs[1]);
    
    /* create the output matrix */
    plhs[0] = mxCreateDoubleMatrix((mwSize)ncols,(mwSize)ncols,mxREAL);
   

    /* create a pointer to the real data in the input matrix  */
    AMatrix = mxGetPr(prhs[0]);    

    /* get a pointer to the real data in the output matrix */
    BMatrix = mxGetPr(prhs[1]);
    
    outMatrix = mxGetPr(plhs[0]);

    /* call the computational routine */
    prodmat(AMatrix,BMatrix,outMatrix,(mwSize)ncols);
}
