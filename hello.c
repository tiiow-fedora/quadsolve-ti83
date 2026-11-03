typedef unsigned char U8;
#define LW 24
#include "font.h"
#define GBUF ((U8 *)0x9340)
#define LINE(i) ((char *)0x86EC + (unsigned)(i) * (LW + 1))

static void present(void) __naked
{
__asm
    push ix
    ld iy,#0x89F0
    call #0x4092
    ld iy,#0x89F0
    pop ix
    ret
__endasm;
}

static U8 getcsc(void) __naked
{
__asm
    push ix
    ei
    halt
    ld iy,#0x89F0
    rst #0x28
    .dw #0x4018
    pop ix
    ld l,a
    ret
__endasm;
}
#define K_DOWN 1
#define K_UP 4
#define K_ENTER 9
#define K_SUB 0x0B
#define K_DIV 0x0D
#define K_CLEAR 0x0F
#define K_CHS 0x11
#define K_DOT 0x19
#define K_GRAPH 0x31
#define K_DEL 0x38

static void memset_(void){ U8 *p=GBUF; unsigned i; for(i=0;i<768;i++) p[i]=0; }
static U8 key(void)
{
    U8 k;
    do k = getcsc(); while (!k);
    return k;
}

static void putg(U8 c, U8 r, U8 ch, U8 inv)
{
    const U8 *g;
    U8 i, n, *p;
    if (ch < 32 || ch > 126) ch = 32;
    g = font + (unsigned)(ch - 32) * 5;
    p = GBUF + (unsigned)r * 72 + (c >> 1);
    for (i = 0; i < 6; i++) {
        n = i < 5 ? (U8)(g[i] << 1) : 0;
        if (inv) n ^= 15;
        if (c & 1) *p = (*p & 0xF0) | n; else *p = (*p & 0x0F) | (U8)(n << 4);
        p += 12;
    }
}


static void puts_(U8 c, U8 r, const char *s, U8 inv){ while (*s && c < LW) putg(c++, r, *s++, inv); }
static void num(U8 c, U8 r, U8 v){ putg(c,r,'0'+v/100,0); putg(c+1,r,'0'+(v/10)%10,0); putg(c+2,r,'0'+v%10,0); }
void main(void){
  U8 k=0;
  do { memset_(); puts_(0,0,"HELLO TI-83+ WORKS",0); puts_(0,2,"KEY CODE:",0); num(10,2,k); puts_(0,4,"CLEAR QUITS",0); present(); k=key(); } while (k!=K_CLEAR);
}
