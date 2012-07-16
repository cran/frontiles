#include <R.h>
#include <Rmath.h>

void orderalpha(int *n1, int *n2, int *pinput, int *qoutput, double *xtab,
double *ytab, double *xref, double *yref, double *lambda, double *output_ref,
double *theta, double *input_ref, double *gammaa, double *hyper_ref,
double *res1, double *res2, double *res3, double *alpha)
{
int i, j, k, l, test_max, test_min, in, out, ind1, ind2, ind3;
double min_ref, max_ref, minmax_ref;


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
      
      
   //  if(lambda[i]<min_ref)
   //  {lambda[i]=min_ref;
   //  output_ref[i]=j+1;
   //  }
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
     input_ref[i]=j+1;
    }

  //  if(theta[i]>max_ref)
  //  {theta[i]=max_ref;
  //   input_ref[i]=j+1;
  //  }
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

  // if(gammaa[i]>minmax_ref)
  // {gammaa[i]=minmax_ref;
  //  hyper_ref[i]=j+1;}
  
  res3[j]=minmax_ref;
 }
 
 if(in==*n1)
 {lambda[i]=-1;}
 else
 {R_rsort(res1, *n1);
  ind1=imin2(*n1-1,ftrunc(in+alpha[i]*(*n1-in)));
  //if(ind1!=(in+*alpha*(*n1-in)))
  // {ind1=ind1+1;}
  lambda[i]=res1[ind1];
  } 

 if(out==*n1)
 {theta[i]=-1;}
 else
 { R_rsort(res2, *n1);
   ind2=ftrunc((1-alpha[i])*(*n1-out));
 //  if(ind2!=((1-*alpha)*(*n1-out)))
 //  {ind2=ind2+1;}   
   theta[i]=res2[ind2];}

 R_rsort(res3, *n1); 
 ind3=ftrunc((1-alpha[i])**n1); 
//   if(ind3!=fround(((1-*alpha)**n1),5))
//   {ind3=fmin2(ind3+1,(*n1-1));}   
 gammaa[i]=res3[ind3];
 
}
}

