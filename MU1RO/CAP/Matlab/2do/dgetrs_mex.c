/*=========================================================
 * dgesv_mex.c - Example for illustrating how to use 
 * LAPACK within a C MEX-file. 
 * Modificación del fichero matrixDivide.c de Matlab para SO de 64 bits
 *
 * X = dgesv_mex(A,B) computes the solution to a 
 * system of linear equations A * X = B
 * using LAPACK routine DGESV, where 
 * A is an N-by-N matrix  
 * X and B are N-by-1 matrices.
 *
 * This is a MEX-file for MATLAB.
 * Copyright 2009-2010 The MathWorks, Inc.
 *=======================================================*/
/* $Revision: 1.1.6.3 $ $Date: 2011/01/28 18:11:56 $ */

#if !defined(_WIN32)
#define dgetrs dgetrs_
#endif

#include <string.h>
#include "mex.h"
#include "lapack.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *A, *b;           /* pointers to input matrices */
    double *LU, *x;          /* in/out arguments to DGESV*/
    size_t m,n,p;            /* matrix dimensions */ 
    mwSignedIndex *iPivot;   /* inputs to DGESV */
    mxArray *Awork;
    mwSignedIndex info, dims[1]; 
    char TRANS = 'N';

    /* size_t and mwSize are unsigned integer types */
    /* mwsignedIndex is a signed integer type */
    
 	/* Check for proper number of arguments. */
    if (nrhs != 3) {
        mexErrMsgIdAndTxt("MATLAB:dgesv_mex:rhs",
            "This function requires 3 input matrices.");
    }
    if (nlhs !=1) {
        mexErrMsgIdAndTxt("MATLAB:dgesv_mex:lhs",
            "This function requires 1 output matrix.");
    }  
    
    /* dimensions of input matrices */
    m = mxGetM(prhs[0]);  
    n = mxGetN(prhs[0]);    

    /* Validate input arguments */
    if (m != n) {
        mexErrMsgIdAndTxt("MATLAB:dgesv_mex:square",
            "LAPACK function requires input matrix 1 must be square.");
    }
    
    /* Matriz a la paso a LU */
    A = mxGetPr(prhs[0]); /* pointer to first input matrix */
    Awork = mxCreateDoubleMatrix(n, n, mxREAL);
    LU = mxGetPr(Awork);
    memcpy(LU, A, n * n * mxGetElementSize(prhs[0]));
    
    /* Matriz b la paso a x, la solucion*/
    b= mxGetPr(prhs[1]);
    plhs[0] = mxCreateDoubleMatrix(n, 1, mxREAL);
    x = mxGetPr(plhs[0]);
    memcpy(x, b, n * mxGetElementSize(prhs[1]));

    /* Pivote*/
    iPivot= (mwSignedIndex *)mxGetData(prhs[2]);

    /* DGESV works in-place, so we copy the inputs first. */
    /* Call LAPACK */
    dgetrs(&TRANS,&n,&n,LU,&n,iPivot,x,&n,&info);
    /* plhs[0] now holds x */
  
    mxDestroyArray(Awork);
}
