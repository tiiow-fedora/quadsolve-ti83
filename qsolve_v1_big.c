/* QSOLVE - quadratic / complex-number solver for the TI-83+/84+ (Z80), MirageOS app.
 * One portable file: exact-rational algebra engine, 13 tools, keypad UI.
 * Build for the calculator with SDCC (build.sh); build for the PC with gcc to run test.c.
 *
 * Numbers are 16-bit rationals; discriminants / radicands are 32-bit.  Anything that
 * overflows is reported as NUMBER TOO LARGE instead of giving a wrong answer.
 *
 * Glyph codes inside strings:  { = plus/minus   | = squared   } = square root
 *                              ~ = cursor arrow ` = approx
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

#define LW 24                 /* columns on screen */
#define NL 30                 /* result lines kept */

typedef struct { I n, d; } Q; /* reduced rational, d > 0 */
typedef struct { Q U, V; L r; unsigned char im; } S; /* U +/- V*sqrt(r) [*i] */

#include "font.h"

/* ------------------------------------------------------------------ hardware */
#ifdef __SDCC
#define GBUF ((unsigned char *)0x9340)
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

static unsigned char getcsc(void) __naked
{
__asm
    push ix
    ei
    halt
    ld iy,#0x89F0
    rst #0x28
    .dw #0x4972
    pop ix
    ld l,a
    ret
__endasm;
}
#else
static unsigned char GB[768];
#define GBUF GB
static char hostlines[NL][LW + 1];
#define LINE(i) hostlines[i]
extern void host_present(void);
extern unsigned char host_getcsc(void);
#define present host_present
#define getcsc host_getcsc
#endif

#define K_DOWN 1
#define K_UP 4
#define K_ENTER 5
#define K_SUB 7
#define K_DIV 9
#define K_CLEAR 0x0F
#define K_CHS 0x11
#define K_DOT 0x19
#define K_GRAPH 0x31
#define K_DEL 0x38

static unsigned char key(void)
{
    unsigned char k;
    do k = getcsc(); while (!k);
    return k;
}

static void putg(unsigned char c, unsigned char r, unsigned char ch, unsigned char inv)
{
    const unsigned char *g;
    unsigned char i, n, *p;
    if (ch < 32 || ch > 126) ch = 32;
    g = font + (unsigned)(ch - 32) * 5;
    p = GBUF + (unsigned)r * 72 + (c >> 1);
    for (i = 0; i < 6; i++) {
        n = i < 5 ? (unsigned char)(g[i] << 1) : 0;
        if (inv) n ^= 15;
        if (c & 1) *p = (*p & 0xF0) | n; else *p = (*p & 0x0F) | (unsigned char)(n << 4);
        p += 12;
    }
}

static void puts_(unsigned char c, unsigned char r, const char *s, unsigned char inv)
{
    while (*s && c < LW) putg(c++, r, *s++, inv);
}

static void clrrow(unsigned char r, unsigned char inv)
{
    unsigned char c;
    for (c = 0; c < LW; c++) putg(c, r, ' ', inv);
}

static void cls(void)
{
    unsigned char r;
    for (r = 0; r < 10; r++) clrrow(r, 0);
}

/* ------------------------------------------------------------------ numbers */
static unsigned char err;      /* 1 overflow, 2 divide by zero */

static I ck(L x)
{
    if (x != (I)x) { err = 1; return 0; }
    return (I)x;
}
static I mi(I a, I b) { return ck((L)a * b); }
static I ai(I a, I b) { return ck((L)a + b); }
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
static void qi(Q *r, I n) { r->n = n; r->d = 1; }
static void qadd(Q *r, const Q *a, const Q *b)
{
    I g = gcd(a->d, b->d);
    qn(r, ai(mi(a->n, b->d / g), mi(b->n, a->d / g)), mi(a->d / g, b->d));
}
static void qneg(Q *r, const Q *a) { r->n = -a->n; r->d = a->d; }
static void qsub(Q *r, const Q *a, const Q *b)
{
    Q t;
    qneg(&t, b);
    qadd(r, a, &t);
}
static void qmul(Q *r, const Q *a, const Q *b)
{
    I g1 = gcd(a->n, b->d), g2 = gcd(b->n, a->d);
    if (!g1) g1 = 1;
    if (!g2) g2 = 1;
    qn(r, mi(a->n / g1, b->n / g2), mi(a->d / g2, b->d / g1));
}
static void qdiv(Q *r, const Q *a, const Q *b)
{
    Q t;
    if (b->n == 0) { err = 2; qi(r, 0); return; }
    t.n = b->d; t.d = b->n;
    qmul(r, a, &t);
}
static void qsq(Q *r, const Q *a) { qmul(r, a, a); }

/* b^2 - 4ac as 32 bit */
static L disc(I A, I B, I C)
{
    L p = (L)A * C, q = (L)B * B, D;
    if (p > 0x1FFFFFFFL || p < -0x1FFFFFFFL) { err = 1; return 0; }
    D = q - 4 * p;
    if (p < 0 && D < q) err = 1;
    return D;
}

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

/* n = m*m*r with r square-free */
static void sqfree(L n, L *m, L *r)
{
    UL k, M = 1, R = 1, N = n, s;
    unsigned char c;
    for (k = 2; k * k * k <= (UL)n && N > 1; k++) {
        c = 0;
        while (N % k == 0) { N /= k; c++; }
        if (c & 1) R *= k;
        for (; c > 1; c -= 2) M *= k;
    }
    s = isqrt(N);
    if (s * s == N) M *= s; else R *= N;
    *m = M; *r = R;
}

/* sqrt of positive rational p/s = (m/s)*sqrt(r) */
static void sqrtq(const Q *q, Q *V, L *r)
{
    L m;
    sqfree((L)q->n * q->d, &m, r);
    qn(V, ck(m), q->d);
}

/* ------------------------------------------------------------------ output lines */
static unsigned char nlines, col;
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
static void pn(L n)
{
    char b[12];
    unsigned char i = 0;
    UL u;
    if (n < 0) { pc('-'); u = -n; } else u = n;
    do { b[i++] = '0' + (char)(u % 10); u /= 10; } while (u);
    while (i) pc(b[--i]);
}
static void pq(const Q *q)
{
    pn(q->n);
    if (q->d != 1) { pc('/'); pn(q->d); }
}
/* signed number with explicit + for positives */
static void psq(const Q *q)
{
    pc(q->n < 0 ? '-' : '+');
    pn(iabs(q->n));
    if (q->d != 1) { pc('/'); pn(q->d); }
}
static void ppt(const Q *x, const Q *y)
{
    pc('('); pq(x); pc(','); pq(y); pc(')');
}

/* ---- fixed point decimals */
/* print (neg? -:+) mag / 10^gi rounded to gi-1 decimals, trailing zeros trimmed */
static void pdr(UL mag, unsigned char neg, unsigned char gi)
{
    UL sc = 1, ip, fp;
    unsigned char i, n;
    char b[5];
    mag = (mag + 5) / 10;
    gi--;
    for (i = 0; i < gi; i++) sc *= 10;
    ip = mag / sc; fp = mag % sc;
    if (neg && mag) pc('-');
    pn(ip);
    if (fp) {
        for (i = 0; i < gi; i++) { sc /= 10; b[i] = '0' + (char)(fp / sc); fp %= sc; }
        n = gi;
        while (b[n - 1] == '0') n--;
        pc('.');
        for (i = 0; i < n; i++) pc(b[i]);
    }
}
static void pdq(const Q *q)           /* decimal of a rational */
{
    UL m = iabs(q->n);
    pdr(m * 100000UL / q->d, q->n < 0, 5);
}
/* round(sqrt(R) * 10^g) with 32 bit arithmetic only */
static UL rsqrt(UL R, unsigned char g)
{
    UL p = isqrt(R), rem = R - p * p, d;
    unsigned char i;
    for (i = 0; i < g; i++) {
        rem *= 100;
        for (d = 0; d < 9 && (20 * p + d + 1) * (d + 1) <= rem; d++) ;
        rem -= (20 * p + d) * d;
        p = p * 10 + d;
    }
    if (rem > p) p++;
    return p;
}
/* decimals of S: "x~a, b" or "x~a+-bi" ; silently skipped if a value would overflow */
static void pdec(const S *s, char var)
{
    UL R, Sv, Us, sc = 1;
    L Rl = (L)s->V.n * s->V.n, u, a, b;
    unsigned char gi, i, uneg = s->U.n < 0;
    if (s->im && s->r == 1 && s->U.d == 1 && s->V.d == 1) return;
    if (Rl > 0x7FFFFFFFL / s->r) return;
    R = (UL)Rl * s->r;
    gi = (R < 4000000UL && iabs(s->U.n) / s->U.d < 18000) ? 5 : R < 400000000UL ? 4 : 3;
    for (i = 0; i < gi; i++) sc *= 10;
    Sv = (rsqrt(R, gi) + s->V.d / 2) / s->V.d;
    Us = (UL)iabs(s->U.n) * sc / s->U.d;
    pc(var); pc('`');
    if (s->im) {
        if (s->U.n) pdr(Us, uneg, gi);
        pc('{'); pdr(Sv, 0, gi); pc('i');
    } else if (s->U.n == 0) { pc('{'); pdr(Sv, 0, gi); }
    else {
        u = uneg ? -(L)Us : (L)Us;
        a = u + (L)Sv; b = u - (L)Sv;
        pdr(a < 0 ? -a : a, a < 0, gi); ps(", "); pdr(b < 0 ? -b : b, b < 0, gi);
    }
    nl();
}

static void fail(const char *m)
{
    lreset();
    ps("ERROR:"); nl();
    ps(m); nl();
}

/* polynomial a v^2 + b v + c */
static void pterm(const Q *c, const char *v, unsigned char first)
{
    I n;
    if (c->n == 0) return;
    if (c->n < 0) pc('-'); else if (!first) pc('+');
    n = iabs(c->n);
    if (*v) {
        if (c->d == 1) { if (n != 1) pn(n); }
        else { pc('('); pn(n); pc('/'); pn(c->d); pc(')'); }
        ps(v);
    } else {
        pn(n);
        if (c->d != 1) { pc('/'); pn(c->d); }
    }
}
static void ppoly(const Q *a, const Q *b, const Q *c, char var)
{
    char v2[3], v1[2];
    unsigned char first = 1;
    v2[0] = var; v2[1] = '|'; v2[2] = 0;
    v1[0] = var; v1[1] = 0;
    pterm(a, v2, first); if (a->n) first = 0;
    pterm(b, v1, first); if (b->n) first = 0;
    pterm(c, "", first); if (c->n) first = 0;
    if (first) pc('0');
}
/* a(x-h)^2+k */
static void pvtx(const Q *a, const Q *h, const Q *k)
{
    if (a->d != 1) { if (a->n < 0) pc('-'); pc('('); pn(iabs(a->n)); pc('/'); pn(a->d); pc(')'); }
    else if (a->n == -1) pc('-');
    else if (a->n != 1) pn(a->n);
    if (h->n == 0) ps("x|");
    else {
        ps("(x"); pc(h->n < 0 ? '+' : '-'); pn(iabs(h->n));
        if (h->d != 1) { pc('/'); pn(h->d); }
        ps(")|");
    }
    if (k->n) { pc(k->n < 0 ? '-' : '+'); pn(iabs(k->n)); if (k->d != 1) { pc('/'); pn(k->d); } }
}

/* ------------------------------------------------------------------ algebra helpers */
static void toint(const Q *a, const Q *b, const Q *c, I *A, I *B, I *C, unsigned char red)
{
    I m = lcm(lcm(a->d, b->d), c->d), g;
    *A = mi(a->n, m / a->d);
    *B = mi(b->n, m / b->d);
    *C = mi(c->n, m / c->d);
    if (red) {
        g = gcd(gcd(*A, *B), *C);
        if (g > 1) { *A /= g; *B /= g; *C /= g; }
    }
}
static void qeval(Q *r, const Q *a, const Q *b, const Q *c, const Q *x)
{
    Q t;
    qmul(&t, a, x); qadd(&t, &t, b); qmul(&t, &t, x); qadd(r, &t, c);
}
/* vertex of ax^2+bx+c */
static void vertex(const Q *a, const Q *b, const Q *c, Q *h, Q *k)
{
    Q t;
    qdiv(h, b, a); t.n = -1; t.d = 2; qmul(h, h, &t);
    qeval(k, a, b, c, h);
}
/* factor ordering used throughout: larger denominator first, then larger |numerator| */
static unsigned char before(const Q *a, const Q *b)
{
    if (a->d != b->d) return a->d > b->d;
    return iabs(a->n) >= iabs(b->n);
}
static void pfac(const Q *r)
{
    if (r->d == 1 && r->n == 0) { pc('x'); return; }
    pc('(');
    if (r->d != 1) pn(r->d);
    pc('x'); pc(r->n < 0 ? '+' : '-'); pn(iabs(r->n)); pc(')');
}

static unsigned char canfac(I A, I B, I C)
{
    L D = disc(A, B, C), s;
    if (err || D < 0) return 0;
    s = isqrt(D);
    return s * s == D;
}
static void dofactor(I A, I B, I C)
{
    L D = disc(A, B, C), s = isqrt(D);
    I K;
    Q r1, r2, t;
    qn(&r1, ck(-B + s), mi(2, A));
    qn(&r2, ck(-B - s), mi(2, A));
    if (!before(&r1, &r2)) { t = r1; r1 = r2; r2 = t; }
    K = A / mi(r1.d, r2.d);
    if (K == -1) pc('-'); else if (K != 1) pn(K);
    pfac(&r1);
    if (D == 0) pc('|'); else pfac(&r2);
}

static void psurd(const S *s, unsigned char pm)
{
    I w, u, v;
    if (s->r == 1) {
        if (s->U.n) pq(&s->U);
        if (pm) pc('{');
        if (!(s->V.n == 1 && s->V.d == 1)) pq(&s->V);
        pc('i');
        return;
    }
    w = lcm(s->U.d, s->V.d);
    u = mi(s->U.n, w / s->U.d);
    v = mi(s->V.n, w / s->V.d);
    if (u) { if (w > 1) pc('('); pn(u); }
    if (pm) pc('{');
    if (!u && w > 1) pc('(');
    if (v != 1) pn(v);
    if (s->im) pc('i');
    pc('}'); pn(s->r);
    if (!u && w > 1) pc(')');
    if (u && w > 1) pc(')');
    if (w > 1) { pc('/'); pn(w); }
}
static void pdrat(const Q *a, const Q *b)
{
    pdq(a);
    if (b) { ps(", "); pdq(b); }
}
static void psols(const S *s, char var)
{
    Q r1, r2, t;
    pc(var); pc('=');
    if (!s->im && s->r == 1) {
        qadd(&r1, &s->U, &s->V);
        qsub(&r2, &s->U, &s->V);
        if (s->V.n == 0) pq(&r1);
        else if (s->U.n == 0) { pc('{'); pq(&s->V); }
        else {
            if (!before(&r1, &r2)) { t = r1; r1 = r2; r2 = t; }
            pq(&r1); ps(", "); pq(&r2);
        }
        nl();
        if (r1.d != 1 || r2.d != 1) {
            pc(var); pc('`'); pdrat(&r1, s->V.n ? &r2 : 0);
            nl();
        }
        return;
    }
    psurd(s, 1);
    nl();
    pdec(s, var);
}
/* solve integer quadratic A x^2 + B x + C = 0 */
static void solveint(I A, I B, I C, char var)
{
    S s;
    L D, m, r;
    if (A == 0) {
        if (B == 0) { ps(C ? "no solution" : "all real numbers"); nl(); return; }
        pc(var); pc('='); qn(&s.U, -C, B); pq(&s.U); nl();
        return;
    }
    D = disc(A, B, C);
    qn(&s.U, -B, mi(2, A));
    if (D == 0) { qi(&s.V, 0); s.r = 1; s.im = 0; }
    else {
        sqfree(D < 0 ? -D : D, &m, &r);
        qn(&s.V, ck(m), mi(2, iabs(A)));
        s.r = r; s.im = D < 0;
    }
    if (!err) psols(&s, var);
}

/* ------------------------------------------------------------------ form values */
static Q V[8];
static unsigned char have[8];

/* fetch a,b,c from V[0..2] for form 0 standard / 1 vertex / 2 factored */
static void getabc(unsigned char m, Q *a, Q *b, Q *c)
{
    Q t;
    *a = V[0];
    if (m == 0) { *b = V[1]; *c = V[2]; return; }
    if (m == 1) {                       /* a(x-h)^2+k */
        qmul(&t, &V[0], &V[1]); qadd(&t, &t, &t); qneg(b, &t);
        qsq(&t, &V[1]); qmul(&t, &t, &V[0]); qadd(c, &t, &V[2]);
    } else {                            /* a(x-p)(x-q) */
        qadd(&t, &V[1], &V[2]); qmul(&t, &t, &V[0]); qneg(b, &t);
        qmul(&t, &V[1], &V[2]); qmul(c, &t, &V[0]);
    }
}

/* ------------------------------------------------------------------ the tools */
static void t_vp(unsigned char m)       /* h k x y */
{
    Q dx, dy, a, t, b, c;
    (void)m;
    qsub(&dx, &V[2], &V[0]); qsub(&dy, &V[3], &V[1]);
    if (dx.n == 0) { fail(dy.n ? "x=h: NOT A FUNCTION" : "POINT IS THE VERTEX"); return; }
    qsq(&t, &dx); qdiv(&a, &dy, &t);
    if (a.n == 0) { fail("a=0: NOT A PARABOLA"); return; }
    ps("a=(y-k)/(x-h)|"); nl();
    ps("a="); pq(&dy); pc('/'); pq(&t); nl();
    ps("a="); pq(&a); nl();
    ps("y="); pvtx(&a, &V[0], &V[1]); nl();
    qmul(&t, &a, &V[0]); qadd(&t, &t, &t); qneg(&b, &t);
    qsq(&t, &V[0]); qmul(&t, &t, &a); qadd(&c, &t, &V[1]);
    ps("y="); ppoly(&a, &b, &c, 'x'); nl();
}

static void t_tr(unsigned char m)       /* right  up  reflect  stretch */
{
    Q a, b, c, t;
    (void)m;
    a = V[3];
    if (V[2].n) qneg(&a, &a);
    if (a.n == 0) { fail("STRETCH CANNOT BE 0"); return; }
    ps("f(x)=x| shifted:"); nl();
    ps("vertex form"); nl();
    ps("y="); pvtx(&a, &V[0], &V[1]); nl();
    qmul(&t, &a, &V[0]); qadd(&t, &t, &t); qneg(&b, &t);
    qsq(&t, &V[0]); qmul(&t, &t, &a); qadd(&c, &t, &V[1]);
    ps("standard form"); nl();
    ps("y="); ppoly(&a, &b, &c, 'x'); nl();
    ps("vertex "); ppt(&V[0], &V[1]); nl();
    ps(a.n > 0 ? "opens up" : "opens down"); nl();
}

static void t_fac(unsigned char m)      /* left a b c, right a b c */
{
    Q A, B, C, qa, qb, qc;
    I a, b, c;
    (void)m;
    qsub(&A, &V[0], &V[3]); qsub(&B, &V[1], &V[4]); qsub(&C, &V[2], &V[5]);
    if (A.n == 0 && B.n == 0) { fail("NO x| OR x TERM LEFT"); return; }
    toint(&A, &B, &C, &a, &b, &c, 1);
    if (a < 0 || (a == 0 && b < 0)) { a = -a; b = -b; c = -c; }
    qi(&qa, a); qi(&qb, b); qi(&qc, c);
    ppoly(&qa, &qb, &qc, 'x'); ps("=0"); nl();
    if (a == 0) { solveint(a, b, c, 'x'); return; }
    if (canfac(a, b, c)) { dofactor(a, b, c); ps("=0"); nl(); }
    else { ps("not factorable over Q"); nl(); ps("use quad formula:"); nl(); }
    solveint(a, b, c, 'x');
}

static void t_sq(unsigned char m)       /* a  h  c  : a(x-h)^2 = c */
{
    Q q, t;
    S s;
    (void)m;
    if (V[0].n == 0) { fail("a CANNOT BE 0"); return; }
    if (V[0].n != 1 || V[0].d != 1) pq(&V[0]);
    if (V[1].n == 0) ps("x|=");
    else {
        ps("(x"); pc(V[1].n < 0 ? '+' : '-'); pn(iabs(V[1].n)); if (V[1].d != 1) { pc('/'); pn(V[1].d); }
        ps(")|=");
    }
    pq(&V[2]); nl();
    qdiv(&q, &V[2], &V[0]);
    ps(V[1].n ? "(x-h)|=" : "x|="); pq(&q); nl();
    if (q.n == 0) { ps("x="); pq(&V[1]); nl(); return; }
    t = q; if (t.n < 0) t.n = -t.n;
    sqrtq(&t, &s.V, &s.r);
    s.U = V[1]; s.im = q.n < 0;
    if (err) return;
    psols(&s, 'x');
}

static void t_vf(unsigned char m)       /* a b c -> vertex form */
{
    Q h, k;
    (void)m;
    if (V[0].n == 0) { fail("a CANNOT BE 0"); return; }
    vertex(&V[0], &V[1], &V[2], &h, &k);
    ps("h=-b/(2a)="); pq(&h); nl();
    ps("k=f(h)="); pq(&k); nl();
    ps("y="); pvtx(&V[0], &h, &k); nl();
    ps("vertex "); ppt(&h, &k); nl();
}

static void t_qf(unsigned char m)       /* a b c */
{
    I a, b, c;
    L D, mm, r;
    (void)m;
    toint(&V[0], &V[1], &V[2], &a, &b, &c, 1);
    if (a == 0) { fail("a CANNOT BE 0"); return; }
    ps("a="); pn(a); ps(" b="); pn(b); ps(" c="); pn(c); nl();
    D = disc(a, b, c);
    ps("D=b|-4ac="); pn(D); nl();
    if (D) {
        sqfree(D < 0 ? -D : D, &mm, &r);
        if (D < 0 || mm != 1 || r == 1) {
            pc('}'); pn(D); pc('=');
            if (mm != 1 || (r == 1 && D > 0)) pn(mm);
            if (D < 0) pc('i');
            if (r > 1) { pc('}'); pn(r); }
            nl();
        }
    }
    ps("x=(-b{}D)/(2a)"); nl();
    solveint(a, b, c, 'x');
}

static void t_feat(unsigned char m)     /* a b c [x0 y0] */
{
    Q a, b, c, h, k, x1, y0;
    getabc(m, &a, &b, &c);
    if (a.n == 0) { fail("a CANNOT BE 0"); return; }
    ps("y="); ppoly(&a, &b, &c, 'x'); nl();
    vertex(&a, &b, &c, &h, &k);
    ps("vertex "); ppt(&h, &k); nl();
    ps("axis x="); pq(&h); nl();
    qi(&x1, 0);
    ps("y-int "); ppt(&x1, &c); nl();
    ps(a.n > 0 ? "opens up (min)" : "opens down (max)"); nl();
    if (have[3]) {
        if (have[4]) y0 = V[4]; else qeval(&y0, &a, &b, &c, &V[3]);
        qadd(&x1, &h, &h); qsub(&x1, &x1, &V[3]);
        ps("point "); ppt(&V[3], &y0); nl();
        ps("mirror "); ppt(&x1, &y0); nl();
    }
}

static void t_fq(unsigned char m)       /* a b c */
{
    I a, b, c;
    Q qa, qb, qc;
    (void)m;
    toint(&V[0], &V[1], &V[2], &a, &b, &c, 0);
    if (a == 0) { fail("a CANNOT BE 0"); return; }
    qi(&qa, a); qi(&qb, b); qi(&qc, c);
    ppoly(&qa, &qb, &qc, 'x'); nl();
    if (canfac(a, b, c)) { ps("="); dofactor(a, b, c); nl(); }
    else { ps("prime over rationals"); nl(); ps("roots by formula:"); nl(); solveint(a, b, c, 'x'); }
}

static void t_zero(unsigned char m)     /* form 0/1/2 : a b c */
{
    Q a, b, c;
    I A, B, C;
    getabc(m, &a, &b, &c);
    if (a.n == 0) { fail("a CANNOT BE 0"); return; }
    ps("y="); ppoly(&a, &b, &c, 'x'); nl();
    if (m == 2) {                        /* factored form: zeros are p and q as typed */
        ps("zeros: x="); pq(&V[1]);
        if (V[1].n != V[2].n || V[1].d != V[2].d) { ps(", "); pq(&V[2]); }
        nl();
        if (V[1].d != 1 || V[2].d != 1) { ps("x`"); pdrat(&V[1], &V[2]); nl(); }
        return;
    }
    toint(&a, &b, &c, &A, &B, &C, 1);
    solveint(A, B, C, 'x');
}

static void pz(const Q *re, const Q *im)
{
    Q t;
    if (im->n == 0) { pq(re); return; }
    if (re->n) pq(re);
    if (im->n < 0) pc('-'); else if (re->n) pc('+');
    t = *im; if (t.n < 0) t.n = -t.n;
    if (!(t.n == 1 && t.d == 1)) pq(&t);
    pc('i');
}

static void t_cx(unsigned char m)       /* 0 add 1 sub 2 mul 3 div 4 conj 5 i^n 6 sqrt */
{
    Q a, b, c, d, r, i, t, u, den;
    S s;
    I k;
    a = V[0]; b = V[1]; c = V[2]; d = V[3];
    if (m == 4) {
        qneg(&i, &b);
        ps("conj("); pz(&a, &b); ps(")"); nl();
        ps("="); pz(&a, &i); nl();
        return;
    }
    if (m == 5) {
        if (a.d != 1) { fail("n MUST BE AN INTEGER"); return; }
        k = ((a.n % 4) + 4) % 4;
        ps("i^"); pn(a.n); ps("="); ps(k == 0 ? "1" : k == 1 ? "i" : k == 2 ? "-1" : "-i"); nl();
        ps("(n mod 4 = "); pn(k); ps(")"); nl();
        return;
    }
    if (m == 6) {
        if (a.n == 0) { ps("}0=0"); nl(); return; }
        t = a; if (t.n < 0) t.n = -t.n;
        sqrtq(&t, &s.V, &s.r);
        qi(&s.U, 0); s.im = a.n < 0;
        ps("}("); pq(&a); ps(")=");
        if (s.r == 1 && !s.im) pq(&s.V); else psurd(&s, 0);
        nl();
        return;
    }
    pc('('); pz(&a, &b); pc(')');
    pc(m == 0 ? '+' : m == 1 ? '-' : m == 2 ? '*' : '/');
    pc('('); pz(&c, &d); pc(')'); nl();
    if (m == 0) { qadd(&r, &a, &c); qadd(&i, &b, &d); }
    else if (m == 1) { qsub(&r, &a, &c); qsub(&i, &b, &d); }
    else if (m == 2) {
        qmul(&t, &a, &c); qmul(&u, &b, &d); qsub(&r, &t, &u);
        qmul(&t, &a, &d); qmul(&u, &b, &c); qadd(&i, &t, &u);
    } else {
        qsq(&t, &c); qsq(&u, &d); qadd(&den, &t, &u);
        if (den.n == 0) { fail("DIVIDE BY ZERO"); return; }
        qmul(&t, &a, &c); qmul(&u, &b, &d); qadd(&r, &t, &u); qdiv(&r, &r, &den);
        qmul(&t, &b, &c); qmul(&u, &a, &d); qsub(&i, &t, &u); qdiv(&i, &i, &den);
    }
    ps("="); pz(&r, &i); nl();
}

static void t_disc(unsigned char m)     /* a b c */
{
    Q D, t, u;
    (void)m;
    if (V[0].n == 0) { fail("a CANNOT BE 0"); return; }
    qsq(&t, &V[1]); qmul(&u, &V[0], &V[2]); qadd(&u, &u, &u); qadd(&u, &u, &u);
    qsub(&D, &t, &u);
    ps("D=b|-4ac"); nl();
    ps("D="); pq(&D); nl();
    if (D.n > 0) { ps("D>0: two real"); nl(); ps("solutions"); }
    else if (D.n == 0) { ps("D=0: one real"); nl(); ps("solution"); }
    else { ps("D<0: two non-real"); nl(); ps("complex solutions"); }
    nl();
}

static void t_b(unsigned char m)        /* a c : a x^2 + b x + c */
{
    Q k, t;
    S s;
    (void)m;
    if (V[0].n == 0) { fail("a CANNOT BE 0"); return; }
    qmul(&k, &V[0], &V[1]); qadd(&k, &k, &k); qadd(&k, &k, &k); qneg(&k, &k);   /* -4ac */
    ps("one real sol: D=0"); nl();
    ps("b|-4ac=0"); nl();
    ps("b|"); if (k.n) psq(&k); ps("=0"); nl();
    if (k.n == 0) { ps("b=0"); nl(); return; }
    t = k; if (t.n < 0) t.n = -t.n;
    sqrtq(&t, &s.V, &s.r);
    qi(&s.U, 0);
    if (err) return;
    if (k.n > 0) {
        ps("no real value of b"); nl();
        ps("if complex b ok:"); nl();
        s.im = 1; psols(&s, 'b');
    } else {
        ps("two real b:"); nl();
        s.im = 0; psols(&s, 'b');
    }
}

static void t_proj(unsigned char m)     /* a b c : h(t) */
{
    Q h, k;
    (void)m;
    if (V[0].n >= 0) { fail("a MUST BE NEGATIVE"); return; }
    ps("h(t)="); ppoly(&V[0], &V[1], &V[2], 't'); nl();
    vertex(&V[0], &V[1], &V[2], &h, &k);
    ps("t=-b/(2a)="); pq(&h); nl();
    ps("max at t="); pq(&h); nl();
    ps("max height="); pq(&k); ps(" ft"); nl();
    if (h.d != 1 || k.d != 1) { ps("`"); pdrat(&h, &k); nl(); }
}

/* ------------------------------------------------------------------ tool table */
typedef struct {
    const char *title;
    unsigned char nf, opt;
    const char *const *lab;
    const char *const *def;
    void (*fn)(unsigned char);
    unsigned char mode;
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

#define OPT34 0x18
static const Tool T[] = {
    /* 0  */ { "VERTEX+POINT>PARABOLA", 4, 0, lbl_vp, 0, t_vp, 0 },
    /* 1  */ { "TRANSFORMATIONS", 4, 0, lbl_tr, def_tr, t_tr, 0 },
    /* 2  */ { "SOLVE BY FACTORING", 6, 0, lbl_fac, 0, t_fac, 0 },
    /* 3  */ { "SOLVE BY SQUARE ROOTS", 3, 0, lbl_sq, def_sq, t_sq, 0 },
    /* 4  */ { "STANDARD>VERTEX FORM", 3, 0, lbl_abc, 0, t_vf, 0 },
    /* 5  */ { "QUADRATIC FORMULA", 3, 0, lbl_abc, 0, t_qf, 0 },
    /* 6  */ { "FEATURES: STANDARD", 5, OPT34, lbl_abcp, 0, t_feat, 0 },
    /* 7  */ { "FEATURES: VERTEX", 5, OPT34, lbl_vf, 0, t_feat, 1 },
    /* 8  */ { "FEATURES: FACTORED", 5, OPT34, lbl_ff, 0, t_feat, 2 },
    /* 9  */ { "FACTOR QUADRATIC", 3, 0, lbl_abc, 0, t_fq, 0 },
    /* 10 */ { "ZEROS: STANDARD", 3, 0, lbl_abc, 0, t_zero, 0 },
    /* 11 */ { "ZEROS: VERTEX", 3, 0, lbl_vf, 0, t_zero, 1 },
    /* 12 */ { "ZEROS: FACTORED", 3, 0, lbl_zf, 0, t_zero, 2 },
    /* 13 */ { "COMPLEX: z1 + z2", 4, 0, lbl_z2, 0, t_cx, 0 },
    /* 14 */ { "COMPLEX: z1 - z2", 4, 0, lbl_z2, 0, t_cx, 1 },
    /* 15 */ { "COMPLEX: z1 * z2", 4, 0, lbl_z2, 0, t_cx, 2 },
    /* 16 */ { "COMPLEX: z1 / z2", 4, 0, lbl_z2, 0, t_cx, 3 },
    /* 17 */ { "COMPLEX: CONJUGATE", 2, 0, lbl_z2, 0, t_cx, 4 },
    /* 18 */ { "COMPLEX: i^n", 1, 0, lbl_n, def_one, t_cx, 5 },
    /* 19 */ { "COMPLEX: SQRT", 1, 0, lbl_rad, 0, t_cx, 6 },
    /* 20 */ { "DISCRIMINANT", 3, 0, lbl_abc, 0, t_disc, 0 },
    /* 21 */ { "FIND b: ONE SOLUTION", 2, 0, lbl_ac, 0, t_b, 0 },
    /* 22 */ { "PROJECTILE MAX", 3, 0, lbl_pj, 0, t_proj, 0 },
};

/* ------------------------------------------------------------------ UI */
static char fb[8][13];
static unsigned char fresh[8];

static unsigned char strlen_(const char *s)
{
    unsigned char n = 0;
    while (*s++) n++;
    return n;
}

static signed char digit(unsigned char k)
{
    switch (k) {
    case 0x21: return 0; case 0x22: return 1; case 0x1A: return 2; case 0x12: return 3;
    case 0x23: return 4; case 0x1B: return 5; case 0x13: return 6; case 0x24: return 7;
    case 0x1C: return 8; case 0x14: return 9;
    }
    return -1;
}

/* parse "[-]digits[.digits][/digits]" ; returns 0 ok */
static unsigned char parse(const char *s, Q *q)
{
    L n = 0, d = 1, den = 0;
    unsigned char neg = 0, dot = 0, slash = 0, dg = 0;
    if (*s == '-') { neg = 1; s++; }
    for (; *s; s++) {
        if (*s == '.') { if (dot || slash) return 1; dot = 1; }
        else if (*s == '/') { if (slash || !dg) return 1; slash = 1; dg = 0; den = 0; }
        else {
            dg = 1;
            if (slash) den = den * 10 + (*s - '0');
            else { n = n * 10 + (*s - '0'); if (dot) d *= 10; }
            if (n > 32767 || d > 32767 || den > 32767) { err = 1; return 1; }
        }
    }
    if (!dg) { if (neg || slash || dot) return 1; qi(q, 0); return 0; }
    if (slash) {
        if (den == 0) { err = 2; return 1; }
        d *= den;
        if (d > 32767) { err = 1; return 1; }
    }
    qn(q, neg ? -n : n, d);
    return 0;
}

static void title(const char *t)
{
    clrrow(0, 1);
    puts_(0, 0, t, 1);
}

static unsigned char menu(const char *ttl, const char *const *items, unsigned char n)
{
    unsigned char sel = 0, top = 0, i, k, c, r, inv;
    signed char dg;
    for (;;) {
        cls();
        title(ttl);
        if (top) putg(23, 0, '^', 1);
        if (top + 9 < n) putg(23, 0, 'v', 1);
        for (i = 0; i < 9 && top + i < n; i++) {
            r = top + i; inv = (r == sel);
            clrrow(i + 1, inv);
            c = 0;
            if (r >= 9) putg(c++, i + 1, '0' + (r + 1) / 10, inv);
            putg(c++, i + 1, '0' + (r + 1) % 10, inv);
            putg(c++, i + 1, ':', inv);
            puts_(c, i + 1, items[r], inv);
        }
        present();
        k = key();
        dg = digit(k);
        if (k == K_UP) { if (sel) sel--; else sel = n - 1; }
        else if (k == K_DOWN) { if (sel + 1 < n) sel++; else sel = 0; }
        else if (k == K_ENTER) return sel;
        else if (k == K_CLEAR) return 255;
        else if (dg >= 1 && dg <= (signed char)n) return dg - 1;
        if (sel < top) top = sel;
        if (sel >= top + 9) top = sel - 8;
    }
}

static unsigned char viewer(void)       /* 1 = back to form, 0 = menu */
{
    unsigned char top = 0, i, k;
    for (;;) {
        cls();
        for (i = 0; i < 9 && top + i < nlines; i++) puts_(0, i, LINE(top + i), 0);
        clrrow(9, 1);
        puts_(0, 9, "ENTER:edit CLEAR:menu", 1);
        if (top) putg(23, 9, '^', 1);
        if (top + 9 < nlines) putg(22, 9, 'v', 1);
        present();
        k = key();
        if (k == K_UP && top) top--;
        else if (k == K_DOWN && top + 9 < nlines) top++;
        else if (k == K_ENTER) return 1;
        else if (k == K_CLEAR) return 0;
    }
}

static void notice(const char *m)
{
    clrrow(9, 1);
    puts_(0, 9, m, 1);
    present();
    key();
}

static void run(unsigned char ti)
{
    const Tool *t = &T[ti];
    unsigned char f = 0, i, k, len, bad, j;
    signed char dg;
    char *b;
    const char *d;
    for (i = 0; i < 8; i++) { fb[i][0] = 0; fresh[i] = 1; }
    for (i = 0; i < t->nf; i++) {
        d = t->def ? t->def[i] : ((t->opt >> i) & 1) ? "" : "0";
        for (len = 0; d[len]; len++) fb[i][len] = d[len];
        fb[i][len] = 0;
    }
    for (;;) {
        cls();
        title(t->title);
        for (i = 0; i < t->nf; i++) {
            puts_(0, i + 1, t->lab[i], i == f);
            puts_(12, i + 1, fb[i], 0);
            if (i == f) putg(12 + strlen_(fb[i]), i + 1, '_', 0);
        }
        puts_(0, 9, "ENTER:next GRAPH:solve", 0);
        present();
        k = key();
        b = fb[f];
        len = strlen_(b);
        dg = digit(k);
        if (k == K_CLEAR) {
            if (len) { b[0] = 0; fresh[f] = 0; } else return;
        } else if (k == K_UP) { if (f) f--; }
        else if (k == K_DOWN) { if (f + 1 < t->nf) f++; }
        else if (k == K_DEL) { if (len) b[len - 1] = 0; fresh[f] = 0; }
        else if (dg >= 0 || k == K_DOT || k == K_DIV || k == K_CHS || k == K_SUB) {
            if (fresh[f] && (dg >= 0 || k == K_DOT || k == K_DIV)) { b[0] = 0; len = 0; }
            fresh[f] = 0;
            if (dg >= 0 || k == K_DOT || k == K_DIV) {
                if (len < 11) {
                    b[len] = dg >= 0 ? '0' + dg : k == K_DOT ? '.' : '/';
                    b[len + 1] = 0;
                }
            } else {                                      /* toggle leading minus */
                if (b[0] == '-') { for (j = 0; b[j]; j++) b[j] = b[j + 1]; }
                else if (len < 11) { for (j = len + 1; j; j--) b[j] = b[j - 1]; b[0] = '-'; }
            }
        } else if (k == K_ENTER && f + 1 < t->nf) f++;
        else if (k == K_GRAPH || k == K_ENTER) {
            bad = 0;
            err = 0;
            for (i = 0; i < t->nf; i++) {
                have[i] = fb[i][0] != 0;
                if (!have[i]) { qi(&V[i], 0); continue; }
                if (parse(fb[i], &V[i])) { bad = 1; f = i; break; }
            }
            if (bad) {
                notice(err == 2 ? "DIVIDE BY ZERO" : err ? "NUMBER TOO LARGE" : "BAD NUMBER");
                err = 0;
                continue;
            }
            lreset();
            t->fn(t->mode);
            if (err) {
                lreset();
                ps("ERROR:"); nl();
                ps(err == 2 ? "DIVIDE BY ZERO" : "NUMBER TOO LARGE"); nl();
                err = 0;
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

void app_main(void)
{
    unsigned char s, f;
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

#ifdef __SDCC
void main(void) { app_main(); }
#endif
