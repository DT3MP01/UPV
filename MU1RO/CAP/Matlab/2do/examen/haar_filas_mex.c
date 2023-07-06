/*==========================================================
* pordos.c - example in MATLAB External Interfaces
*
* Multiplies 1x1 matrix (inMatrix) by 2 
* and outputs a 1x1 matrix (outMatrix)
*
* The calling syntax is:
*
*		outMatrix = pordos(inMatrix)
*
* This is a MEX-file for MATLAB.
* Copyright 1984-2011 The MathWorks, Inc.
*
*========================================================*/
#include "mex.h"

void h_mex(double *Ain, double *Aout,  mwSize m, mwSize n)
{
  mwSize i,j,jaux, n2;
  n2=n/2;
  for (i=0; i<m; i++) 
   {
    jaux=0;
    for (j=0; j<n; j=j+2)
     { 
      Aout[i+jaux*m]=(Ain[i+j*m]+Ain[i+(j+1)*m])/2.0;
      Aout[i+(jaux+n2)*m]=(Ain[i+j*m]-Ain[i+(j+1)*m])/2.0;
      jaux++;
     }
   }  
}       
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[] )
{
  double *A,*out;
  size_t mrows,ncols;
  /* Check for proper number of arguments. */
  if(nrhs!=1) {
    mexErrMsgIdAndTxt( "MATLAB:pordos:invalidNumInputs","One input required.");
  } 
  if(nlhs!=1) {
    mexErrMsgIdAndTxt( "MATLAB:pordos:outputNumInputs","One output required.");
  } 

  mrows = mxGetM(prhs[0]);
  ncols = mxGetN(prhs[0]);
  
  /*Matriz de entrada */
  A = mxGetPr(prhs[0]);
  /* Create matrix for the return argument. */
  
  plhs[0] = mxCreateDoubleMatrix((mwSize)mrows, (mwSize)ncols, mxREAL);
  out = mxGetPr(plhs[0]);
  
  /* Call the timestwo subroutine. */
  h_mex(A,out,(mwSize)mrows, (mwSize)ncols);
  
  
}