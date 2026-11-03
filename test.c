#include <stdio.h>
#include <string.h>
#include "qsolve.c"
void host_present(void){}
unsigned char host_getcsc(void){return 0;}
static int fails=0, total=0, show=0;
static void cvt(const char*s,char*o){ for(;*s;s++){ switch(*s){case '{':strcpy(o,"±");o+=2;break;case '|':strcpy(o,"²");o+=2;break;case '}':strcpy(o,"√");o+=3;break;case '`':strcpy(o,"≈");o+=3;break;default:*o++=*s;} } *o=0; }
/* run tool ti with comma-separated field strings; expect = text of all lines, or NULL to just print */
static void tc(int ti,const char*flds,const char*expect){
  char buf[64]; int i=0; const char*p=flds; err=0;
  for(int j=0;j<8;j++){have[j]=0;qint(j,0);}
  while(*p){ int n=0; while(*p&&*p!=','&&n<60) buf[n++]=*p++; buf[n]=0; if(*p==',')p++;
    if(n){ have[i]=1; if(parse(buf,i)){printf("PARSE FAIL %s\n",buf);} } i++; }
  lreset(); T[ti].fn(T[ti].mode);
  if(err){ lreset(); ps(err==2?"DIVZERO":"OVF"); nl(); }
  if(col) nl();
  char out[4096]="", t[256];
  for(int l=0;l<nlines;l++){ cvt(LINE(l),t); strcat(out,t); strcat(out,"\n"); }
  total++;
  if(expect && strcmp(out,expect)){ fails++; printf("FAIL tool %d (%s)\n--- got\n%s--- want\n%s\n",ti,flds,out,expect);}
  else if(!expect && show) printf("== tool %d (%s)\n%s",ti,flds,out);
}
int main(int argc,char**argv){
  show = argc>1;
  tc(0,"2,5,8,17","a=(y-k)/(x-h)²\na=12/36\na=1/3\ny=(1/3)(x-2)²+5\ny=(1/3)x²-(4/3)x+19/3\n");
  tc(1,"5,-2,0,1","f(x)=x² shifted:\nvertex form\ny=(x-5)²-2\nstandard form\ny=x²-10x+23\nvertex (5,-2)\nopens up\n");
  tc(1,"0,0,1,1","f(x)=x² shifted:\nvertex form\ny=-x²\nstandard form\ny=-x²\nvertex (0,0)\nopens down\n");
  tc(2,"1,2,0,0,0,15","x²+2x-15=0\n(x+5)(x-3)=0\nx=-5, 3\n");
  tc(2,"0,13,0,1,0,-30","x²-13x-30=0\n(x-15)(x+2)=0\nx=15, -2\n");
  tc(2,"3,14,-5,0,0,0","3x²+14x-5=0\n(3x-1)(x+5)=0\nx=1/3, -5\nx≈0.333, -5\n");
  tc(2,"1,0,0,0,0,-1","x²+1=0\nnot factorable over Q\nuse quad formula:\nx=±i\n");
  tc(2,"0,2,-6,0,0,0","x-3=0\nx=3\n");
  tc(3,"1,0,-64","x²=-64\nx²=-64\nx=±8i\n");
  tc(3,"4,0,16","4x²=16\nx²=4\nx=±2\n");
  tc(3,"3,0,5","3x²=5\nx²=5/3\nx=±(√15)/3\nx≈±1.291\n");
  tc(3,"1,2,-3","(x-2)²=-3\n(x-h)²=-3\nx=2±i√3\nx≈2±1.732i\n");
  tc(3,"2,0,-9","2x²=-9\nx²=-9/2\nx=±(3i√2)/2\nx≈±2.121i\n");
  tc(4,"1,-6,16","h=-b/(2a)=3\nk=f(h)=7\ny=(x-3)²+7\nvertex (3,7)\n");
  tc(4,"2,-8,8","h=-b/(2a)=2\nk=f(h)=0\ny=2(x-2)²\nvertex (2,0)\n");
  tc(5,"3,14,-5","a=3 b=14 c=-5\nD=b²-4ac=256\nx=(-b±√D)/(2a)\nx=1/3, -5\nx≈0.333, -5\n");
  tc(5,"3,-4,7","a=3 b=-4 c=7\nD=b²-4ac=-68\nx=(-b±√D)/(2a)\nx=(2±i√17)/3\nx≈0.667±1.374i\n");
  tc(5,"1,1,-1","a=1 b=1 c=-1\nD=b²-4ac=5\nx=(-b±√D)/(2a)\nx=(-1±√5)/2\nx≈0.618, -1.618\n");
  tc(5,"2,4,2","a=1 b=2 c=1\nD=b²-4ac=0\nx=(-b±√D)/(2a)\nx=-1\n");
  tc(5,"1,0,-72","a=1 b=0 c=-72\nD=b²-4ac=288\nx=(-b±√D)/(2a)\nx=±6√2\nx≈±8.485\n");
  tc(6,"2,-8,8","y=2x²-8x+8\nvertex (2,0)\naxis x=2\ny-int (0,8)\nopens up (min)\n");
  tc(7,"1,4,13","y=x²-8x+29\nvertex (4,13)\naxis x=4\ny-int (0,29)\nopens up (min)\n");
  tc(7,"1,1,-9","y=x²-2x-8\nvertex (1,-9)\naxis x=1\ny-int (0,-8)\nopens up (min)\n");
  tc(6,"-3,-5,9","y=-3x²-5x+9\nvertex (-5/6,133/12)\naxis x=-5/6\ny-int (0,9)\nopens down (max)\n");
  tc(6,"1,-4,1,3,-2","y=x²-4x+1\nvertex (2,-3)\naxis x=2\ny-int (0,1)\nopens up (min)\npoint (3,-2)\nmirror (1,-2)\n");
  tc(9,"1,3,-28","x²+3x-28\n=(x+7)(x-4)\n");
  tc(9,"3,-1,-14","3x²-x-14\n=(3x-7)(x+2)\n");
  tc(9,"2,4,-6","2x²+4x-6\n=2(x+3)(x-1)\n");
  tc(9,"-1,0,4","-x²+4\n=-(x+2)(x-2)\n");
  tc(9,"1,6,9","x²+6x+9\n=(x+3)²\n");
  tc(9,"1,1,1","x²+x+1\nprime over rationals\nroots by formula:\nx=(-1±i√3)/2\nx≈-0.5±0.866i\n");
  tc(12,"1,4,5/2","y=x²-(13/2)x+10\nzeros: x=4, 5/2\nx≈4, 2.5\n");
  tc(12,"1,4,5/2",0);
  tc(10,"1,-3,2","y=x²-3x+2\nx=2, 1\n");
  tc(11,"1,1,-9","y=x²-2x-8\nx=4, -2\n");
  tc(13,"5,-2,-7,3","(5-2i)+(-7+3i)\n=-2+i\n");
  tc(14,"5,-2,-7,3","(5-2i)-(-7+3i)\n=12-5i\n");
  tc(15,"-2,5,-2,-5","(-2+5i)*(-2-5i)\n=29\n");
  tc(16,"6,0,3,-1","(6)/(3-i)\n=9/5+3/5i\n");
  tc(16,"2,-1,5,3","(2-i)/(5+3i)\n=7/34-11/34i\n");
  tc(16,"1,1,0,0","ERROR:\nDIVIDE BY ZERO\n");
  tc(17,"7,-2","conj(7-2i)\n=7+2i\n");
  tc(18,"27","i^27=-i\n(n mod 4 = 3)\n");
  tc(18,"-3","i^-3=i\n(n mod 4 = 1)\n");
  tc(19,"-64","√(-64)=8i\n");
  tc(19,"-72","√(-72)=6i√2\n");
  tc(19,"20","√(20)=2√5\n");
  tc(19,"-1/4","√(-1/4)=1/2i\n");
  tc(20,"3,-4,7","D=b²-4ac\nD=-68\nD<0: two non-real\ncomplex solutions\n");
  tc(20,"-2,1,-12","D=b²-4ac\nD=-95\nD<0: two non-real\ncomplex solutions\n");
  tc(20,"1,2,1","D=b²-4ac\nD=0\nD=0: one real\nsolution\n");
  tc(20,"1,5,2","D=b²-4ac\nD=17\nD>0: two real\nsolutions\n");
  tc(21,"-4,1","one real sol: D=0\nb²-4ac=0\nb²+16=0\nno real value of b\nif complex b ok:\nb=±4i\n");
  tc(21,"2,0","one real sol: D=0\nb²-4ac=0\nb²=0\nb=0\n");
  tc(21,"1,2","one real sol: D=0\nb²-4ac=0\nb²-8=0\ntwo real b:\nb=±2√2\nb≈±2.828\n");
  tc(22,"-16,64,80","h(t)=-16t²+64t+80\nt=-b/(2a)=2\nmax at t=2\nmax height=144 ft\n");
  tc(22,"1,2,3","ERROR:\na MUST BE NEGATIVE\n");
  tc(5,"0,1,1","ERROR:\na CANNOT BE 0\n");
  tc(0,"1,2,1,5","ERROR:\nx=h: NOT A FUNCTION\n");
  tc(0,"1,2,3,2","ERROR:\na=0: NOT A PARABOLA\n");
  tc(5,"123456,234567,-345678","OVF\n");
  tc(5,"1,2147483640,1","OVF\n");
  /* radical simplifier against brute force */
  { int bad=0; for(L n=1;n<=60000;n++){ L m,r; sqfree(n,&m,&r); if(m*m*r!=n) bad++; else for(L k=2;k*k<=r;k++) if(r%(k*k)==0){bad++;break;} }
    total++; if(bad){fails++;printf("FAIL sqfree: %d bad\n",bad);} }
  { L ns[]={2147483647,2147483646,2147395600,1000000007,999999937L*2,1073741824,46340L*46340,1291L*1291*1290}; int bad=0;
    for(int i=0;i<8;i++){ L m,r; sqfree(ns[i],&m,&r); if((UL)m*m*r!=(UL)ns[i]) bad++; }
    total++; if(bad){fails++;printf("FAIL sqfree big\n");} }
  printf("\n%d/%d checks passed\n",total-fails,total);
  return fails;
}
