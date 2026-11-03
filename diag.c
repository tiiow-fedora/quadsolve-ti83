#define NOMAIN
#define PART 1
#include "qsolve.c"
static void stage(U8 n, const char *s){ cls(); title("DIAG"); puts_(0,2,s,0); putg(0,4,'0'+n,0); puts_(2,4,"press a key",0); present(); key(); }
void main(void){
  stage(1,"S1 basic draw ok");
  qint(I0,7); qint(I1,3); ADD(T0,I0,I1); lreset(); pq(T0); nl(); stage(2,LINE(0));          /* data + line buffers + qop */
  lreset(); toint(I0,I1,I0,1); pn(disc(3,4,-5)); nl(); stage(3,LINE(0));                  /* long math libs */
  lreset(); ps("x|+{}"); nl(); stage(4,LINE(0));
  app_main();
}
