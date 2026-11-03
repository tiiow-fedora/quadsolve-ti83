/* QSOLVE - quadratic / complex-number solver for the TI-83+/84+ (Z80), MirageOS app.
 * One portable file: exact-rational algebra engine, 13 tools, keypad UI.
 * Build for the calculator with SDCC (build.sh); build for the PC with gcc to run test.c.
 *
 * Numbers are 16-bit rationals held in a register file R[]; discriminants and radicands
 * are 32-bit.  Anything that overflows is reported as NUMBER TOO LARGE, never a wrong answer.
 *
 * Glyph codes inside strings:  { = plus/minus   | = squared   } = square root   ` = approx
 */
#ifdef __SDCC
typedef long L;
typedef unsigned long UL;
#else
#include <stdint.h>
typedef int32_t L;
typedef uint32_t UL;
#endif
typedef int I;
typedef unsigned char U8;

#ifdef CUSTOM
#ifndef USE_vp
#define USE_vp 0
#endif
#ifndef USE_tr
#define USE_tr 0
#endif
#ifndef USE_fac
#define USE_fac 0
#endif
#ifndef USE_sq
#define USE_sq 0
#endif
#ifndef USE_vf
#define USE_vf 0
#endif
#ifndef USE_qf
#define USE_qf 0
#endif
#ifndef USE_feat
#define USE_feat 0
#endif
#ifndef USE_fq
#define USE_fq 0
#endif
#ifndef USE_zero
#define USE_zero 0
#endif
#ifndef USE_cx
#define USE_cx 0
#endif
#ifndef USE_disc
#define USE_disc 0
#endif
#ifndef USE_b
#define USE_b 0
#endif
#ifndef USE_proj
#define USE_proj 0
#endif
#else
#define USE_vp 1
#define USE_tr 1
#define USE_fac 1
#define USE_sq 1
#define USE_vf 1
#define USE_qf 1
#define USE_feat 1
#define USE_fq 1
#define USE_zero 1
#define USE_cx 1
#define USE_disc 1
#define USE_b 1
#define USE_proj 1
#endif
#define N_SOLVEI (USE_qf||USE_zero)
#define N_SOLVE (N_SOLVEI||USE_sq||USE_b)
#define N_SURD (N_SOLVE||USE_cx)
#ifdef NODEC
#define N_DEC 0
#else
#define N_DEC USE_qf
#endif
#define N_ISQRT N_DEC
#define N_DISC (N_SOLVEI||USE_fac||USE_fq)
#define N_BEFORE (N_SOLVE||USE_fac||USE_fq)
#define N_PTERM (USE_vp||USE_tr||USE_feat||USE_proj||USE_fac||USE_fq||USE_zero)
#define N_PVTX (USE_vp||USE_tr||USE_vf||USE_sq)
#define N_VERTEX (USE_vf||USE_feat||USE_proj)
#define N_GETABC (USE_feat||USE_zero)
#define N_FACT (USE_fac||USE_fq)

#define LW 24                 /* columns on screen */
#define NL 30                 /* result lines kept */

typedef struct { I n, d; } Q; /* reduced rational, d > 0 */

#include "font.h"

/* ------------------------------------------------------------------ hardware */
#ifdef __SDCC
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
#else
static U8 GB[768];
#define GBUF GB
static char hostlines[NL][LW + 1];
#define LINE(i) hostlines[i]
extern void host_present(void);
extern U8 host_getcsc(void);
#define present host_present
#define getcsc host_getcsc
#endif

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

static void puts_(U8 c, U8 r, const char *s, U8 inv)
{
    while (*s && c < LW) putg(c++, r, *s++, inv);
}

static void clrrow(U8 r, U8 inv)
{
    U8 c;
    for (c = 0; c < LW; c++) putg(c, r, ' ', inv);
}

static void cls(void)
{
    U8 r;
    for (r = 0; r < 10; r++) clrrow(r, 0);
}

/* ------------------------------------------------------------------ numbers */
static U8 err;      /* 1 overflow, 2 divide by zero */

static I ck(L x)
{
    if (x != (I)x) { err = 1; return 0; }
    return (I)x;
}
static I mi(I a, I b) { return ck((L)a * b); }
static I iabs(I a) { return a < 0 ? -a : a; }
static I gcd(I a, I b)
{
    I t;
    a = iabs(a); b = iabs(b);
    while (b) { t = a % b; a = b; b = t; }
    return a;
}
static I lcm(I a, I b) { return mi(a / gcd(a, b), b); }

static void qn(Q *r, I n, I d)
{
    I g;
    if (d == 0) { err = 2; r->n = 0; r->d = 1; return; }
    if (d < 0) { n = -n; d = -d; }
    g = gcd(n, d);
    if (g > 1) { n /= g; d /= g; }
    r->n = n; r->d = d;
}

/* register file: 0..7 form inputs, 8..13 scratch, 14/15 = surd parts */
enum { I0, I1, I2, I3, I4, I5, I6, I7, T0, T1, T2, T3, T4, T5, SU, SV };
static Q R[16];

#define ADD(r, a, b) qop(0x0000 | ((r) << 8) | ((a) << 4) | (b))
#define SUB(r, a, b) qop(0x1000 | ((r) << 8) | ((a) << 4) | (b))
#define MUL(r, a, b) qop(0x2000 | ((r) << 8) | ((a) << 4) | (b))
#define DIV(r, a, b) qop(0x3000 | ((r) << 8) | ((a) << 4) | (b))
#define NEG(r, a) qop(0x4000 | ((r) << 8) | ((a) << 4))
#define SQ(r, a) qop(0x2000 | ((r) << 8) | ((a) << 4) | (a))
#define MOV(r, a) qop(0x5000 | ((r) << 8) | ((a) << 4))
#define ABS(r, a) qop(0x6000 | ((r) << 8) | ((a) << 4))

static void qop(unsigned x)
{
    Q *r = &R[(x >> 8) & 15], *a = &R[(x >> 4) & 15], *b = &R[x & 15];
    I g, g2, an = a->n, ad = a->d, bn = b->n, bd = b->d;
    switch (x >> 12) {
    case 0: case 1:
        if (x >> 12) bn = -bn;
        g = gcd(ad, bd);
        qn(r, ck((L)mi(an, bd / g) + mi(bn, ad / g)), mi(ad / g, bd));
        break;
    case 3:
        if (bn == 0) { err = 2; r->n = 0; r->d = 1; return; }
        g = bd; bd = bn; bn = g;
        if (bd < 0) { bd = -bd; bn = -bn; }
        /* fall through: multiply by reciprocal */
    case 2:
        g = gcd(an, bd); g2 = gcd(bn, ad);
        if (!g) g = 1;
        if (!g2) g2 = 1;
        qn(r, mi(an / g, bn / g2), mi(ad / g2, bd / g));
        break;
    case 4: r->n = -an; r->d = ad; break;
    case 5: r->n = an; r->d = ad; break;
    case 6: r->n = iabs(an); r->d = ad; break;
    }
}
static void qint(U8 r, I n) { R[r].n = n; R[r].d = 1; }

#if N_DISC
/* b^2 - 4ac as 32 bit */
static L disc(I A, I B, I C)
{
    L p = (L)A * C, q = (L)B * B, D;
    if (p > 0x1FFFFFFFL || p < -0x1FFFFFFFL) { err = 1; return 0; }
    D = q - 4 * p;
    if (p < 0 && D < q) err = 1;
    return D;
}
#endif

#if N_ISQRT
static UL isqrt(UL n)
{
    UL x = n, r = 0, bit = 1UL << 30;
    while (bit > x) bit >>= 2;
    while (bit) {
        if (x >= r + bit) { x -= r + bit; r = (r >> 1) + bit; }
        else r >>= 1;
        bit >>= 2;
    }
    return r;
}
#endif

#if N_SURD
/* n = m*m*r with r square-free  (16-bit trial division; |n| must be <= 65535) */
static void sqfree(L n, L *m, L *r)
{
    unsigned N = n, M = 1, Rr = 1, k;
    U8 c;
    if (n > 65535L) { err = 1; N = 1; }
    for (k = 2; k * k <= N; k++) {
        c = 0;
        while (N % k == 0) { N /= k; c++; }
        if (c & 1) Rr *= k;
        for (; c > 1; c -= 2) M *= k;
    }
    *m = M; *r = Rr * N;
}
#endif

/* surd value  SU +/- SV*sqrt(sr) [*i]  */
static L sr;
static U8 sim;

#if N_SURD
/* SV = sqrt(|R[a]|) as (m/s)*sqrt(sr) */
static void sqrtq(U8 a)
{
    L m;
    sqfree((L)iabs(R[a].n) * R[a].d, &m, &sr);
    qn(&R[SV], ck(m), R[a].d);
}
#endif

/* ------------------------------------------------------------------ output lines */
static U8 nlines, col;
static char *cur;

static void lreset(void)
{
    nlines = 0; col = 0; cur = LINE(0);
}
static void nl(void)
{
    cur[col] = 0;
    if (nlines < NL - 1) nlines++;
    col = 0; cur = LINE(nlines);
}
static void pc(char c)
{
    if (col >= LW) { nl(); cur[col++] = ' '; }
    cur[col++] = c;
}
static void ps(const char *s) { while (*s) pc(*s++); }
static void pl(const char *s) { ps(s); nl(); }
static void pn(L n)
{
    char b[12];
    U8 i = 0;
    UL u;
    if (n < 0) { pc('-'); u = -n; } else u = n;
    do { b[i++] = '0' + (char)(u % 10); u /= 10; } while (u);
    while (i) pc(b[--i]);
}
static void pq(U8 i)
{
    pn(R[i].n);
    if (R[i].d != 1) { pc('/'); pn(R[i].d); }
}
static void ppt(U8 x, U8 y)
{
    pc('('); pq(x); pc(','); pq(y); pc(')');
}

#if N_DEC
/* ---- fixed point decimals: value shown to 3 places, m is in thousandths */
static void pdr(UL m, U8 neg)
{
    U8 i, n;
    I f = m % 1000;
    char b[3];
    if (neg && m) pc('-');
    pn(m / 1000);
    if (f) {
        b[0] = '0' + (char)(f / 100); b[1] = '0' + (char)((f / 10) % 10); b[2] = '0' + (char)(f % 10);
        n = 3;
        while (b[n - 1] == '0') n--;
        pc('.');
        for (i = 0; i < n; i++) pc(b[i]);
    }
}
#endif
#if N_DEC
static void pdq(U8 i)                 /* decimal of a rational */
{
    pdr(((UL)iabs(R[i].n) * 1000 + R[i].d / 2) / R[i].d, R[i].n < 0);
}
#endif
#if N_DEC
static void pdq2(U8 i, U8 j)
{
    pdq(i); ps(", "); pdq(j);
}
#endif
static I gu, gv, gw;                  /* surd as (gu +/- gv*sqrt(sr)) / gw */
static UL ua, us;                     /* magnitudes, in 1/(2000*gw) units */
static U8 uan, usn;                   /* signs (1 = negative) */
#if N_DEC
/* print ua (+/-) us in 3 decimals:  mode 0 = ua+us, 1 = ua-us, 2 = ua alone, 3 = us alone */
static void pdv(U8 mode)
{
    UL a = mode == 3 ? 0 : ua, s = mode == 2 ? 0 : us, m;
    U8 an = mode == 3 ? 0 : uan, sn = usn ^ (mode == 1), neg;
    if (an == sn) { m = a + s; neg = an; }
    else if (a >= s) { m = a - s; neg = an; }
    else { m = s - a; neg = sn; }
    pdr((m + gw) / (2 * (UL)gw), neg);
}
#endif

static void fail(const char *m)
{
    lreset();
    pl("ERROR:");
    pl(m);
}

#if N_PTERM
/* polynomial a v^2 + b v + c */
static void pterm(U8 ci, const char *v, U8 first)
{
    I n = iabs(R[ci].n);
    if (R[ci].n == 0) return;
    if (R[ci].n < 0) pc('-'); else if (!first) pc('+');
    if (*v) {
        if (R[ci].d == 1) { if (n != 1) pn(n); }
        else { pc('('); pn(n); pc('/'); pn(R[ci].d); pc(')'); }
        ps(v);
    } else {
        pn(n);
        if (R[ci].d != 1) { pc('/'); pn(R[ci].d); }
    }
}
#endif
#if N_PTERM
static void ppoly(U8 a, U8 b, U8 c, char var)
{
    char v2[3], v1[2];
    U8 first = 1;
    v2[0] = var; v2[1] = '|'; v2[2] = 0;
    v1[0] = var; v1[1] = 0;
    pterm(a, v2, first); if (R[a].n) first = 0;
    pterm(b, v1, first); if (R[b].n) first = 0;
    pterm(c, "", first); if (R[c].n) first = 0;
    if (first) pc('0');
}
#endif
#if N_PVTX
/* (x-h) with sign handling, unparenthesised when h = 0 */
static void pxh(U8 h)
{
    if (R[h].n == 0) { pc('x'); return; }
    ps("(x"); pc(R[h].n < 0 ? '+' : '-'); pn(iabs(R[h].n));
    if (R[h].d != 1) { pc('/'); pn(R[h].d); }
    pc(')');
}
#endif
#if N_PVTX
/* a(x-h)^2+k */
static void pvtx(U8 a, U8 h, U8 k)
{
    if (R[a].d != 1) { if (R[a].n < 0) pc('-'); pc('('); pn(iabs(R[a].n)); pc('/'); pn(R[a].d); pc(')'); }
    else if (R[a].n == -1) pc('-');
    else if (R[a].n != 1) pn(R[a].n);
    pxh(h); pc('|');
    if (R[k].n) { pc(R[k].n < 0 ? '-' : '+'); pn(iabs(R[k].n)); if (R[k].d != 1) { pc('/'); pn(R[k].d); } }
}
#endif

/* ------------------------------------------------------------------ algebra helpers */
static I ia, ib, ic;          /* integer quadratic coefficients */

#if N_DISC
/* clear fractions of regs a,b,c into ia,ib,ic ; red = divide out the common factor */
static void toint(U8 a, U8 b, U8 c, U8 red)
{
    I m = lcm(lcm(R[a].d, R[b].d), R[c].d), g;
    ia = mi(R[a].n, m / R[a].d);
    ib = mi(R[b].n, m / R[b].d);
    ic = mi(R[c].n, m / R[c].d);
    if (red) {
        g = gcd(gcd(ia, ib), ic);
        if (g > 1) { ia /= g; ib /= g; ic /= g; }
    }
}
#endif
#if N_VERTEX
/* h = -b/2a, k = c - b*h/2... computed as f(h) ; into regs h,k */
static void vertex(U8 a, U8 b, U8 c, U8 h, U8 k)
{
    DIV(h, b, a); qint(T5, -2); DIV(h, h, T5);
    MUL(k, a, h); ADD(k, k, b); MUL(k, k, h); ADD(k, k, c);
}
#endif
#if N_BEFORE
/* factor ordering used throughout: larger denominator first, then larger |numerator| */
static U8 before(U8 a, U8 b)
{
    if (R[a].d != R[b].d) return R[a].d > R[b].d;
    return iabs(R[a].n) >= iabs(R[b].n);
}
#endif
#if N_BEFORE
static void swp(U8 a, U8 b)
{
    Q t;
    t = R[a]; R[a] = R[b]; R[b] = t;
}
#endif
#if N_FACT
static void pfac(U8 r)
{
    if (R[r].d == 1 && R[r].n == 0) { pc('x'); return; }
    pc('(');
    if (R[r].d != 1) pn(R[r].d);
    pc('x'); pc(R[r].n < 0 ? '+' : '-'); pn(iabs(R[r].n)); pc(')');
}
#endif

#if N_FACT
static U8 canfac(void)
{
    L D = disc(ia, ib, ic), m, r;
    if (err || D < 0) return 0;
    if (D == 0) return 1;
    sqfree(D, &m, &r);
    return r == 1;
}
#endif
#if N_FACT
static void dofactor(void)
{
    L D = disc(ia, ib, ic), s = 0, r;
    if (D) sqfree(D, &s, &r);
    I K;
    qn(&R[T0], ck(-ib + s), mi(2, ia));
    qn(&R[T1], ck(-ib - s), mi(2, ia));
    if (!before(T0, T1)) swp(T0, T1);
    K = ia / mi(R[T0].d, R[T1].d);
    if (K == -1) pc('-'); else if (K != 1) pn(K);
    pfac(T0);
    if (D == 0) pc('|'); else pfac(T1);
}
static void proots(void)
{
    ps("x="); pq(T0);
    if (R[T0].n != R[T1].n || R[T0].d != R[T1].d) { ps(", "); pq(T1); }
    nl();
}
#endif

#if N_SURD
static void uvw(void)
{
    gw = lcm(R[SU].d, R[SV].d);
    gu = mi(R[SU].n, gw / R[SU].d);
    gv = mi(R[SV].n, gw / R[SV].d);
}
#endif
#if N_SURD
static void psurd(U8 pm)
{
    if (sr == 1) {
        if (R[SU].n) pq(SU);
        if (pm) pc('{');
        if (!(R[SV].n == 1 && R[SV].d == 1)) pq(SV);
        pc('i');
        return;
    }
    uvw();
    if (gu) { if (gw > 1) pc('('); pn(gu); }
    if (pm) pc('{');
    if (!gu && gw > 1) pc('(');
    if (gv != 1) pn(gv);
    if (sim) pc('i');
    pc('}'); pn(sr);
    if (gw > 1 && (gu || 1)) pc(')');
    if (gw > 1) { pc('/'); pn(gw); }
}
#endif
#if N_DEC
static void pdec(char var)
{
    if (sim && sr == 1 && R[SU].d == 1 && R[SV].d == 1) return;
    uvw();
    if (sr > 1000 || iabs(gv) > 16000) return;
    us = (UL)gv * gv * sr;                        /* gv*sqrt(sr)*2000, as exact as 32 bits allow */
    us = (gv <= 1000 && us <= 1073) ? isqrt(us * 4000000UL) : isqrt((UL)sr * 4000000UL) * (UL)gv;
    usn = 0;
    ua = (UL)iabs(gu) * 2000UL;
    uan = gu < 0;
    pc(var); pc('`');
    if (sim) {
        if (gu) pdv(2);
        pc('{'); pdv(3); pc('i');
    } else if (!gu) { pc('{'); pdv(3); }
    else { pdv(0); ps(", "); pdv(1); }
    nl();
}
#endif
#if N_SOLVE
/* print solutions held as surd (SU, SV, sr, sim) */
static void psols(char var)
{
    pc(var); pc('=');
    if (!sim && sr == 1) {
        ADD(T0, SU, SV);
        SUB(T1, SU, SV);
        if (R[SV].n == 0) pq(T0);
        else if (R[SU].n == 0) { pc('{'); pq(SV); }
        else {
            if (!before(T0, T1)) swp(T0, T1);
            pq(T0); ps(", "); pq(T1);
        }
        nl();
#if N_DEC
        if (R[T0].d != 1 || R[T1].d != 1) {
            pc(var); pc('`'); pdq(T0);
            if (R[SV].n) { ps(", "); pdq(T1); }
            nl();
        }
#endif
        return;
    }
    psurd(1);
    nl();
#if N_DEC
    pdec(var);
#endif
}
#endif
#if N_SOLVEI
/* solve ia x^2 + ib x + ic = 0 */
static void solveint(char var)
{
    L D, m;
    if (ia == 0) {
        if (ib == 0) { pl(ic ? "no solution" : "all real numbers"); return; }
        pc(var); pc('='); qn(&R[T0], -ic, ib); pq(T0); nl();
        return;
    }
    D = disc(ia, ib, ic);
    qn(&R[SU], -ib, mi(2, ia));
    sr = 1; sim = 0;
    if (D == 0) qint(SV, 0);
    else {
        sqfree(D < 0 ? -D : D, &m, &sr);
        qn(&R[SV], ck(m), mi(2, iabs(ia)));
        sim = D < 0;
    }
    if (!err) psols(var);
}
#endif

/* ------------------------------------------------------------------ form values */
static U8 have[8];

#if N_GETABC
/* a,b,c into T0,T1,T2 from I0..I2 for form 0 standard / 1 vertex / 2 factored */
static void getabc(U8 m)
{
    MOV(T0, I0);
    if (m == 0) { MOV(T1, I1); MOV(T2, I2); return; }
    if (m == 1) {                       /* a(x-h)^2+k */
        MUL(T1, I0, I1); ADD(T1, T1, T1); NEG(T1, T1);
        SQ(T2, I1); MUL(T2, T2, I0); ADD(T2, T2, I2);
    } else {                            /* a(x-p)(x-q) */
        ADD(T1, I1, I2); MUL(T1, T1, I0); NEG(T1, T1);
        MUL(T2, I1, I2); MUL(T2, T2, I0);
    }
}
#endif

/* ------------------------------------------------------------------ the tools */
#if USE_vp
static void t_vp(U8 m)       /* h k x y */
{
    (void)m;
    SUB(T0, I2, I0); SUB(T1, I3, I1);
    if (R[T0].n == 0) { fail(R[T1].n ? "x=h: NOT A FUNCTION" : "POINT IS THE VERTEX"); return; }
    SQ(T2, T0); DIV(T3, T1, T2);
    if (R[T3].n == 0) { fail("a=0: NOT A PARABOLA"); return; }
    pl("a=(y-k)/(x-h)|");
    ps("a="); pq(T1); pc('/'); pq(T2); nl();
    ps("a="); pq(T3); nl();
    ps("y="); pvtx(T3, I0, I1); nl();
    MUL(T4, T3, I0); ADD(T4, T4, T4); NEG(T4, T4);
    SQ(T5, I0); MUL(T5, T5, T3); ADD(T5, T5, I1);
    ps("y="); ppoly(T3, T4, T5, 'x'); nl();
}
#endif

#if USE_tr
static void t_tr(U8 m)       /* right  up  reflect  stretch */
{
    (void)m;
    MOV(T0, I3);
    if (R[I2].n) NEG(T0, T0);
    if (R[T0].n == 0) { fail("STRETCH CANNOT BE 0"); return; }
    pl("f(x)=x| shifted:");
    pl("vertex form");
    ps("y="); pvtx(T0, I0, I1); nl();
    MUL(T1, T0, I0); ADD(T1, T1, T1); NEG(T1, T1);
    SQ(T2, I0); MUL(T2, T2, T0); ADD(T2, T2, I1);
    pl("standard form");
    ps("y="); ppoly(T0, T1, T2, 'x'); nl();
    ps("vertex "); ppt(I0, I1); nl();
    pl(R[T0].n > 0 ? "opens up" : "opens down");
}
#endif

#if USE_fac
static void t_fac(U8 m)      /* left a b c, right a b c */
{
    (void)m;
    SUB(T0, I0, I3); SUB(T1, I1, I4); SUB(T2, I2, I5);
    if (R[T0].n == 0 && R[T1].n == 0) { fail("NO x| OR x TERM LEFT"); return; }
    toint(T0, T1, T2, 1);
    if (ia < 0 || (ia == 0 && ib < 0)) { ia = -ia; ib = -ib; ic = -ic; }
    qint(T3, ia); qint(T4, ib); qint(T5, ic);
    ppoly(T3, T4, T5, 'x'); pl("=0");
    if (ia && canfac()) { dofactor(); pl("=0"); }
    else if (ia) { pl("not factorable over Q"); pl("use quad formula:"); }
#if N_SOLVEI
    solveint('x');
#else
    if (!ia) { DIV(T3, T2, T1); NEG(T3, T3); ps("x="); pq(T3); nl(); }
    else if (canfac()) proots();
    else pl("(Quadratic Formula app)");
#endif
}
#endif

#if USE_sq
static void t_sq(U8 m)       /* a  h  c  : a(x-h)^2 = c */
{
    (void)m;
    if (R[I0].n == 0) { fail("a CANNOT BE 0"); return; }
    if (R[I0].n != 1 || R[I0].d != 1) pq(I0);
    pxh(I1); ps("|="); pq(I2); nl();
    DIV(T0, I2, I0);
    ps(R[I1].n ? "(x-h)|=" : "x|="); pq(T0); nl();
    if (R[T0].n == 0) { ps("x="); pq(I1); nl(); return; }
    sqrtq(T0);
    MOV(SU, I1); sim = R[T0].n < 0;
    if (err) return;
    psols('x');
}
#endif

#if USE_vf
static void t_vf(U8 m)       /* a b c -> vertex form */
{
    (void)m;
    if (R[I0].n == 0) { fail("a CANNOT BE 0"); return; }
    vertex(I0, I1, I2, T0, T1);
    ps("h=-b/(2a)="); pq(T0); nl();
    ps("k=f(h)="); pq(T1); nl();
    ps("y="); pvtx(I0, T0, T1); nl();
    ps("vertex "); ppt(T0, T1); nl();
}
#endif

#if USE_qf
static void t_qf(U8 m)       /* a b c */
{
    L D;
    (void)m;
    toint(I0, I1, I2, 1);
    if (ia == 0) { fail("a CANNOT BE 0"); return; }
    ps("a="); pn(ia); ps(" b="); pn(ib); ps(" c="); pn(ic); nl();
    D = disc(ia, ib, ic);
    ps("D=b|-4ac="); pn(D); nl();
    pl("x=(-b{}D)/(2a)");
    solveint('x');
}
#endif

#if USE_feat
static void t_feat(U8 m)     /* a b c [x0 y0] */
{
    getabc(m);                                        /* a,b,c = T0,T1,T2 */
    if (R[T0].n == 0) { fail("a CANNOT BE 0"); return; }
    ps("y="); ppoly(T0, T1, T2, 'x'); nl();
    vertex(T0, T1, T2, T3, T4);
    ps("vertex "); ppt(T3, T4); nl();
    ps("axis x="); pq(T3); nl();
    qint(T5, 0);
    ps("y-int "); ppt(T5, T2); nl();
    pl(R[T0].n > 0 ? "opens up (min)" : "opens down (max)");
    if (have[3]) {
        if (have[4]) MOV(T4, I4);
        else { MUL(T4, T0, I3); ADD(T4, T4, T1); MUL(T4, T4, I3); ADD(T4, T4, T2); }
        ADD(T5, T3, T3); SUB(T5, T5, I3);
        ps("point "); ppt(I3, T4); nl();
        ps("mirror "); ppt(T5, T4); nl();
    }
}
#endif

#if USE_fq
static void t_fq(U8 m)       /* a b c */
{
    (void)m;
    toint(I0, I1, I2, 0);
    if (ia == 0) { fail("a CANNOT BE 0"); return; }
    qint(T3, ia); qint(T4, ib); qint(T5, ic);
    ppoly(T3, T4, T5, 'x'); nl();
    if (canfac()) { ps("="); dofactor(); nl(); }
    else {
        pl("prime over rationals");
#if N_SOLVEI
        pl("roots by formula:"); solveint('x');
#else
        pl("(Quadratic Formula app)");
#endif
    }
}
#endif

#if USE_zero
static void t_zero(U8 m)     /* form 0/1/2 : a b c */
{
    getabc(m);
    if (R[T0].n == 0) { fail("a CANNOT BE 0"); return; }
    ps("y="); ppoly(T0, T1, T2, 'x'); nl();
    if (m == 2) {                        /* factored form: zeros are p and q as typed */
        ps("zeros: x="); pq(I1);
        if (R[I1].n != R[I2].n || R[I1].d != R[I2].d) { ps(", "); pq(I2); }
        nl();
#if N_DEC
        if (R[I1].d != 1 || R[I2].d != 1) { ps("x`"); pdq2(I1, I2); nl(); }
#endif
        return;
    }
    toint(T0, T1, T2, 1);
    solveint('x');
}
#endif

#if USE_cx
static void pz(U8 re, U8 im)
{
    if (R[im].n == 0) { pq(re); return; }
    if (R[re].n) pq(re);
    if (R[im].n < 0) pc('-'); else if (R[re].n) pc('+');
    ABS(T5, im);
    if (!(R[T5].n == 1 && R[T5].d == 1)) pq(T5);
    pc('i');
}
#endif

#if USE_cx
static void t_cx(U8 m)       /* 0 add 1 sub 2 mul 3 div 4 conj 5 i^n 6 sqrt ; z1=I0+I1 i  z2=I2+I3 i */
{
    I k;
    if (m == 4) {
        NEG(T1, I1);
        ps("conj("); pz(I0, I1); pl(")");
        ps("="); pz(I0, T1); nl();
        return;
    }
    if (m == 5) {
        if (R[I0].d != 1) { fail("n MUST BE AN INTEGER"); return; }
        k = ((R[I0].n % 4) + 4) % 4;
        ps("i^"); pn(R[I0].n); ps("="); pl(k == 0 ? "1" : k == 1 ? "i" : k == 2 ? "-1" : "-i");
        ps("(n mod 4 = "); pn(k); pl(")");
        return;
    }
    if (m == 6) {
        if (R[I0].n == 0) { pl("}0=0"); return; }
        sqrtq(I0);
        qint(SU, 0); sim = R[I0].n < 0;
        ps("}("); pq(I0); ps(")=");
        if (sr == 1 && !sim) pq(SV); else psurd(0);
        nl();
        return;
    }
    pc('('); pz(I0, I1); pc(')');
    pc(m == 0 ? '+' : m == 1 ? '-' : m == 2 ? '*' : '/');
    pc('('); pz(I2, I3); pc(')'); nl();
    if (m < 2) {
        if (m) { SUB(T0, I0, I2); SUB(T1, I1, I3); }
        else { ADD(T0, I0, I2); ADD(T1, I1, I3); }
    } else if (m == 2) {
        MUL(T2, I0, I2); MUL(T3, I1, I3); SUB(T0, T2, T3);
        MUL(T2, I0, I3); MUL(T3, I1, I2); ADD(T1, T2, T3);
    } else {
        SQ(T2, I2); SQ(T3, I3); ADD(T4, T2, T3);          /* |z2|^2 */
        if (R[T4].n == 0) { fail("DIVIDE BY ZERO"); return; }
        MUL(T2, I0, I2); MUL(T3, I1, I3); ADD(T0, T2, T3); DIV(T0, T0, T4);
        MUL(T2, I1, I2); MUL(T3, I0, I3); SUB(T1, T2, T3); DIV(T1, T1, T4);
    }
    ps("="); pz(T0, T1); nl();
}
#endif

#if USE_disc
static void t_disc(U8 m)     /* a b c */
{
    (void)m;
    if (R[I0].n == 0) { fail("a CANNOT BE 0"); return; }
    SQ(T0, I1); MUL(T1, I0, I2); ADD(T1, T1, T1); ADD(T1, T1, T1);
    SUB(T2, T0, T1);
    pl("D=b|-4ac");
    ps("D="); pq(T2); nl();
    if (R[T2].n > 0) { pl("D>0: two real"); ps("solutions"); }
    else if (R[T2].n == 0) { pl("D=0: one real"); ps("solution"); }
    else { pl("D<0: two non-real"); ps("complex solutions"); }
    nl();
}
#endif

#if USE_b
static void t_b(U8 m)        /* a c : a x^2 + b x + c */
{
    (void)m;
    if (R[I0].n == 0) { fail("a CANNOT BE 0"); return; }
    MUL(T0, I0, I1); ADD(T0, T0, T0); ADD(T0, T0, T0); NEG(T0, T0);   /* -4ac */
    pl("one real sol: D=0");
    pl("b|-4ac=0");
    ps("b|");
    if (R[T0].n) { pc(R[T0].n < 0 ? '-' : '+'); ABS(T1, T0); pq(T1); }
    pl("=0");
    if (R[T0].n == 0) { pl("b=0"); return; }
    sqrtq(T0);
    qint(SU, 0);
    if (err) return;
    if (R[T0].n > 0) {
        pl("no real value of b");
        pl("if complex b ok:");
        sim = 1;
    } else {
        pl("two real b:");
        sim = 0;
    }
    psols('b');
}
#endif

#if USE_proj
static void t_proj(U8 m)     /* a b c : h(t) */
{
    (void)m;
    if (R[I0].n >= 0) { fail("a MUST BE NEGATIVE"); return; }
    ps("h(t)="); ppoly(I0, I1, I2, 't'); nl();
    vertex(I0, I1, I2, T0, T1);
    ps("t=-b/(2a)="); pq(T0); nl();
    ps("max at t="); pq(T0); nl();
    ps("max height="); pq(T1); pl(" ft");
#if N_DEC
    if (R[T0].d != 1 || R[T1].d != 1) { ps("`"); pdq2(T0, T1); nl(); }
#endif
}
#endif

/* ------------------------------------------------------------------ tool table */
typedef struct {
    const char *title;
    U8 nf;
    const char *const *lab;
    const char *const *def;
    void (*fn)(U8);
    U8 mode;
} Tool;

static const char *const lbl_vp[] = { "h (vertex x)", "k (vertex y)", "point x", "point y" };
static const char *const lbl_tr[] = { "right(+)/left", "up(+)/down", "reflect x=1", "stretch" };
static const char *const def_tr[] = { "0", "0", "0", "1" };
static const char *const lbl_fac[] = { "left x| ", "left x ", "left num", "right x| ", "right x ", "right num" };
static const char *const lbl_sq[] = { "a", "h  (x-h)|", "c" };
static const char *const def_sq[] = { "1", "0", "0" };
static const char *const lbl_abc[] = { "a (x|)", "b (x)", "c" };
static const char *const lbl_abcp[] = { "a (x|)", "b (x)", "c", "pt x opt", "pt y opt" };
static const char *const lbl_vf[] = { "a", "h", "k", "pt x opt", "pt y opt" };
static const char *const lbl_ff[] = { "a", "p", "q", "pt x opt", "pt y opt" };
static const char *const lbl_zf[] = { "a", "p  (x-p)", "q  (x-q)" };
static const char *const lbl_z2[] = { "z1 real", "z1 imag", "z2 real", "z2 imag" };
static const char *const lbl_n[] = { "n" };
static const char *const lbl_rad[] = { "radicand" };
static const char *const lbl_ac[] = { "a (x|)", "c" };
static const char *const lbl_pj[] = { "t| coef", "t coef", "constant" };
static const char *const def_one[] = { "1" };
static const char *const d_zero[] = { "0", "0", "0", "0", "0", "0" };
static const char *const d_opt[] = { "0", "0", "0", "", "" };

static const Tool T[] = {
#if USE_vp
    { "VERTEX+POINT>PARABOLA", 4, lbl_vp, d_zero, t_vp, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_tr
    { "TRANSFORMATIONS", 4, lbl_tr, def_tr, t_tr, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_fac
    { "SOLVE BY FACTORING", 6, lbl_fac, d_zero, t_fac, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_sq
    { "SOLVE BY SQUARE ROOTS", 3, lbl_sq, def_sq, t_sq, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_vf
    { "STANDARD>VERTEX FORM", 3, lbl_abc, d_zero, t_vf, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_qf
    { "QUADRATIC FORMULA", 3, lbl_abc, d_zero, t_qf, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_feat
    { "FEATURES: STANDARD", 5, lbl_abcp, d_opt, t_feat, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_feat
    { "FEATURES: VERTEX", 5, lbl_vf, d_opt, t_feat, 1 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_feat
    { "FEATURES: FACTORED", 5, lbl_ff, d_opt, t_feat, 2 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_fq
    { "FACTOR QUADRATIC", 3, lbl_abc, d_zero, t_fq, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_zero
    { "ZEROS: STANDARD", 3, lbl_abc, d_zero, t_zero, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_zero
    { "ZEROS: VERTEX", 3, lbl_vf, d_zero, t_zero, 1 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_zero
    { "ZEROS: FACTORED", 3, lbl_zf, d_zero, t_zero, 2 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_cx
    { "COMPLEX: z1 + z2", 4, lbl_z2, d_zero, t_cx, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_cx
    { "COMPLEX: z1 - z2", 4, lbl_z2, d_zero, t_cx, 1 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_cx
    { "COMPLEX: z1 * z2", 4, lbl_z2, d_zero, t_cx, 2 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_cx
    { "COMPLEX: z1 / z2", 4, lbl_z2, d_zero, t_cx, 3 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_cx
    { "COMPLEX: CONJUGATE", 2, lbl_z2, d_zero, t_cx, 4 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_cx
    { "COMPLEX: i^n", 1, lbl_n, def_one, t_cx, 5 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_cx
    { "COMPLEX: SQRT", 1, lbl_rad, d_zero, t_cx, 6 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_disc
    { "DISCRIMINANT", 3, lbl_abc, d_zero, t_disc, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_b
    { "FIND b: ONE SOLUTION", 2, lbl_ac, d_zero, t_b, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
#if USE_proj
    { "PROJECTILE MAX", 3, lbl_pj, d_zero, t_proj, 0 },
#else
    { 0, 0, 0, 0, 0, 0 },
#endif
};

/* ------------------------------------------------------------------ UI */
static char fb[8][13];
static U8 fresh[8];

static U8 strlen_(const char *s)
{
    U8 n = 0;
    while (*s++) n++;
    return n;
}

static U8 digit(U8 k)
{
    switch (k) {
    case 0x21: return 0; case 0x22: return 1; case 0x1A: return 2; case 0x12: return 3;
    case 0x23: return 4; case 0x1B: return 5; case 0x13: return 6; case 0x24: return 7;
    case 0x1C: return 8; case 0x14: return 9;
    }
    return 255;
}

/* parse "[-]digits[.digits][/digits]" into R[i]; returns 0 ok */
static U8 parse(const char *s, U8 i)
{
    unsigned n = 0, d = 1, den = 0, *t;
    U8 neg = 0, dot = 0, slash = 0, dg = 0;
    if (*s == '-') { neg = 1; s++; }
    for (; *s; s++) {
        if (*s == '.') { if (dot || slash) return 1; dot = 1; }
        else if (*s == '/') { if (slash || !dg) return 1; slash = 1; dg = 0; den = 0; }
        else {
            dg = 1;
            t = slash ? &den : &n;
            if (*t > 3276) { err = 1; return 1; }
            *t = *t * 10 + (*s - '0');
            if (dot && !slash) { if (d > 3276) { err = 1; return 1; } d *= 10; }
            if (*t > 32767) { err = 1; return 1; }
        }
    }
    if (!dg) { if (neg || slash || dot) return 1; qint(i, 0); return 0; }
    if (slash) {
        if (den == 0) { err = 2; return 1; }
        d = mi(d, den);
    }
    qn(&R[i], neg ? -(I)n : (I)n, d);
    return err;
}

static void title(const char *t)
{
    clrrow(0, 1);
    puts_(0, 0, t, 1);
}

static void notice(const char *m)
{
    clrrow(9, 1);
    puts_(0, 9, m, 1);
    present();
    key();
}

static U8 menu(const char *ttl, const char *const *items, U8 n)
{
    U8 sel = 0, top = 0, i, k, r, inv, c;
    for (;;) {
        cls();
        title(ttl);
        for (i = 0; i < 9 && top + i < n; i++) {
            r = top + i; inv = (r == sel);
            clrrow(i + 1, inv);
            c = 0;
            if (r >= 9) putg(c++, i + 1, '1', inv);
            putg(c++, i + 1, '0' + (r < 9 ? r + 1 : r - 9), inv);
            putg(c++, i + 1, ':', inv);
            puts_(c, i + 1, items[r], inv);
        }
        present();
        k = key();
        if (k == K_UP) sel = sel ? sel - 1 : n - 1;
        else if (k == K_DOWN) sel = sel + 1 < n ? sel + 1 : 0;
        else if (k == K_ENTER) return sel;
        else if (k == K_CLEAR) return 255;
        else if ((i = digit(k)) >= 1 && i <= n) return i - 1;
        if (sel < top) top = sel;
        if (sel >= top + 9) top = sel - 8;
    }
}

static U8 viewer(void)       /* 1 = back to form, 0 = menu */
{
    U8 top = 0, i, k;
    for (;;) {
        cls();
        for (i = 0; i < 9 && top + i < nlines; i++) puts_(0, i, LINE(top + i), 0);
        clrrow(9, 1);
        puts_(0, 9, "ENTER:edit CLEAR:menu", 1);
        present();
        k = key();
        if (k == K_UP && top) top--;
        else if (k == K_DOWN && top + 9 < nlines) top++;
        else if (k == K_ENTER) return 1;
        else if (k == K_CLEAR) return 0;
    }
}

static void strcpy_(char *d, const char *s)
{
    while ((*d++ = *s++)) ;
}

static void run(U8 ti)
{
    const Tool *t = &T[ti];
    U8 nf = t->nf, f = 0, i, k, len, fr = 0xFF, num;
    char *b;
    for (i = 0; i < nf; i++) strcpy_(fb[i], t->def[i]);
    for (;;) {
        cls();
        title(t->title);
        for (i = 0; i < nf; i++) {
            puts_(0, i + 1, t->lab[i], i == f);
            puts_(12, i + 1, fb[i], 0);
        }
        b = fb[f];
        len = strlen_(b);
        putg(12 + len, f + 1, '_', 0);
        puts_(0, 9, "ENTER:next GRAPH:solve", 0);
        present();
        k = key();
        num = digit(k) < 10 || k == K_DOT || k == K_DIV;
        if (k == K_CLEAR) { if (len) { b[0] = 0; fr &= ~(1 << f); } else return; }
        else if (k == K_UP) { if (f) f--; }
        else if (k == K_DOWN) { if (f + 1 < nf) f++; }
        else if (k == K_DEL) { if (len) b[len - 1] = 0; fr &= ~(1 << f); }
        else if (num) {
            if ((fr >> f) & 1) { b[0] = 0; len = 0; fr &= ~(1 << f); }
            if (len < 11) { b[len] = k == K_DOT ? '.' : k == K_DIV ? '/' : '0' + digit(k); b[len + 1] = 0; }
        } else if (k == K_CHS || k == K_SUB) {                  /* toggle leading minus */
            fr &= ~(1 << f);
            if (b[0] == '-') strcpy_(b, b + 1);
            else if (len < 11) { for (i = len + 1; i; i--) b[i] = b[i - 1]; b[0] = '-'; }
        } else if (k == K_ENTER && f + 1 < nf) f++;
        else if (k == K_GRAPH || k == K_ENTER) {
            err = 0;
            for (i = 0; i < nf; i++) {
                have[i] = fb[i][0] != 0;
                qint(i, 0);
                if (have[i] && parse(fb[i], i)) break;
            }
            if (i < nf) {
                f = i;
                notice(err == 2 ? "DIVIDE BY ZERO" : err ? "NUMBER TOO LARGE" : "BAD NUMBER");
                continue;
            }
            lreset();
            t->fn(t->mode);
            if (err) {
                lreset();
                pl("ERROR:");
                pl(err == 2 ? "DIVIDE BY ZERO" : "NUMBER TOO LARGE");
            }
            if (col) nl();
            if (!viewer()) return;
        }
    }
}

static const char *const mainmenu[] = {
    "Vertex+Point>Parabola", "Transformations", "Solve by Factoring", "Solve by Sq Roots",
    "Standard>Vertex Form", "Quadratic Formula", "Parabola Features", "Factor Quadratic",
    "Find Zeros", "Complex Numbers", "Discriminant", "Find b: 1 Solution", "Projectile Maximum"
};
static const char *const formmenu[] = { "ax|+bx+c", "a(x-h)|+k", "a(x-p)(x-q)" };
static const char *const cxmenu[] = { "z1 + z2", "z1 - z2", "z1 * z2", "z1 / z2", "Conjugate", "i^n", "Simplify sqrt(n)" };

#ifdef CUSTOM
#ifdef HAVE_APPTITLE
#include "apptitle.h"
#else
#define APPTITLE "QUAD SOLVER"
#endif
static const char *items[23];
static U8 idx[23];
void app_main(void)
{
    U8 n = 0, i, s;
    for (i = 0; i < 23; i++) if (T[i].fn) { items[n] = T[i].title; idx[n++] = i; }
    for (;;) {
        s = menu(APPTITLE, items, n);
        if (s == 255) return;
        run(idx[s]);
    }
}
#else
void app_main(void)
{
    U8 s, f;
    for (;;) {
        s = menu("QUAD SOLVER", mainmenu, 13);
        if (s == 255) return;
        if (s < 6) run(s);
        else if (s == 7) run(9);
        else if (s == 6 || s == 8) {
            f = menu("ENTER FUNCTION AS", formmenu, 3);
            if (f != 255) run((s == 6 ? 6 : 10) + f);
        } else if (s == 9) {
            f = menu("COMPLEX NUMBERS", cxmenu, 7);
            if (f != 255) run(13 + f);
        } else run(s + 10);          /* discriminant, find b, projectile */
    }
}
#endif

#if defined(__SDCC) && !defined(NOMAIN)
void main(void) { app_main(); }
#endif
