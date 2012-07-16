#include <R.h>
#include <Rmath.h>
#include <float.h>

void orderm(int *n1, int *n2, int *pinput, int *qoutput, double *xtab,
double *ytab, double *xref, double *yref, double *lambda, 
double *theta, double *gammaa, double *res1, double *res2, double *res3, double *m)
{
int i, j, k, l, s, test_max, test_min, in, out, nX, nY;
double min_ref, max_ref, minmax_ref, num1, num2, P1, P2, prov1, prov2, prov3;


for(i=0; i < *n2; i++)
{
//initialisation
in=0;
out=0;
 for(j=0; j < *n1; j++)
 {
 // efficiency score calculated in the output direction
  test_max=0;
  for(k=0; k < *pinput; k++)
   {if(xtab[*pinput*j+k]<=xref[*pinput*i+k])       // test if the xtab<xref
    {test_max = test_max + 1;
    }
   }
  if(test_max==*pinput)
    {
      min_ref=ytab[*qoutput*j]/yref[*qoutput*i];
      for(l=1; l < *qoutput; l++)    // research of which output
       {min_ref=fmin2(min_ref, ytab[*qoutput*j+l]/yref[*qoutput*i+l]);}
      
     res1[j]=min_ref;
   }
   else
   {res1[j]=0;
    in=in+1;} 
     
 // efficiency score calculated in the input direction
  test_min=0;
  for(k=0; k < *qoutput; k++)
   {if(ytab[*qoutput*j+k]>=yref[*qoutput*i+k])       // test if the ytab>yref
    {test_min = test_min + 1;
    }
   }
  if(test_min==*qoutput)
   {
    max_ref=xtab[*pinput*j]/xref[*pinput*i];
     for(l=1; l < *pinput; l++)   // research of which output
       {max_ref=fmax2(max_ref,xtab[*pinput*j+l]/xref[*pinput*i+l]);}


    if(theta[i]==0)             // initialisation of theta[i]
    {theta[i]=max_ref;
    }

     res2[j]=max_ref;
   }
  else
  {res2[j]=999;
  out=out+1;
  }

  // efficiency score calculated in the hyperbolic direction

      max_ref=xtab[*pinput*j]/xref[*pinput*i];
      for(l=1; l < *pinput; l++)   // research of which output
       {max_ref=fmax2(max_ref,xtab[*pinput*j+l]/xref[*pinput*i+l]);}
  

      min_ref=yref[*qoutput*i]/ytab[*qoutput*j];
      for(l=1; l < *qoutput; l++)  // research of which output
       {min_ref=fmax2(min_ref,yref[*qoutput*i+l]/ytab[*qoutput*j+l]);}


    minmax_ref=fmax2(min_ref,max_ref);

  res3[j]=1/minmax_ref;
 }
 
 if(in==*n1)
 {lambda[i]=-1;}
 else
 {R_rsort(res1, *n1);
  nX=(*n1-in);
  prov1=0;
  for(l=0; l < nX; l++) 
  {num1=((double) l+1)/nX;
   num2=((double) l)/nX;
   P1=R_pow(num1,*m);
   P2=R_pow(num2,*m);
   prov1=prov1+(P1-P2)*res1[in+l];
  }
  lambda[i]=prov1;
 } 

 if(out==*n1)
 {theta[i]=-1;}
 else
 { R_rsort(res2, *n1);
  nY=(*n1-out);
  prov2=0;
  for(s=0; s < nY; s++) 
  {num1=((double) s+1)/nY;
   num2=((double) s)/nY;
   P1=1.0*pow(num1, *m);
   P2=1.0*pow(num2, *m);
   prov2=prov2+(P1-P2)*res2[*n1-out-s-1];
  }
  theta[i]=prov2;
 }

 R_rsort(res3, *n1); 
 prov3=0;
  for(l=0; l < *n1; l++) 
  {num1=(double) ((double) l+1)/((double) *n1);
   num2=(double) ((double) l)/((double) *n1);
   P1=R_pow(num1,*m);
   P2=R_pow(num2,*m);
   prov3=prov3+res3[l]*(P1-P2);
 }
    gammaa[i]=prov3;
}
}

