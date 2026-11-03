/* host UI driver: feeds a scripted key sequence to the real app code, dumps the framebuffer at the end */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "qsolve.c"
static const unsigned char *ks; static int kn, ki;
void host_present(void){}
unsigned char host_getcsc(void){
  if(ki>=kn){ FILE*f=fopen("host_screen.bin","wb"); fwrite(GB,1,768,f); fclose(f); exit(0);} 
  return ks[ki++];
}
int main(int argc,char**argv){
  static unsigned char buf[4096]; int i; kn=0;
  for(const char*p=argv[1];*p;p++){
    unsigned char c=0;
    if(*p>='0'&&*p<='9'){ static const unsigned char d[10]={0x21,0x22,0x1A,0x12,0x23,0x1B,0x13,0x24,0x1C,0x14}; c=d[*p-'0']; }
    else switch(*p){case '-':c=0x11;break;case '.':c=0x19;break;case '/':c=0x0D;break;case 'E':c=9;break;case 'G':c=0x31;break;
      case 'C':c=0x0F;break;case 'D':c=0x38;break;case 'u':c=4;break;case 'd':c=1;break;case 'm':c=0x0B;break;}
    buf[kn++]=c; }
  ks=buf; ki=0; app_main();
  FILE*f=fopen("host_screen.bin","wb"); fwrite(GB,1,768,f); fclose(f); return 0;
}
