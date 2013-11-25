#include <R.h>
#include <Rmath.h>

void alpha3d(int *n1, int *n2, double *xtab, double *ytab, double *xref, double *yref, 
double *lambda, double *res1, double *alpha)
{
int i, j, k, test_max, in, ind1;

for(i=0; i < *n2; i++)
{
//initialisation
in=0;

 for(j=0; j < *n1; j++)
 {
 // efficiency score calculated in the output direction
  test_max=0;
  for(k=0; k < 2; k++)
   {if(xtab[2*j+k]<=xref[2*i+k])       // test if the xtab<xref
    {test_max = test_max + 1;
    }
   }
  if(test_max==2)
    { 
      res1[j]=ytab[j]/yref[i]; 
    }
   else
   {res1[j]=0;
    in=in+1;} 
 }
 
 if(in==*n1)
 {lambda[i]=-1;}
 else
 {R_rsort(res1, *n1);
  ind1=imin2(*n1-1,ftrunc(in+*alpha*(*n1-in)));
  //if(ind1!=(in+*alpha*(*n1-in)))
  // {ind1=ind1+1;}
  lambda[i]=res1[ind1];
  } 



}
}

