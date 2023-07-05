#include <stdio.h>
#define N 10

void media(double *a,  double *c)
{
  int i;
  for (i=0;i<N-2;i++)
  c[i]=(a[i]+a[i+1]+a[i+2])/3.0f;
 }
 
 int main() {
 double a[N], c[N];
  int i;

 //rellenar vectores en CPU
  for (i=0;i<N;i++)
   {
     a[i]=i*i;
    }


 media(a,c);

 for (i=0;i<N-2;i++)
  printf("  %f\n",  c[i]);
  

  }
	
	
