;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module diag
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _app_main
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_err:
	.ds 1
_R:
	.ds 64
_sr:
	.ds 4
_sim:
	.ds 1
_nlines:
	.ds 1
_col:
	.ds 1
_cur:
	.ds 2
_gu:
	.ds 2
_gv:
	.ds 2
_gw:
	.ds 2
_ua:
	.ds 4
_us:
	.ds 4
_uan:
	.ds 1
_usn:
	.ds 1
_ia:
	.ds 2
_ib:
	.ds 2
_ic:
	.ds 2
_have:
	.ds 8
_fb:
	.ds 104
_fresh:
	.ds 8
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;qsolve.c:102: static void present(void) __naked
;	---------------------------------
; Function present
; ---------------------------------
_present:
;qsolve.c:111: __endasm;
	push	ix
	ld	iy,#0x89F0
	call	#0x4092
	ld	iy,#0x89F0
	pop	ix
	ret
;qsolve.c:112: }
;qsolve.c:114: static U8 getcsc(void) __naked
;	---------------------------------
; Function getcsc
; ---------------------------------
_getcsc:
;qsolve.c:126: __endasm;
	push	ix
	ei
	halt
	ld	iy,#0x89F0
	rst	#0x28
	.dw	#0x4018
	pop	ix
	ld	l,a
	ret
;qsolve.c:127: }
;qsolve.c:150: static U8 key(void)
;	---------------------------------
; Function key
; ---------------------------------
_key:
;qsolve.c:153: do k = getcsc(); while (!k);
00101$:
	call	_getcsc
;qsolve.c:154: return k;
	or	a,a
	jr	Z, 00101$
;qsolve.c:155: }
	ret
_font:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x04	; 4
;qsolve.c:157: static void putg(U8 c, U8 r, U8 ch, U8 inv)
;	---------------------------------
; Function putg
; ---------------------------------
_putg:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	c, a
	ld	b, l
;qsolve.c:161: if (ch < 32 || ch > 126) ch = 32;
	ld	a, 4 (ix)
	sub	a, #0x20
	jr	C, 00101$
	ld	a, #0x7e
	sub	a, 4 (ix)
	jr	NC, 00102$
00101$:
	ld	4 (ix), #0x20
00102$:
;qsolve.c:162: g = font + (unsigned)(ch - 32) * 5;
	ld	a, 4 (ix)
	ld	d, #0x00
	add	a, #0xe0
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_font
	add	hl, de
	ex	(sp), hl
;qsolve.c:163: p = GBUF + (unsigned)r * 72 + (c >> 1);
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #0x9340
	add	hl, de
	ld	a, c
	srl	a
	add	a, l
	ld	-3 (ix), a
	ld	a, #0x00
	adc	a, h
	ld	-2 (ix), a
;qsolve.c:164: for (i = 0; i < 6; i++) {
	ld	a, c
	and	a, #0x01
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	-1 (ix), #0x00
00110$:
;qsolve.c:165: n = i < 5 ? (U8)(g[i] << 1) : 0;
	ld	a, -1 (ix)
	sub	a, #0x05
	jr	NC, 00114$
	ld	a, -9 (ix)
	add	a, -1 (ix)
	ld	c, a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	add	a, a
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	jr	00115$
00114$:
	xor	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
00115$:
	ld	c, -5 (ix)
;qsolve.c:166: if (inv) n ^= 15;
	ld	a, 5 (ix)
	or	a, a
	jr	Z, 00105$
	ld	a, c
	xor	a, #0x0f
	ld	c, a
00105$:
;qsolve.c:167: if (c & 1) *p = (*p & 0xF0) | n; else *p = (*p & 0x0F) | (U8)(n << 4);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	b, (hl)
	ld	a, -6 (ix)
	or	a, -7 (ix)
	jr	Z, 00107$
	ld	a, b
	and	a, #0xf0
	or	a, c
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), a
	jr	00108$
00107$:
	ld	a, b
	and	a, #0x0f
	ld	e, a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, e
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), a
00108$:
;qsolve.c:168: p += 12;
	ld	a, -3 (ix)
	add	a, #0x0c
	ld	-3 (ix), a
	jr	NC, 00142$
	inc	-2 (ix)
00142$:
;qsolve.c:164: for (i = 0; i < 6; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x06
	jr	C, 00110$
;qsolve.c:170: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;qsolve.c:172: static void puts_(U8 c, U8 r, const char *s, U8 inv)
;	---------------------------------
; Function puts_
; ---------------------------------
_puts_:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
	ld	b, l
;qsolve.c:174: while (*s && c < LW) putg(c++, r, *s++, inv);
	ld	e, 4 (ix)
	ld	d, 5 (ix)
00102$:
	ld	a, (de)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	or	a, a
	jr	Z, 00105$
	ld	a, c
	sub	a, #0x18
	jr	NC, 00105$
	ld	a, l
	inc	de
	ld	-1 (ix), c
	inc	c
	push	bc
	push	de
	ld	h, 6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_putg
	pop	de
	pop	bc
	jr	00102$
00105$:
;qsolve.c:175: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;qsolve.c:177: static void clrrow(U8 r, U8 inv)
;	---------------------------------
; Function clrrow
; ---------------------------------
_clrrow:
	ld	c, a
	ld	b, l
;qsolve.c:180: for (c = 0; c < LW; c++) putg(c, r, ' ', inv);
	ld	e, #0x00
00102$:
	push	bc
	push	de
	push	bc
	inc	sp
	ld	a, #0x20
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_putg
	pop	de
	pop	bc
	inc	e
	ld	a, e
	sub	a, #0x18
	jr	C, 00102$
;qsolve.c:181: }
	ret
;qsolve.c:183: static void cls(void)
;	---------------------------------
; Function cls
; ---------------------------------
_cls:
;qsolve.c:186: for (r = 0; r < 10; r++) clrrow(r, 0);
	ld	c, #0x00
00102$:
	push	bc
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_clrrow
	pop	bc
	inc	c
	ld	a, c
	sub	a, #0x0a
	jr	C, 00102$
;qsolve.c:187: }
	ret
;qsolve.c:192: static I ck(L x)
;	---------------------------------
; Function ck
; ---------------------------------
_ck:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ex	de, hl
;qsolve.c:194: if (x != (I)x) { err = 1; return 0; }
	ld	c, l
	ld	b, h
	ld	-4 (ix), c
	ld	a, b
	ld	-3 (ix), a
	rlca
	sbc	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	a, l
	sub	a, -4 (ix)
	jr	NZ, 00110$
	ld	a, h
	sub	a, -3 (ix)
	jr	NZ, 00110$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	cp	a, a
	sbc	hl, de
	jr	Z, 00102$
00110$:
	ld	hl, #_err
	ld	(hl), #0x01
	ld	de, #0x0000
	jr	00103$
00102$:
;qsolve.c:195: return (I)x;
	ld	e, c
	ld	d, b
00103$:
;qsolve.c:196: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:197: static I mi(I a, I b) { return ck((L)a * b); }
;	---------------------------------
; Function mi
; ---------------------------------
_mi:
	call	___mulsint2slong
	jp	_ck
;qsolve.c:198: static I iabs(I a) { return a < 0 ? -a : a; }
;	---------------------------------
; Function iabs
; ---------------------------------
_iabs:
	bit	7, h
	jr	Z, 00103$
	xor	a, a
	sub	a, l
	ld	e, a
	sbc	a, a
	sub	a, h
	ld	d, a
	ret
00103$:
	ex	de, hl
	ret
;qsolve.c:199: static I gcd(I a, I b)
;	---------------------------------
; Function gcd
; ---------------------------------
_gcd:
;qsolve.c:202: a = iabs(a); b = iabs(b);
	push	de
	call	_iabs
	ex	de, hl
	pop	de
	ex	de, hl
	push	de
	call	_iabs
	ld	c, e
	ld	b, d
	pop	hl
;qsolve.c:203: while (b) { t = a % b; a = b; b = t; }
00101$:
	ld	a, b
	or	a, c
	jr	Z, 00103$
	push	bc
	ld	e, c
	ld	d, b
	call	__modsint
;	spillPairReg hl
;	spillPairReg hl
	pop	hl
;	spillPairReg hl
;	spillPairReg hl
	ld	c, e
	ld	b, d
	jr	00101$
00103$:
;qsolve.c:204: return a;
	ex	de, hl
;qsolve.c:205: }
	ret
;qsolve.c:206: static I lcm(I a, I b) { return mi(a / gcd(a, b), b); }
;	---------------------------------
; Function lcm
; ---------------------------------
_lcm:
	ld	c, e
	ld	b, d
	push	hl
	push	bc
	ld	e, c
	ld	d, b
	call	_gcd
	pop	bc
	pop	hl
	push	bc
	call	__divsint
	ex	de, hl
	pop	bc
	ld	e, c
	ld	d, b
	jp	_mi
;qsolve.c:208: static void qn(Q *r, I n, I d)
;	---------------------------------
; Function qn
; ---------------------------------
_qn:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	c, e
	ld	b, d
;qsolve.c:211: if (d == 0) { err = 2; r->n = 0; r->d = 1; return; }
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, 5 (ix)
	or	a, 4 (ix)
	jr	NZ, 00102$
	ld	hl, #_err
	ld	(hl), #0x02
	pop	bc
	pop	hl
	push	hl
	push	bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	pop	hl
	push	hl
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	jr	00107$
00102$:
;qsolve.c:212: if (d < 0) { n = -n; d = -d; }
	bit	7, 5 (ix)
	jr	Z, 00104$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	xor	a, a
	sub	a, 4 (ix)
	ld	4 (ix), a
	sbc	a, a
	sub	a, 5 (ix)
	ld	5 (ix), a
00104$:
;qsolve.c:213: g = gcd(n, d);
	push	bc
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_gcd
	pop	bc
	ex	de, hl
;qsolve.c:214: if (g > 1) { n /= g; d /= g; }
	ld	a, #0x01
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00106$
	ex	de, hl
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	c, e
	ld	b, d
	pop	hl
	push	bc
	ex	de, hl
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	pop	bc
	ld	4 (ix), e
	ld	5 (ix), d
00106$:
;qsolve.c:215: r->n = n; r->d = d;
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	hl
	push	hl
	ld	a, 4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
00107$:
;qsolve.c:216: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;qsolve.c:231: static void qop(unsigned x)
;	---------------------------------
; Function qop
; ---------------------------------
_qop:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
	ld	-6 (ix), l
;qsolve.c:233: Q *r = &R[(x >> 8) & 15], *a = &R[(x >> 4) & 15], *b = &R[x & 15];
	ld	-5 (ix), h
	ld	a, h
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_R
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	ld	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	b, #0x04
00151$:
	srl	-3 (ix)
	rr	-4 (ix)
	djnz	00151$
	ld	a, -4 (ix)
	and	a, #0x0f
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	b, #0x02
00152$:
	sla	-4 (ix)
	rl	-3 (ix)
	djnz	00152$
	ld	a, -4 (ix)
	add	a, #<(_R)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #>(_R)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	and	a, #0x0f
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
	ld	b, #0x02
00153$:
	sla	-8 (ix)
	rl	-7 (ix)
	djnz	00153$
	ld	a, -8 (ix)
	add	a, #<(_R)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	adc	a, #>(_R)
	ld	-1 (ix), a
;qsolve.c:234: I g, g2, an = a->n, ad = a->d, bn = b->n, bd = b->d;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;qsolve.c:235: switch (x >> 12) {
	ld	a, -5 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	a, #0x06
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	C, 00119$
;qsolve.c:242: if (bn == 0) { err = 2; r->n = 0; r->d = 1; return; }
	ld	c, -12 (ix)
	ld	b, -11 (ix)
	inc	bc
	inc	bc
;qsolve.c:235: switch (x >> 12) {
	push	de
	ld	d, #0x00
	ld	hl, #00154$
	add	hl, de
	add	hl, de
	add	hl, de
	pop	de
	jp	(hl)
00154$:
	jp	00102$
	jp	00102$
	jp	00110$
	jp	00105$
	jp	00115$
	jp	00116$
	jp	00117$
;qsolve.c:236: case 0: case 1:
00102$:
;qsolve.c:237: if (x >> 12) bn = -bn;
	ld	a, d
	or	a, e
	jr	Z, 00104$
	xor	a, a
	sub	a, -4 (ix)
	ld	-4 (ix), a
	sbc	a, a
	sub	a, -3 (ix)
	ld	-3 (ix), a
00104$:
;qsolve.c:238: g = gcd(ad, bd);
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_gcd
	ld	c, e
	ld	b, d
;qsolve.c:239: qn(r, ck((L)mi(an, bd / g) + mi(bn, ad / g)), mi(ad / g, bd));
	push	bc
	ld	e, c
	ld	d, b
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ex	de, hl
	pop	bc
	push	hl
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	call	_mi
	ld	-8 (ix), e
	ld	-7 (ix), d
	pop	de
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	pop	hl
	ld	-16 (ix), e
	ld	a, d
	ld	-15 (ix), a
	rlca
	sbc	a, a
	ld	-14 (ix), a
	ld	-13 (ix), a
	ex	de, hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ld	a, d
	rlca
	sbc	hl, hl
	ld	a, -16 (ix)
	add	a, e
	ld	e, a
	ld	a, -15 (ix)
	adc	a, d
	ld	d, a
	ld	a, -14 (ix)
	adc	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -13 (ix)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	call	_ck
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_qn
;qsolve.c:240: break;
	jp	00119$
;qsolve.c:241: case 3:
00105$:
;qsolve.c:242: if (bn == 0) { err = 2; r->n = 0; r->d = 1; return; }
	ld	a, -3 (ix)
	or	a, -4 (ix)
	jr	NZ, 00107$
	ld	hl, #_err
	ld	(hl), #0x02
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a, #0x01
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	jp	00119$
00107$:
;qsolve.c:243: g = bd; bd = bn; bn = g;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	ld	-4 (ix), c
	ld	-3 (ix), b
;qsolve.c:244: if (bd < 0) { bd = -bd; bn = -bn; }
	bit	7, -1 (ix)
	jr	Z, 00110$
	xor	a, a
	sub	a, -2 (ix)
	ld	-2 (ix), a
	sbc	a, a
	sub	a, -1 (ix)
	ld	-1 (ix), a
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	-4 (ix), c
	ld	-3 (ix), a
;qsolve.c:246: case 2:
00110$:
;qsolve.c:247: g = gcd(an, bd); g2 = gcd(bn, ad);
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_gcd
	push	de
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_gcd
	pop	bc
	ex	de, hl
;qsolve.c:248: if (!g) g = 1;
	ld	a, b
	or	a, c
	jr	NZ, 00112$
	ld	bc, #0x0001
00112$:
;qsolve.c:249: if (!g2) g2 = 1;
	ld	a, h
	or	a, l
	jr	NZ, 00114$
	ld	hl, #0x0001
00114$:
;qsolve.c:250: qn(r, mi(an / g, bn / g2), mi(ad / g2, bd / g));
	push	hl
	push	bc
	ld	e, c
	ld	d, b
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	-2 (ix), e
	ld	-1 (ix), d
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ld	-2 (ix), e
	ld	-1 (ix), d
	pop	bc
	pop	hl
	push	bc
	ex	de, hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ex	de, hl
	pop	bc
	push	hl
	ld	e, c
	ld	d, b
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	c, e
	ld	b, d
	pop	hl
	ex	de, hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_qn
;qsolve.c:251: break;
	jr	00119$
;qsolve.c:252: case 4: r->n = -an; r->d = ad; break;
00115$:
	xor	a, a
	sub	a, -10 (ix)
	ld	e, a
	sbc	a, a
	sub	a, -9 (ix)
	ld	d, a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	a, -8 (ix)
	ld	(bc), a
	inc	bc
	ld	a, -7 (ix)
	ld	(bc), a
	jr	00119$
;qsolve.c:253: case 5: r->n = an; r->d = ad; break;
00116$:
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
	ld	a, -8 (ix)
	ld	(bc), a
	inc	bc
	ld	a, -7 (ix)
	ld	(bc), a
	jr	00119$
;qsolve.c:254: case 6: r->n = iabs(an); r->d = ad; break;
00117$:
	push	bc
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_iabs
	pop	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	a, -8 (ix)
	ld	(bc), a
	inc	bc
	ld	a, -7 (ix)
	ld	(bc), a
;qsolve.c:255: }
00119$:
;qsolve.c:256: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:257: static void qint(U8 r, I n) { R[r].n = n; R[r].d = 1; }
;	---------------------------------
; Function qint
; ---------------------------------
_qint:
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_R
	add	hl, bc
	ld	(hl), e
	inc	hl
	ld	(hl), d
	inc	hl
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	ret
;qsolve.c:260: static L disc(I A, I B, I C)
;	---------------------------------
; Function disc
; ---------------------------------
_disc:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
	ld	-2 (ix), e
	ld	-1 (ix), d
;qsolve.c:262: L p = (L)A * C, q = (L)B * B, D;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	___mulsint2slong
	ld	-10 (ix), e
	ld	-9 (ix), d
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	call	___mulsint2slong
	ld	c, e
	ld	b, d
;qsolve.c:263: if (p > 0x1FFFFFFFL || p < -0x1FFFFFFFL) { err = 1; return 0; }
	ld	a, #0xff
	cp	a, -10 (ix)
	sbc	a, -9 (ix)
	ld	a, #0xff
	sbc	a, -8 (ix)
	ld	a, #0x1f
	sbc	a, -7 (ix)
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	M, 00101$
	ld	a, -10 (ix)
	sub	a, #0x01
	ld	a, -9 (ix)
	sbc	a, #0x00
	ld	a, -8 (ix)
	sbc	a, #0x00
	ld	a, -7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x60
	jr	NC, 00102$
00101$:
	ld	hl, #_err
	ld	(hl), #0x01
	ld	de, #0x0000
	ld	l, e
	ld	h, e
	jr	00107$
00102$:
;qsolve.c:264: D = q - 4 * p;
	push	af
	ld	a, -10 (ix)
	ld	-14 (ix), a
	ld	a, -9 (ix)
	ld	-13 (ix), a
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	pop	af
	ld	a, #0x02
00125$:
	sla	-14 (ix)
	rl	-13 (ix)
	rl	-12 (ix)
	rl	-11 (ix)
	dec	a
	jr	NZ,00125$
	ld	a, c
	sub	a, -14 (ix)
	ld	-6 (ix), a
	ld	a, b
	sbc	a, -13 (ix)
	ld	-5 (ix), a
	ld	a, l
	sbc	a, -12 (ix)
	ld	-4 (ix), a
	ld	a, h
	sbc	a, -11 (ix)
	ld	-3 (ix), a
;qsolve.c:265: if (p < 0 && D < q) err = 1;
	bit	7, -7 (ix)
	jr	Z, 00105$
	ld	a, -6 (ix)
	sub	a, c
	ld	a, -5 (ix)
	sbc	a, b
	ld	a, -4 (ix)
	sbc	a, l
	ld	a, -3 (ix)
	sbc	a, h
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P, 00105$
	ld	hl, #_err
	ld	(hl), #0x01
00105$:
;qsolve.c:266: return D;
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
00107$:
;qsolve.c:267: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:269: static UL isqrt(UL n)
;	---------------------------------
; Function isqrt
; ---------------------------------
_isqrt:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
;qsolve.c:271: UL x = n, r = 0, bit = 1UL << 30;
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	-6 (ix), l
	ld	-5 (ix), h
	xor	a, a
	ld	-12 (ix), a
	ld	-11 (ix), a
	ld	-10 (ix), a
	ld	-9 (ix), a
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), #0x40
;qsolve.c:272: while (bit > x) bit >>= 2;
00101$:
	ld	a, -8 (ix)
	sub	a, -4 (ix)
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	a, -6 (ix)
	sbc	a, -2 (ix)
	ld	a, -5 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00107$
	ld	b, #0x02
00137$:
	srl	-1 (ix)
	rr	-2 (ix)
	rr	-3 (ix)
	rr	-4 (ix)
	djnz	00137$
	jr	00101$
;qsolve.c:273: while (bit) {
00107$:
	ld	a, -1 (ix)
	or	a, -2 (ix)
	or	a, -3 (ix)
	or	a, -4 (ix)
	jp	Z, 00109$
;qsolve.c:274: if (x >= r + bit) { x -= r + bit; r = (r >> 1) + bit; }
	ld	a, -12 (ix)
	add	a, -4 (ix)
	ld	-16 (ix), a
	ld	a, -11 (ix)
	adc	a, -3 (ix)
	ld	-15 (ix), a
	ld	a, -10 (ix)
	adc	a, -2 (ix)
	ld	-14 (ix), a
	ld	a, -9 (ix)
	adc	a, -1 (ix)
	ld	-13 (ix), a
	srl	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	rr	-12 (ix)
	ld	a, -8 (ix)
	sub	a, -16 (ix)
	ld	a, -7 (ix)
	sbc	a, -15 (ix)
	ld	a, -6 (ix)
	sbc	a, -14 (ix)
	ld	a, -5 (ix)
	sbc	a, -13 (ix)
	jr	C, 00105$
	ld	a, -8 (ix)
	sub	a, -16 (ix)
	ld	-8 (ix), a
	ld	a, -7 (ix)
	sbc	a, -15 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	sbc	a, -14 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	sbc	a, -13 (ix)
	ld	-5 (ix), a
	ld	a, -12 (ix)
	add	a, -4 (ix)
	ld	c, a
	ld	a, -11 (ix)
	adc	a, -3 (ix)
	ld	b, a
	ld	a, -10 (ix)
	adc	a, -2 (ix)
	ld	e, a
	ld	a, -9 (ix)
	adc	a, -1 (ix)
	ld	-12 (ix), c
	ld	-11 (ix), b
	ld	-10 (ix), e
	ld	-9 (ix), a
;qsolve.c:275: else r >>= 1;
00105$:
;qsolve.c:276: bit >>= 2;
	ld	b, #0x02
00141$:
	srl	-1 (ix)
	rr	-2 (ix)
	rr	-3 (ix)
	rr	-4 (ix)
	djnz	00141$
	jp	00107$
00109$:
;qsolve.c:278: return r;
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
;qsolve.c:279: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:282: static void sqfree(L n, L *m, L *r)
;	---------------------------------
; Function sqfree
; ---------------------------------
_sqfree:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-24
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	-6 (ix), l
	ld	-5 (ix), h
;qsolve.c:284: UL k, M = 1, Rr = 1, N = n, s;
	ld	-24 (ix), #0x01
	xor	a, a
	ld	-23 (ix), a
	ld	-22 (ix), a
	ld	-21 (ix), a
	ld	-20 (ix), #0x01
	xor	a, a
	ld	-19 (ix), a
	ld	-18 (ix), a
	ld	-17 (ix), a
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	hl, #16
	add	hl, sp
	ld	bc, #4
	ldir
;qsolve.c:286: for (k = 2; k * k * k <= (UL)n && N > 1; k++) {
	ld	-4 (ix), #0x02
	xor	a, a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), a
00116$:
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	push	bc
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	push	bc
	call	__mullong
	pop	af
	ex	(sp),hl
	push	de
	ld	hl, #16
	add	hl, sp
	ex	de, hl
	ld	hl, #20
	add	hl, sp
	ld	bc, #4
	ldir
	pop	de
	pop	hl
	ld	a, -12 (ix)
	sub	a, e
	ld	a, -11 (ix)
	sbc	a, d
	ld	a, -10 (ix)
	sbc	a, l
	ld	a, -9 (ix)
	sbc	a, h
	jp	C, 00107$
	ld	a, #0x01
	cp	a, -16 (ix)
	ld	a, #0x00
	sbc	a, -15 (ix)
	ld	a, #0x00
	sbc	a, -14 (ix)
	ld	a, #0x00
	sbc	a, -13 (ix)
	jp	NC, 00107$
;qsolve.c:288: while (N % k == 0) { N /= k; c++; }
	ld	c, #0x00
00101$:
	push	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -16 (ix)
	ld	d, -15 (ix)
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modulong
	pop	af
	pop	af
	ex	de, hl
	pop	bc
	ld	a, d
	or	a, e
	or	a, h
	or	a, l
	jr	NZ, 00129$
	push	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -16 (ix)
	ld	d, -15 (ix)
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	pop	bc
	ld	-16 (ix), e
	ld	-15 (ix), d
	ld	-14 (ix), l
	ld	-13 (ix), h
	inc	c
	jr	00101$
00129$:
	ld	b, c
;qsolve.c:289: if (c & 1) Rr *= k;
	bit	0, c
	jr	Z, 00112$
	push	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	ld	l, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	pop	bc
	ld	-20 (ix), e
	ld	-19 (ix), d
	ld	-18 (ix), l
	ld	-17 (ix), h
00112$:
;qsolve.c:290: for (; c > 1; c -= 2) M *= k;
	ld	a, #0x01
	sub	a, b
	jr	NC, 00117$
	push	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -24 (ix)
	ld	d, -23 (ix)
	ld	l, -22 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -21 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	pop	bc
	inc	sp
	inc	sp
	push	de
	ld	-22 (ix), l
	ld	-21 (ix), h
	dec	b
	dec	b
	jr	00112$
00117$:
;qsolve.c:286: for (k = 2; k * k * k <= (UL)n && N > 1; k++) {
	inc	-4 (ix)
	jp	NZ,00116$
	inc	-3 (ix)
	jp	NZ,00116$
	inc	-2 (ix)
	jp	NZ,00116$
	inc	-1 (ix)
	jp	00116$
00107$:
;qsolve.c:292: s = isqrt(N);
	ld	e, -16 (ix)
	ld	d, -15 (ix)
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_isqrt
	push	de
	push	hl
	push	hl
	push	de
	call	__mullong
	pop	af
	pop	af
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	hl
	ld	a, -16 (ix)
	sub	a, -4 (ix)
	jr	NZ, 00109$
	ld	a, -15 (ix)
	sub	a, -3 (ix)
	jr	NZ, 00109$
	ld	a, -14 (ix)
	sub	a, -2 (ix)
	jr	NZ, 00109$
	ld	a, -13 (ix)
	sub	a, -1 (ix)
	jr	NZ, 00109$
	push	de
	push	hl
	ld	e, -24 (ix)
	ld	d, -23 (ix)
	ld	l, -22 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -21 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	inc	sp
	inc	sp
	push	de
	ld	-22 (ix), l
	ld	-21 (ix), h
	jr	00110$
00109$:
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	ld	l, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	ld	c, l
	ld	-20 (ix), e
	ld	-19 (ix), d
	ld	-18 (ix), c
	ld	-17 (ix), h
00110$:
;qsolve.c:294: *m = M; *r = Rr;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	hl, #0
	add	hl, sp
	ld	bc, #0x0004
	ldir
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	ld	hl, #4
	add	hl, sp
	ld	bc, #0x0004
	ldir
;qsolve.c:295: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;qsolve.c:302: static void sqrtq(U8 a)
;	---------------------------------
; Function sqrtq
; ---------------------------------
_sqrtq:
	call	___sdcc_enter_ix
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;qsolve.c:305: sqfree((L)iabs(R[a].n) * R[a].d, &m, &sr);
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_R
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ex	de, hl
	push	de
	call	_iabs
	ld	c, e
	ld	b, d
	pop	hl
	inc	hl
	inc	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	___mulsint2slong
	ld	c, l
	ld	b, h
	ld	hl, #_sr
	push	hl
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_sqfree
;qsolve.c:306: qn(&R[SV], ck(m), R[a].d);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	pop	de
	push	de
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_ck
	ld	hl, #(_R + 60)
	call	_qn
;qsolve.c:307: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:313: static void lreset(void)
;	---------------------------------
; Function lreset
; ---------------------------------
_lreset:
;qsolve.c:315: nlines = 0; col = 0; cur = LINE(0);
	ld	hl, #_nlines
	ld	(hl), #0x00
	ld	hl, #_col
	ld	(hl), #0x00
	ld	hl, #_cur
	ld	(hl), #0xec
	inc	hl
	ld	(hl), #0x86
;qsolve.c:316: }
	ret
;qsolve.c:317: static void nl(void)
;	---------------------------------
; Function nl
; ---------------------------------
_nl:
;qsolve.c:319: cur[col] = 0;
	ld	a, (#_cur)
	ld	hl, #_col
	add	a, (hl)
	ld	c, a
	ld	a, (#_cur + 1)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;qsolve.c:320: if (nlines < NL - 1) nlines++;
	ld	hl, #_nlines
	ld	a, (hl)
	sub	a, #0x1d
	jr	NC, 00102$
	inc	(hl)
00102$:
;qsolve.c:321: col = 0; cur = LINE(nlines);
	ld	hl, #_col
	ld	(hl), #0x00
	ld	hl, #_nlines
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x86ec
	add	hl, de
	ld	(_cur), hl
;qsolve.c:322: }
	ret
;qsolve.c:323: static void pc(char c)
;	---------------------------------
; Function pc
; ---------------------------------
_pc:
	ld	c, a
;qsolve.c:325: if (col >= LW) { nl(); cur[col++] = ' '; }
	ld	a, (#_col)
	sub	a, #0x18
	jr	C, 00102$
	push	bc
	call	_nl
	pop	bc
	ld	hl, #_col
	ld	b, (hl)
	inc	(hl)
	ld	hl, #_cur
	ld	a, (hl)
	inc	hl
	add	a, b
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	ld	a, #0x20
	ld	(de), a
00102$:
;qsolve.c:326: cur[col++] = c;
	ld	hl, #_col
	ld	b, (hl)
	inc	(hl)
	ld	hl, #_cur
	ld	a, (hl)
	inc	hl
	add	a, b
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	ld	a, c
	ld	(de), a
;qsolve.c:327: }
	ret
;qsolve.c:328: static void ps(const char *s) { while (*s) pc(*s++); }
;	---------------------------------
; Function ps
; ---------------------------------
_ps:
00101$:
	ld	a, (hl)
	or	a, a
	ret	Z
	inc	hl
	ld	c, a
	push	hl
	ld	a, c
	call	_pc
	pop	hl
	jr	00101$
;qsolve.c:329: static void pl(const char *s) { ps(s); nl(); }
;	---------------------------------
; Function pl
; ---------------------------------
_pl:
	call	_ps
	jp	_nl
;qsolve.c:330: static void pn(L n)
;	---------------------------------
; Function pn
; ---------------------------------
_pn:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-18
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
	ld	c, e
	ld	b, d
	ex	de,hl
;qsolve.c:335: if (n < 0) { pc('-'); u = -n; } else u = n;
	bit	7, d
	jr	Z, 00102$
	push	bc
	push	de
	ld	a, #0x2d
	call	_pc
	pop	de
	pop	bc
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #0x0000
	sbc	hl, de
	ld	-6 (ix), c
	ld	-5 (ix), b
	ld	-4 (ix), l
	ld	-3 (ix), h
	jr	00113$
00102$:
	ld	-6 (ix), c
	ld	-5 (ix), b
	ld	-4 (ix), e
	ld	-3 (ix), d
;qsolve.c:336: do { b[i++] = '0' + (char)(u % 10); u /= 10; } while (u);
00113$:
	ld	c, #0x00
00104$:
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	inc	c
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modulong
	pop	af
	pop	af
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), a
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	pop	bc
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, h
	or	a, -4 (ix)
	or	a, -5 (ix)
	or	a, -6 (ix)
	jr	NZ, 00104$
;qsolve.c:337: while (i) pc(b[--i]);
00107$:
	ld	a, c
	or	a, a
	jr	Z, 00110$
	dec	c
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	b, (hl)
	push	bc
	ld	a, b
	call	_pc
	pop	bc
	jr	00107$
00110$:
;qsolve.c:338: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:339: static void pq(U8 i)
;	---------------------------------
; Function pq
; ---------------------------------
_pq:
;qsolve.c:341: pn(R[i].n);
	ld	l, a
	ld	bc, #_R+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	d, a
	rlca
	sbc	a, a
	ld	c, a
	ld	b, a
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
	pop	hl
;qsolve.c:342: if (R[i].d != 1) { pc('/'); pn(R[i].d); }
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	dec	a
	or	a, b
	ret	Z
	push	hl
	ld	a, #0x2f
	call	_pc
	pop	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
;qsolve.c:343: }
	jp	_pn
;qsolve.c:344: static void ppt(U8 x, U8 y)
;	---------------------------------
; Function ppt
; ---------------------------------
_ppt:
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;qsolve.c:346: pc('('); pq(x); pc(','); pq(y); pc(')');
	push	hl
	ld	a, #0x28
	call	_pc
	pop	hl
	push	hl
	ld	a, h
	call	_pq
	ld	a, #0x2c
	call	_pc
	pop	hl
	ld	a, l
	call	_pq
	ld	a, #0x29
;qsolve.c:347: }
	jp	_pc
;qsolve.c:350: static void pdr(UL m, U8 neg)
;	---------------------------------
; Function pdr
; ---------------------------------
_pdr:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	dec	sp
	ld	c, l
	ld	b, h
;qsolve.c:353: I f = m % 1000;
	push	bc
	push	de
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x03e8
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__modulong
	pop	af
	pop	af
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
;qsolve.c:355: if (neg && m) pc('-');
	ld	a, 4 (ix)
	or	a, a
	jr	Z, 00102$
	ld	a, b
	or	a, c
	or	a, d
	or	a, e
	jr	Z, 00102$
	push	bc
	push	de
	ld	a, #0x2d
	call	_pc
	pop	de
	pop	bc
00102$:
;qsolve.c:356: pn(m / 1000);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x03e8
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	call	_pn
;qsolve.c:357: if (f) {
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	Z, 00113$
;qsolve.c:358: b[0] = '0' + (char)(f / 100); b[1] = '0' + (char)((f / 10) % 10); b[2] = '0' + (char)(f % 10);
	ld	de, #0x0064
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	a, e
	add	a, #0x30
	ld	-7 (ix), a
	ld	de, #0x000a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ex	de, hl
	ld	de, #0x000a
	call	__modsint
	ld	a, e
	add	a, #0x30
	ld	-6 (ix), a
	ld	de, #0x000a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	ld	a, e
	add	a, #0x30
	ld	-5 (ix), a
;qsolve.c:360: while (b[n - 1] == '0') n--;
	ld	c, #0x03
00104$:
	ld	a, c
	dec	a
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	sub	a, #0x30
	jr	NZ, 00122$
	dec	c
	jr	00104$
00122$:
;qsolve.c:361: pc('.');
	push	bc
	ld	a, #0x2e
	call	_pc
	pop	bc
;qsolve.c:362: for (i = 0; i < n; i++) pc(b[i]);
	ld	b, #0x00
00111$:
	ld	a, b
	sub	a, c
	jr	NC, 00113$
	ld	e, b
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	push	bc
	ld	a, e
	call	_pc
	pop	bc
	inc	b
	jr	00111$
00113$:
;qsolve.c:364: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;qsolve.c:365: static void pdq(U8 i)                 /* decimal of a rational */
;	---------------------------------
; Function pdq
; ---------------------------------
_pdq:
	call	___sdcc_enter_ix
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
;qsolve.c:367: pdr(((UL)iabs(R[i].n) * 1000 + R[i].d / 2) / R[i].d, R[i].n < 0);
	ld	l, a
	ld	bc, #_R+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, d
	rlca
	and	a,#0x01
	ld	-9 (ix), a
	ex	de, hl
	push	de
	call	_iabs
	pop	hl
	ld	a, d
	rlca
	sbc	a, a
	ld	b, a
	push	hl
	ld	c, a
	push	bc
	push	de
	ld	de, #0x03e8
	ld	hl, #0x0000
	call	__mullong
	pop	af
	pop	af
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	-6 (ix), l
	ld	-5 (ix), h
	pop	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00103$
	ld	e, c
	ld	d, b
	inc	de
00103$:
	sra	d
	rr	e
	ld	a, d
	rlca
	sbc	hl, hl
	ld	a, -8 (ix)
	add	a, e
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, d
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, l
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, h
	ld	-1 (ix), a
	ld	a, b
	rlca
	sbc	hl, hl
	push	hl
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	ld	a, -9 (ix)
	push	af
	inc	sp
	call	_pdr
;qsolve.c:368: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:369: static void pdq2(U8 i, U8 j)
;	---------------------------------
; Function pdq2
; ---------------------------------
_pdq2:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
	ld	-1 (ix), l
;qsolve.c:371: pdq(i); ps(", "); pdq(j);
	ld	a, c
	call	_pdq
	ld	hl, #___str_0
	call	_ps
	ld	a, -1 (ix)
	call	_pdq
;qsolve.c:372: }
	inc	sp
	pop	ix
	ret
___str_0:
	.ascii ", "
	.db 0x00
;qsolve.c:377: static void pdv(U8 mode)
;	---------------------------------
; Function pdv
; ---------------------------------
_pdv:
	call	___sdcc_enter_ix
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;qsolve.c:379: UL a = mode == 3 ? 0 : ua, s = mode == 2 ? 0 : us, m;
	ld	e, a
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00141$
	xor	a, a
00141$:
	ld	d, a
	or	a, a
	jr	Z, 00109$
	ld	bc, #0x0000
	ld	hl, #0x0000
	jr	00110$
00109$:
	ld	hl, #_ua
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_ua + 2)
00110$:
	inc	sp
	inc	sp
	push	bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00111$
	ld	bc, #0x0000
	ld	hl, #0x0000
	jr	00112$
00111$:
	ld	hl, #_us
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_us + 2)
00112$:
	ld	-4 (ix), c
	ld	-3 (ix), b
	ld	-2 (ix), l
	ld	-1 (ix), h
;qsolve.c:380: U8 an = mode == 3 ? 0 : uan, sn = usn ^ (mode == 1), neg;
	ld	a, d
	or	a, a
	jr	Z, 00113$
	ld	bc, #0x0000
	jr	00114$
00113$:
	ld	hl, #_uan
	ld	c, (hl)
	ld	b, #0x00
00114$:
	dec	e
	ld	a, #0x01
	jr	Z, 00145$
	xor	a, a
00145$:
	ld	hl, #_usn
	xor	a, (hl)
	ld	e, a
;qsolve.c:381: if (an == sn) { m = a + s; neg = an; }
	ld	a, c
	sub	a, e
	jr	NZ, 00105$
	ld	a, -8 (ix)
	add	a, -4 (ix)
	ld	b, a
	ld	a, -7 (ix)
	adc	a, -3 (ix)
	ld	e, a
	ld	a, -6 (ix)
	adc	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -5 (ix)
	adc	a, -1 (ix)
	ld	-8 (ix), b
	ld	-7 (ix), e
	ld	-6 (ix), l
	ld	-5 (ix), a
	jr	00106$
00105$:
;qsolve.c:382: else if (a >= s) { m = a - s; neg = an; }
	ld	a, -8 (ix)
	sub	a, -4 (ix)
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	a, -6 (ix)
	sbc	a, -2 (ix)
	ld	a, -5 (ix)
	sbc	a, -1 (ix)
	jr	C, 00102$
	ld	a, -8 (ix)
	sub	a, -4 (ix)
	ld	e, a
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	d, a
	ld	a, -6 (ix)
	sbc	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -5 (ix)
	sbc	a, -1 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	sp
	inc	sp
	push	de
	ld	-6 (ix), l
	ld	-5 (ix), h
	jr	00106$
00102$:
;qsolve.c:383: else { m = s - a; neg = sn; }
	ld	a, -4 (ix)
	sub	a, -8 (ix)
	ld	c, a
	ld	a, -3 (ix)
	sbc	a, -7 (ix)
	ld	b, a
	ld	a, -2 (ix)
	sbc	a, -6 (ix)
	ld	d, a
	ld	a, -1 (ix)
	sbc	a, -5 (ix)
	inc	sp
	inc	sp
	push	bc
	ld	-6 (ix), d
	ld	-5 (ix), a
	ld	c, e
00106$:
;qsolve.c:384: pdr((m + gw) / (2 * (UL)gw), neg);
	ld	hl, #_gw
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	ld	a, -8 (ix)
	add	a, e
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, d
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, l
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, h
	ld	-1 (ix), a
	ex	de, hl
	add	hl, hl
	ex	de, hl
	adc	hl, hl
	push	bc
	push	hl
	push	de
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	pop	bc
	ld	a, c
	push	af
	inc	sp
	call	_pdr
;qsolve.c:385: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:387: static void fail(const char *m)
;	---------------------------------
; Function fail
; ---------------------------------
_fail:
;qsolve.c:389: lreset();
	push	hl
	call	_lreset
	ld	hl, #___str_1
	call	_pl
	pop	de
;qsolve.c:391: pl(m);
	ex	de, hl
;qsolve.c:392: }
	jp	_pl
___str_1:
	.ascii "ERROR:"
	.db 0x00
;qsolve.c:395: static void pterm(U8 ci, const char *v, U8 first)
;	---------------------------------
; Function pterm
; ---------------------------------
_pterm:
	call	___sdcc_enter_ix
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	ld	c, a
	ld	-2 (ix), e
	ld	-1 (ix), d
;qsolve.c:397: I n = iabs(R[ci].n);
	ld	de, #_R+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_iabs
	ld	-10 (ix), e
	ld	-9 (ix), d
;qsolve.c:398: if (R[ci].n == 0) return;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, b
	or	a, c
	jp	Z,00118$
;qsolve.c:399: if (R[ci].n < 0) pc('-'); else if (!first) pc('+');
	bit	7, b
	jr	Z, 00106$
	ld	a, #0x2d
	call	_pc
	jr	00107$
00106$:
	ld	a, 4 (ix)
	or	a, a
	jr	NZ, 00107$
	ld	a, #0x2b
	call	_pc
00107$:
;qsolve.c:400: if (*v) {
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
;qsolve.c:401: if (R[ci].d == 1) { if (n != 1) pn(n); }
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	rlca
	sbc	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
	ld	a, -12 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;qsolve.c:400: if (*v) {
	ld	a, c
	or	a, a
	jp	Z, 00116$
;qsolve.c:401: if (R[ci].d == 1) { if (n != 1) pn(n); }
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	dec	a
	or	a, b
	jr	NZ, 00111$
	ld	a, -10 (ix)
	dec	a
	or	a, -9 (ix)
	jr	Z, 00112$
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
	jr	00112$
00111$:
;qsolve.c:402: else { pc('('); pn(n); pc('/'); pn(R[ci].d); pc(')'); }
	ld	a, #0x28
	call	_pc
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
	ld	a, #0x2f
	call	_pc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	rlca
	sbc	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
	ld	a, #0x29
	call	_pc
00112$:
;qsolve.c:403: ps(v);
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_ps
	jr	00118$
00116$:
;qsolve.c:405: pn(n);
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
;qsolve.c:406: if (R[ci].d != 1) { pc('/'); pn(R[ci].d); }
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	dec	a
	or	a, b
	jr	Z, 00118$
	ld	a, #0x2f
	call	_pc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
00118$:
;qsolve.c:408: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;qsolve.c:409: static void ppoly(U8 a, U8 b, U8 c, char var)
;	---------------------------------
; Function ppoly
; ---------------------------------
_ppoly:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	-1 (ix), a
	ld	c, l
;qsolve.c:412: U8 first = 1;
	ld	b, #0x01
;qsolve.c:413: v2[0] = var; v2[1] = '|'; v2[2] = 0;
	ld	a, 5 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x7c
	ld	-4 (ix), #0x00
;qsolve.c:414: v1[0] = var; v1[1] = 0;
	ld	a, 5 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
;qsolve.c:415: pterm(a, v2, first); if (R[a].n) first = 0;
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #3
	add	hl, sp
	ex	de, hl
	ld	a, -1 (ix)
	call	_pterm
	pop	bc
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_R
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	e, (hl)
	or	a, e
	jr	Z, 00102$
	ld	b, #0x00
00102$:
;qsolve.c:416: pterm(b, v1, first); if (R[b].n) first = 0;
	push	bc
	push	bc
	inc	sp
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	a, c
	call	_pterm
	pop	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_R
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	c, (hl)
	or	a, c
	jr	Z, 00104$
	ld	b, #0x00
00104$:
;qsolve.c:417: pterm(c, "", first); if (R[c].n) first = 0;
	push	bc
	push	bc
	inc	sp
	ld	de, #___str_2
	ld	a, 4 (ix)
	call	_pterm
	pop	bc
	ld	e, 4 (ix)
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #_R
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	c, (hl)
	or	a, c
	jr	Z, 00106$
	ld	b, #0x00
00106$:
;qsolve.c:418: if (first) pc('0');
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	a, #0x30
	call	_pc
00109$:
;qsolve.c:419: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
___str_2:
	.db 0x00
;qsolve.c:421: static void pxh(U8 h)
;	---------------------------------
; Function pxh
; ---------------------------------
_pxh:
;qsolve.c:423: if (R[h].n == 0) { pc('x'); return; }
	ld	l, a
	ld	bc, #_R+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	or	a, e
	jr	NZ, 00102$
	ld	a, #0x78
	jp	_pc
00102$:
;qsolve.c:424: ps("(x"); pc(R[h].n < 0 ? '+' : '-'); pn(iabs(R[h].n));
	push	bc
	ld	hl, #___str_3
	call	_ps
	pop	bc
	ld	l, c
	ld	h, b
	inc	hl
	bit	7, (hl)
	jr	Z, 00107$
	ld	de, #0x002b
	jr	00108$
00107$:
	ld	de, #0x002d
00108$:
	push	bc
	ld	a, e
	call	_pc
	pop	bc
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	call	_iabs
	pop	bc
	ld	a, d
	rlca
	sbc	hl, hl
	push	bc
	call	_pn
	pop	bc
;qsolve.c:425: if (R[h].d != 1) { pc('/'); pn(R[h].d); }
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	dec	a
	or	a, d
	jr	Z, 00104$
	push	bc
	ld	a, #0x2f
	call	_pc
	pop	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
00104$:
;qsolve.c:426: pc(')');
	ld	a, #0x29
;qsolve.c:427: }
	jp	_pc
___str_3:
	.ascii "(x"
	.db 0x00
;qsolve.c:429: static void pvtx(U8 a, U8 h, U8 k)
;	---------------------------------
; Function pvtx
; ---------------------------------
_pvtx:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	e, a
	ld	-1 (ix), l
;qsolve.c:431: if (R[a].d != 1) { if (R[a].n < 0) pc('-'); pc('('); pn(iabs(R[a].n)); pc('/'); pn(R[a].d); pc(')'); }
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #_R
	add	hl, de
	ex	de, hl
	ld	hl, #0x0002
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	dec	a
	or	a, b
	jr	Z, 00109$
	bit	7, h
	jr	Z, 00102$
	push	de
	ld	a, #0x2d
	call	_pc
	pop	de
00102$:
	push	de
	ld	a, #0x28
	call	_pc
	pop	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_iabs
	ld	a, d
	rlca
	sbc	hl, hl
	call	_pn
	ld	a, #0x2f
	call	_pc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
	ld	a, #0x29
	call	_pc
	jr	00110$
00109$:
;qsolve.c:432: else if (R[a].n == -1) pc('-');
	ld	a, l
	and	a, h
	inc	a
	jr	NZ, 00106$
	ld	a, #0x2d
	call	_pc
	jr	00110$
00106$:
;qsolve.c:433: else if (R[a].n != 1) pn(R[a].n);
	ld	a, l
	dec	a
	or	a, h
	jr	Z, 00110$
	ld	-5 (ix), l
	ld	a, h
	ld	-4 (ix), a
	rlca
	sbc	a, a
	ld	-3 (ix), a
	ld	-2 (ix), a
	pop	de
	push	de
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
00110$:
;qsolve.c:434: pxh(h); pc('|');
	ld	a, -1 (ix)
	call	_pxh
	ld	a, #0x7c
	call	_pc
;qsolve.c:435: if (R[k].n) { pc(R[k].n < 0 ? '-' : '+'); pn(iabs(R[k].n)); if (R[k].d != 1) { pc('/'); pn(R[k].d); } }
	ld	e, 4 (ix)
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_R
	add	hl, de
	ld	c,l
	ld	b,h
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, e
	jr	Z, 00115$
	bit	7, d
	jr	Z, 00117$
	ld	de, #0x002d
	jr	00118$
00117$:
	ld	de, #0x002b
00118$:
	push	bc
	ld	a, e
	call	_pc
	pop	bc
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	call	_iabs
	pop	bc
	ld	a, d
	rlca
	sbc	hl, hl
	push	bc
	call	_pn
;	spillPairReg hl
;	spillPairReg hl
	pop	hl
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	dec	a
	or	a, b
	jr	Z, 00115$
	push	hl
	ld	a, #0x2f
	call	_pc
	pop	hl
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
00115$:
;qsolve.c:436: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;qsolve.c:442: static void toint(U8 a, U8 b, U8 c, U8 red)
;	---------------------------------
; Function toint
; ---------------------------------
_toint:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	-1 (ix), a
	ld	e, l
;qsolve.c:444: I m = lcm(lcm(R[a].d, R[b].d), R[c].d), g;
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, #<(_R)
	add	a, l
	ld	-13 (ix), a
	ld	a, #>(_R)
	adc	a, h
	ld	-12 (ix), a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-3 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-2 (ix), a
	dec	bc
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_R
	add	hl, de
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -11 (ix)
	add	a, #0x02
	ld	-9 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_R)
	ld	-7 (ix), a
	ld	a, h
	adc	a, #>(_R)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_lcm
	ex	de, hl
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	call	_lcm
	pop	bc
	ld	-3 (ix), e
	ld	-2 (ix), d
;qsolve.c:445: ia = mi(R[a].n, m / R[a].d);
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	pop	bc
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_mi
	ex	de, hl
	pop	bc
	ld	(_ia), hl
;qsolve.c:446: ib = mi(R[b].n, m / R[b].d);
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	pop	bc
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_mi
	ex	de, hl
	pop	bc
	ld	(_ib), hl
;qsolve.c:447: ic = mi(R[c].n, m / R[c].d);
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ex	de, hl
	ld	(_ic), hl
;qsolve.c:448: if (red) {
	ld	a, 5 (ix)
	or	a, a
	jr	Z, 00105$
;qsolve.c:449: g = gcd(gcd(ia, ib), ic);
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_ia)
	call	_gcd
	ex	de, hl
	ld	de, (_ic)
	call	_gcd
	ex	de, hl
;qsolve.c:450: if (g > 1) { ia /= g; ib /= g; ic /= g; }
	ld	a, #0x01
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	jp	P, 00105$
	ex	de, hl
	push	de
	ld	hl, (_ia)
	call	__divsint
	pop	hl
	ld	(_ia), de
	ex	de, hl
	push	de
	ld	hl, (_ib)
	call	__divsint
	pop	hl
	ld	(_ib), de
	ex	de, hl
	ld	hl, (_ic)
	call	__divsint
	ex	de, hl
	ld	(_ic), hl
00105$:
;qsolve.c:452: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;qsolve.c:454: static void vertex(U8 a, U8 b, U8 c, U8 h, U8 k)
;	---------------------------------
; Function vertex
; ---------------------------------
_vertex:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	dec	sp
	ld	-1 (ix), a
	ld	e, l
;qsolve.c:456: DIV(h, b, a); qint(T5, -2); DIV(h, h, T5);
	ld	a, 5 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	b, -7 (ix)
	ld	c, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	or	a, #0x30
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	-5 (ix), e
	ld	-4 (ix), #0x00
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	a, l
	or	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	or	a, d
	ld	e, -1 (ix)
	ld	d, #0x00
	push	af
	ld	a, l
	or	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	or	a, d
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	call	_qop
	ld	de, #0xfffe
	ld	a, #0x0d
	call	_qint
	pop	de
	pop	bc
	pop	hl
	push	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, #0x0d
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	or	a, #0x30
	push	af
	ld	a, l
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	or	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	de
	call	_qop
	pop	de
;qsolve.c:457: MUL(k, a, h); ADD(k, k, b); MUL(k, k, h); ADD(k, k, c);
	ld	c, 6 (ix)
	ld	b, #0x00
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	-3 (ix), l
	ld	a, h
	or	a, #0x20
	ld	-2 (ix), a
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	a, -3 (ix)
	or	a, e
	push	af
	ld	a, -2 (ix)
	or	a, d
	ld	d, a
	pop	af
	or	a, -7 (ix)
	ld	e, a
	ld	a, d
	or	a, -6 (ix)
	ld	d, a
	push	hl
	push	bc
	ex	de, hl
	call	_qop
	pop	bc
	pop	hl
	ld	e, c
	ld	d, b
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	a, l
	or	a, e
	ld	c, a
	ld	a, h
	or	a, d
	ld	b, a
	ld	a, c
	or	a, -5 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	or	a, -4 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	call	_qop
	pop	de
	pop	bc
	ld	a, -3 (ix)
	or	a, e
	push	af
	ld	a, -2 (ix)
	or	a, d
	ld	e, a
	pop	af
	or	a, -7 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	or	a, -6 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_qop
	pop	bc
	ld	a, 4 (ix)
	ld	e, #0x00
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	or	a, b
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	call	_qop
;qsolve.c:458: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;qsolve.c:460: static U8 before(U8 a, U8 b)
;	---------------------------------
; Function before
; ---------------------------------
_before:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	e, a
	ld	-1 (ix), l
;qsolve.c:462: if (R[a].d != R[b].d) return R[a].d > R[b].d;
	ld	bc, #_R+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	sub	a, -3 (ix)
	jr	NZ, 00110$
	ld	a, h
	sub	a, -2 (ix)
	jr	Z, 00102$
00110$:
	ld	a, l
	sub	a, -3 (ix)
	ld	a, h
	sbc	a, -2 (ix)
	jp	PO, 00111$
	xor	a, #0x80
00111$:
	rlca
	and	a,#0x01
	jr	00103$
00102$:
;qsolve.c:463: return iabs(R[a].n) >= iabs(R[b].n);
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	call	_iabs
	pop	bc
;	spillPairReg hl
	ld	a, (bc)
	ld	l, a
	inc	bc
	ld	a, (bc)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	de
	call	_iabs
	ex	de, hl
	pop	de
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00112$
	xor	a, #0x80
00112$:
	rlca
	and	a,#0x01
	xor	a, #0x01
00103$:
;qsolve.c:464: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:465: static void swp(U8 a, U8 b)
;	---------------------------------
; Function swp
; ---------------------------------
_swp:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	e, a
	ld	-1 (ix), l
;qsolve.c:468: t = R[a]; R[a] = R[b]; R[b] = t;
	ld	bc, #_R+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	push	de
	push	bc
	ex	de, hl
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	bc, #0x0004
	ldir
	pop	hl
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #0x0004
	ldir
;qsolve.c:469: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:470: static void pfac(U8 r)
;	---------------------------------
; Function pfac
; ---------------------------------
_pfac:
	call	___sdcc_enter_ix
	push	af
;qsolve.c:472: if (R[r].d == 1 && R[r].n == 0) { pc('x'); return; }
	ld	l, a
	ld	bc, #_R+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0002
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	dec	a
	or	a, d
	jr	NZ, 00102$
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	NZ, 00102$
	ld	a, #0x78
	call	_pc
	jr	00106$
00102$:
;qsolve.c:473: pc('(');
	push	bc
	ld	a, #0x28
	call	_pc
	pop	bc
;qsolve.c:474: if (R[r].d != 1) pn(R[r].d);
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	dec	a
	or	a, d
	jr	Z, 00105$
	ld	a, d
	rlca
	sbc	hl, hl
	push	bc
	call	_pn
	pop	bc
00105$:
;qsolve.c:475: pc('x'); pc(R[r].n < 0 ? '+' : '-'); pn(iabs(R[r].n)); pc(')');
	push	bc
	ld	a, #0x78
	call	_pc
	pop	bc
	ld	l, c
	ld	h, b
	inc	hl
	bit	7, (hl)
	jr	Z, 00108$
	ld	de, #0x002b
	jr	00109$
00108$:
	ld	de, #0x002d
00109$:
	push	bc
	ld	a, e
	call	_pc
	pop	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_iabs
	ld	a, d
	rlca
	sbc	hl, hl
	call	_pn
	ld	a, #0x29
	call	_pc
00106$:
;qsolve.c:476: }
	pop	af
	pop	ix
	ret
;qsolve.c:478: static U8 canfac(void)
;	---------------------------------
; Function canfac
; ---------------------------------
_canfac:
	call	___sdcc_enter_ix
	push	af
	push	af
;qsolve.c:480: L D = disc(ia, ib, ic), s;
	ld	hl, (_ic)
	push	hl
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_ia)
	call	_disc
	pop	af
	inc	sp
	inc	sp
	push	de
	ld	-2 (ix), l
	ld	-1 (ix), h
;qsolve.c:481: if (err || D < 0) return 0;
	ld	hl, #_err
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
	bit	7, -1 (ix)
	jr	Z, 00102$
00101$:
	xor	a, a
	jr	00104$
00102$:
;qsolve.c:482: s = isqrt(D);
	pop	de
	push	de
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_isqrt
;qsolve.c:483: return s * s == D;
	push	hl
	push	de
	call	__mullong
	pop	af
	pop	af
	ex	de, hl
	pop	bc
	push	bc
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00111$
	pop	bc
	pop	hl
	push	hl
	push	bc
	cp	a, a
	sbc	hl, de
	ld	a, #0x01
	jr	Z, 00112$
00111$:
	xor	a, a
00112$:
00104$:
;qsolve.c:484: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:485: static void dofactor(void)
;	---------------------------------
; Function dofactor
; ---------------------------------
_dofactor:
	call	___sdcc_enter_ix
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;qsolve.c:487: L D = disc(ia, ib, ic), s = isqrt(D);
	ld	hl, (_ic)
	push	hl
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_ia)
	call	_disc
	pop	af
	inc	sp
	inc	sp
	push	de
	ld	-6 (ix), l
	ld	-5 (ix), h
	pop	de
	push	de
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_isqrt
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
;qsolve.c:489: qn(&R[T0], ck(-ib + s), mi(2, ia));
	ld	hl, #_ia
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0002
	call	_mi
	ld	c, e
	ld	b, d
	xor	a, a
	ld	hl, #_ib
	sub	a, (hl)
	inc	hl
	ld	e, a
	sbc	a, a
	sub	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	ld	a, e
	add	a, -4 (ix)
	ld	e, a
	ld	a, d
	adc	a, -3 (ix)
	ld	d, a
	ld	a, l
	adc	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -1 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_ck
	ld	hl, #(_R + 32)
	call	_qn
;qsolve.c:490: qn(&R[T1], ck(-ib - s), mi(2, ia));
	ld	hl, #_ia
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0002
	call	_mi
	ld	c, e
	ld	b, d
	xor	a, a
	ld	hl, #_ib
	sub	a, (hl)
	inc	hl
	ld	e, a
	sbc	a, a
	sub	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	ld	a, e
	sub	a, -4 (ix)
	ld	e, a
	ld	a, d
	sbc	a, -3 (ix)
	ld	d, a
	ld	a, l
	sbc	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	sbc	a, -1 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_ck
	ld	hl, #(_R + 36)
	call	_qn
;qsolve.c:491: if (!before(T0, T1)) swp(T0, T1);
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_before
	or	a, a
	jr	NZ, 00102$
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_swp
00102$:
;qsolve.c:492: K = ia / mi(R[T0].d, R[T1].d);
	ld	de, (#_R + 38)
	ld	hl, (#_R + 34)
	call	_mi
	ld	hl, (_ia)
	call	__divsint
;qsolve.c:493: if (K == -1) pc('-'); else if (K != 1) pn(K);
	ld	a, e
	and	a, d
	inc	a
	jr	NZ, 00106$
	ld	a, #0x2d
	call	_pc
	jr	00107$
00106$:
	ld	a, e
	dec	a
	or	a, d
	jr	Z, 00107$
	ld	a, d
	rlca
	sbc	hl, hl
	call	_pn
00107$:
;qsolve.c:494: pfac(T0);
	ld	a, #0x08
	call	_pfac
;qsolve.c:495: if (D == 0) pc('|'); else pfac(T1);
	ld	a, -5 (ix)
	or	a, -6 (ix)
	or	a, -7 (ix)
	or	a, -8 (ix)
	jr	NZ, 00109$
	ld	a, #0x7c
	call	_pc
	jr	00111$
00109$:
	ld	a, #0x09
	call	_pfac
00111$:
;qsolve.c:496: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:498: static void uvw(void)
;	---------------------------------
; Function uvw
; ---------------------------------
_uvw:
;qsolve.c:500: gw = lcm(R[SU].d, R[SV].d);
	ld	de, (#(_R + 62) + 0)
	ld	hl, (#(_R + 58) + 0)
	call	_lcm
	ex	de, hl
	ld	(_gw), hl
;qsolve.c:501: gu = mi(R[SU].n, gw / R[SU].d);
	ld	de, (#(_R + 58) + 0)
	ld	hl, (_gw)
	call	__divsint
	ld	hl, (#_R + 56)
	call	_mi
	ex	de, hl
	ld	(_gu), hl
;qsolve.c:502: gv = mi(R[SV].n, gw / R[SV].d);
	ld	de, (#(_R + 62) + 0)
	ld	hl, (_gw)
	call	__divsint
	ld	hl, (#_R + 60)
	call	_mi
	ex	de, hl
	ld	(_gv), hl
;qsolve.c:503: }
	ret
;qsolve.c:504: static void psurd(U8 pm)
;	---------------------------------
; Function psurd
; ---------------------------------
_psurd:
	call	___sdcc_enter_ix
	dec	sp
	ld	-1 (ix), a
;qsolve.c:506: if (sr == 1) {
	ld	hl, #_sr
	ld	a, (hl)
	inc	hl
	dec	a
	or	a, (hl)
	inc	hl
	or	a, (hl)
	inc	hl
	or	a, (hl)
	jr	NZ, 00109$
;qsolve.c:507: if (R[SU].n) pq(SU);
	ld	hl, (#_R + 56)
	ld	a, h
	or	a, l
	jr	Z, 00102$
	ld	a, #0x0e
	call	_pq
00102$:
;qsolve.c:508: if (pm) pc('{');
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00104$
	ld	a, #0x7b
	call	_pc
00104$:
;qsolve.c:509: if (!(R[SV].n == 1 && R[SV].d == 1)) pq(SV);
	ld	hl, (#_R + 60)
	ld	a, l
	dec	a
	or	a, h
	jr	NZ, 00105$
	ld	hl, (#_R + 62)
	ld	a, l
	dec	a
	or	a, h
	jr	Z, 00106$
00105$:
	ld	a, #0x0f
	call	_pq
00106$:
;qsolve.c:510: pc('i');
	ld	a, #0x69
	call	_pc
;qsolve.c:511: return;
	jp	00129$
00109$:
;qsolve.c:513: uvw();
	call	_uvw
;qsolve.c:514: if (gu) { if (gw > 1) pc('('); pn(gu); }
	ld	hl, #_gu + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z, 00113$
	ld	a, #0x01
	ld	hl, #_gw
	cp	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jp	PO, 00201$
	xor	a, #0x80
00201$:
	jp	P, 00111$
	ld	a, #0x28
	call	_pc
00111$:
	ld	hl, #_gu
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
00113$:
;qsolve.c:515: if (pm) pc('{');
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00115$
	ld	a, #0x7b
	call	_pc
00115$:
;qsolve.c:516: if (!gu && gw > 1) pc('(');
	ld	hl, #_gu + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00117$
	ld	a, #0x01
	ld	hl, #_gw
	cp	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jp	PO, 00202$
	xor	a, #0x80
00202$:
	jp	P, 00117$
	ld	a, #0x28
	call	_pc
00117$:
;qsolve.c:517: if (gv != 1) pn(gv);
	ld	hl, #_gv
	ld	a, (hl)
	inc	hl
	dec	a
	or	a, (hl)
	jr	Z, 00120$
	ld	hl, #_gv
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
00120$:
;qsolve.c:518: if (sim) pc('i');
	ld	a, (#_sim)
	or	a, a
	jr	Z, 00122$
	ld	a, #0x69
	call	_pc
00122$:
;qsolve.c:519: pc('}'); pn(sr);
	ld	a, #0x7d
	call	_pc
	ld	hl, #_sr
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_sr + 2)
	call	_pn
;qsolve.c:520: if (gw > 1 && (gu || 1)) pc(')');
	ld	a, #0x01
	ld	hl, #_gw
	cp	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jp	PO, 00204$
	xor	a, #0x80
00204$:
	jp	P, 00124$
	ld	a, #0x29
	call	_pc
00124$:
;qsolve.c:521: if (gw > 1) { pc('/'); pn(gw); }
	ld	a, #0x01
	ld	hl, #_gw
	cp	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jp	PO, 00205$
	xor	a, #0x80
00205$:
	jp	P, 00129$
	ld	a, #0x2f
	call	_pc
	ld	hl, #_gw
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
00129$:
;qsolve.c:522: }
	inc	sp
	pop	ix
	ret
;qsolve.c:523: static void pdec(char var)
;	---------------------------------
; Function pdec
; ---------------------------------
_pdec:
	call	___sdcc_enter_ix
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;qsolve.c:525: if (sim && sr == 1 && R[SU].d == 1 && R[SV].d == 1) return;
	ld	a, (#_sim)
	or	a, a
	jr	Z, 00102$
	ld	hl, #_sr
	ld	a, (hl)
	inc	hl
	dec	a
	or	a, (hl)
	inc	hl
	or	a, (hl)
	inc	hl
	or	a, (hl)
	jr	NZ, 00102$
	ld	hl, (#_R + 58)
	ld	a, l
	dec	a
	or	a, h
	jr	NZ, 00102$
	ld	hl, (#_R + 62)
	ld	a, l
	dec	a
	or	a, h
	jp	Z,00117$
	jr	00102$
00102$:
;qsolve.c:526: uvw();
	call	_uvw
;qsolve.c:527: if (sr > 1000 || iabs(gv) > 16000) return;
	ld	a, #0xe8
	ld	hl, #_sr
	cp	a, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0003
	sbc	hl, de
	ld	a, #0x00
	ld	hl, #_sr + 3
	sbc	a, (hl)
	jp	PO, 00179$
	xor	a, #0x80
00179$:
	jp	M,00117$
	ld	hl, (_gv)
	call	_iabs
	ld	a, #0x80
	cp	a, e
	ld	a, #0x3e
	sbc	a, d
	jp	PO, 00180$
	xor	a, #0x80
00180$:
	jp	P, 00107$
	jp	00117$
00107$:
;qsolve.c:528: us = (UL)gv * gv * sr;                        /* gv*sqrt(sr)*2000, as exact as 32 bits allow */
	ld	hl, #_gv
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	push	hl
	push	de
	call	__mullong
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_sr
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	ld	(_us), de
	ld	(_us + 2), hl
;qsolve.c:529: us = (gv <= 1000 && us <= 1073) ? isqrt(us * 4000000UL) : isqrt((UL)sr * 4000000UL) * (UL)gv;
	ld	a, #0xe8
	ld	hl, #_gv
	cp	a, (hl)
	inc	hl
	ld	a, #0x03
	sbc	a, (hl)
	jp	PO, 00181$
	xor	a, #0x80
00181$:
	jp	M, 00119$
	ld	a, #0x31
	ld	hl, #_us
	cp	a, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0004
	sbc	hl, de
	ld	a, #0x00
	ld	hl, #_us + 3
	sbc	a, (hl)
	jr	C, 00119$
	ld	hl, (_us + 2)
	push	hl
	ld	hl, (_us)
	push	hl
	ld	de, #0x0900
	ld	hl, #0x003d
	call	__mullong
	pop	af
	pop	af
	call	_isqrt
	jr	00120$
00119$:
	pop	de
	pop	hl
	ex	de, hl
	push	de
	push	hl
	push	de
	push	hl
	ld	de, #0x0900
	ld	hl, #0x003d
	call	__mullong
	pop	af
	pop	af
	call	_isqrt
	inc	sp
	inc	sp
	push	de
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	hl, #_gv
	ld	c, (hl)
	inc	hl
	ld	a, (hl)
	ld	b, a
	rlca
	sbc	hl, hl
	push	hl
	push	bc
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
00120$:
	ld	(_us), de
	ld	(_us + 2), hl
;qsolve.c:530: usn = 0;
	ld	hl, #_usn
	ld	(hl), #0x00
;qsolve.c:531: ua = (UL)iabs(gu) * 2000UL;
	ld	hl, (_gu)
	call	_iabs
	ld	a, d
	rlca
	sbc	hl, hl
	push	hl
	push	de
	ld	de, #0x07d0
	ld	hl, #0x0000
	call	__mullong
	pop	af
	pop	af
	ld	(_ua), de
	ld	(_ua + 2), hl
;qsolve.c:532: uan = gu < 0;
	ld	a, (#_gu + 1)
	rlca
	and	a,#0x01
	ld	(#_uan),a
;qsolve.c:533: pc(var); pc('`');
	ld	a, -1 (ix)
	call	_pc
	ld	a, #0x60
	call	_pc
;qsolve.c:534: if (sim) {
	ld	a, (#_sim)
	or	a, a
	jr	Z, 00115$
;qsolve.c:535: if (gu) pdv(2);
	ld	hl, #_gu + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z, 00110$
	ld	a, #0x02
	call	_pdv
00110$:
;qsolve.c:536: pc('{'); pdv(3); pc('i');
	ld	a, #0x7b
	call	_pc
	ld	a, #0x03
	call	_pdv
	ld	a, #0x69
	call	_pc
	jr	00116$
00115$:
;qsolve.c:537: } else if (!gu) { pc('{'); pdv(3); }
	ld	hl, #_gu + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00112$
	ld	a, #0x7b
	call	_pc
	ld	a, #0x03
	call	_pdv
	jr	00116$
00112$:
;qsolve.c:538: else { pdv(0); ps(", "); pdv(1); }
	xor	a, a
	call	_pdv
	ld	hl, #___str_4
	call	_ps
	ld	a, #0x01
	call	_pdv
00116$:
;qsolve.c:539: nl();
	call	_nl
00117$:
;qsolve.c:540: }
	ld	sp, ix
	pop	ix
	ret
___str_4:
	.ascii ", "
	.db 0x00
;qsolve.c:542: static void psols(char var)
;	---------------------------------
; Function psols
; ---------------------------------
_psols:
	call	___sdcc_enter_ix
	dec	sp
;qsolve.c:544: pc(var); pc('=');
	ld	-1 (ix), a
	call	_pc
	ld	a, #0x3d
	call	_pc
;qsolve.c:545: if (!sim && sr == 1) {
	ld	a, (#_sim)
	or	a, a
	jp	NZ, 00115$
	ld	hl, #_sr
	ld	a, (hl)
	inc	hl
	dec	a
	or	a, (hl)
	inc	hl
	or	a, (hl)
	inc	hl
	or	a, (hl)
	jp	NZ,00115$
;qsolve.c:546: ADD(T0, SU, SV);
	ld	hl, #0x08ef
	call	_qop
;qsolve.c:547: SUB(T1, SU, SV);
	ld	hl, #0x19ef
	call	_qop
;qsolve.c:548: if (R[SV].n == 0) pq(T0);
	ld	hl, (#(_R + 60) + 0)
	ld	a, h
	or	a, l
	jr	NZ, 00107$
	ld	a, #0x08
	call	_pq
	jr	00108$
00107$:
;qsolve.c:549: else if (R[SU].n == 0) { pc('{'); pq(SV); }
	ld	hl, (#_R + 56)
	ld	a, h
	or	a, l
	jr	NZ, 00104$
	ld	a, #0x7b
	call	_pc
	ld	a, #0x0f
	call	_pq
	jr	00108$
00104$:
;qsolve.c:551: if (!before(T0, T1)) swp(T0, T1);
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_before
	or	a, a
	jr	NZ, 00102$
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_swp
00102$:
;qsolve.c:552: pq(T0); ps(", "); pq(T1);
	ld	a, #0x08
	call	_pq
	ld	hl, #___str_5
	call	_ps
	ld	a, #0x09
	call	_pq
00108$:
;qsolve.c:554: nl();
	call	_nl
;qsolve.c:555: if (R[T0].d != 1 || R[T1].d != 1) {
	ld	hl, (#_R + 34)
	ld	a, l
	dec	a
	or	a, h
	jr	NZ, 00111$
	ld	hl, (#_R + 38)
	ld	a, l
	dec	a
	or	a, h
	jr	Z, 00117$
00111$:
;qsolve.c:556: pc(var); pc('`'); pdq(T0);
	ld	a, -1 (ix)
	call	_pc
	ld	a, #0x60
	call	_pc
	ld	a, #0x08
	call	_pdq
;qsolve.c:557: if (R[SV].n) { ps(", "); pdq(T1); }
	ld	bc, (#(_R + 60) + 0)
	ld	a, b
	or	a, c
	jr	Z, 00110$
	ld	hl, #___str_5
	call	_ps
	ld	a, #0x09
	call	_pdq
00110$:
;qsolve.c:558: nl();
	call	_nl
;qsolve.c:560: return;
	jr	00117$
00115$:
;qsolve.c:562: psurd(1);
	ld	a, #0x01
	call	_psurd
;qsolve.c:563: nl();
	call	_nl
;qsolve.c:564: pdec(var);
	ld	a, -1 (ix)
	call	_pdec
00117$:
;qsolve.c:565: }
	inc	sp
	pop	ix
	ret
___str_5:
	.ascii ", "
	.db 0x00
;qsolve.c:567: static void solveint(char var)
;	---------------------------------
; Function solveint
; ---------------------------------
_solveint:
	call	___sdcc_enter_ix
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;qsolve.c:570: if (ia == 0) {
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00104$
;qsolve.c:571: if (ib == 0) { pl(ic ? "no solution" : "all real numbers"); return; }
	ld	hl, #_ib + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00102$
	ld	hl, #_ic + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z, 00112$
	ld	de, #___str_6+0
	jr	00113$
00112$:
	ld	de, #___str_7+0
00113$:
	ex	de, hl
	call	_pl
	jp	00110$
00102$:
;qsolve.c:572: pc(var); pc('='); qn(&R[T0], -ic, ib); pq(T0); nl();
	ld	a, -1 (ix)
	call	_pc
	ld	a, #0x3d
	call	_pc
	xor	a, a
	ld	hl, #_ic
	sub	a, (hl)
	inc	hl
	ld	c, a
	sbc	a, a
	sub	a, (hl)
	ld	d, a
	ld	hl, (_ib)
	push	hl
	ld	e, c
	ld	hl, #(_R + 32)
	call	_qn
	ld	a, #0x08
	call	_pq
	call	_nl
;qsolve.c:573: return;
	jp	00110$
00104$:
;qsolve.c:575: D = disc(ia, ib, ic);
	ld	hl, (_ic)
	push	hl
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_ia)
	call	_disc
	pop	af
	inc	sp
	inc	sp
	push	de
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #4
	ldir
;qsolve.c:576: qn(&R[SU], -ib, mi(2, ia));
	ld	hl, #_ia
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0002
	call	_mi
	xor	a, a
	ld	hl, #_ib
	sub	a, (hl)
	inc	hl
	ld	c, a
	sbc	a, a
	sub	a, (hl)
	ld	b, a
	push	de
	ld	e, c
	ld	d, b
	ld	hl, #(_R + 56)
	call	_qn
;qsolve.c:577: sr = 1; sim = 0;
	ld	hl, #_sr
	ld	(hl), #0x01
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	hl, #_sim
	ld	(hl), #0x00
;qsolve.c:578: if (D == 0) qint(SV, 0);
	ld	a, -3 (ix)
	or	a, -4 (ix)
	or	a, -5 (ix)
	or	a, -6 (ix)
	jr	NZ, 00106$
	ld	de, #0x0000
	ld	a, #0x0f
	call	_qint
	jr	00107$
00106$:
;qsolve.c:580: sqfree(D < 0 ? -D : D, &m, &sr);
	ld	a, -3 (ix)
	rlca
	and	a,#0x01
	ld	-2 (ix), a
	or	a, a
	jr	Z, 00114$
	xor	a, a
	sub	a, -6 (ix)
	ld	e, a
	ld	a, #0x00
	sbc	a, -5 (ix)
	ld	d, a
	ld	a, #0x00
	sbc	a, -4 (ix)
	ld	c, a
	sbc	a, a
	sub	a, -3 (ix)
	ld	b, a
	jr	00115$
00114$:
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	c, -4 (ix)
	ld	b, -3 (ix)
00115$:
	ld	hl, #_sr
	push	hl
	ld	hl, #6
	add	hl, sp
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_sqfree
;qsolve.c:581: qn(&R[SV], ck(m), mi(2, iabs(ia)));
	ld	hl, (_ia)
	call	_iabs
	ld	hl, #0x0002
	call	_mi
	ex	de, hl
	push	hl
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_ck
	ld	hl, #(_R + 60)
	call	_qn
;qsolve.c:582: sim = D < 0;
	ld	a, -2 (ix)
	ld	(#_sim),a
00107$:
;qsolve.c:584: if (!err) psols(var);
	ld	hl, #_err
	ld	a, (hl)
	or	a, a
	jr	NZ, 00110$
	ld	a, -1 (ix)
	call	_psols
00110$:
;qsolve.c:585: }
	ld	sp, ix
	pop	ix
	ret
___str_6:
	.ascii "no solution"
	.db 0x00
___str_7:
	.ascii "all real numbers"
	.db 0x00
;qsolve.c:591: static void getabc(U8 m)
;	---------------------------------
; Function getabc
; ---------------------------------
_getabc:
	ld	c, a
;qsolve.c:593: MOV(T0, I0);
	push	bc
	ld	hl, #0x5800
	call	_qop
	pop	bc
;qsolve.c:594: if (m == 0) { MOV(T1, I1); MOV(T2, I2); return; }
	ld	a, c
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x5910
	call	_qop
	ld	hl, #0x5a20
	jp	_qop
00102$:
;qsolve.c:595: if (m == 1) {                       /* a(x-h)^2+k */
	dec	c
	jr	NZ, 00104$
;qsolve.c:596: MUL(T1, I0, I1); ADD(T1, T1, T1); NEG(T1, T1);
	ld	hl, #0x2901
	call	_qop
	ld	hl, #0x0999
	call	_qop
	ld	hl, #0x4990
	call	_qop
;qsolve.c:597: SQ(T2, I1); MUL(T2, T2, I0); ADD(T2, T2, I2);
	ld	hl, #0x2a11
	call	_qop
	ld	hl, #0x2aa0
	call	_qop
	ld	hl, #0x0aa2
	jp	_qop
00104$:
;qsolve.c:599: ADD(T1, I1, I2); MUL(T1, T1, I0); NEG(T1, T1);
	ld	hl, #0x0912
	call	_qop
	ld	hl, #0x2990
	call	_qop
	ld	hl, #0x4990
	call	_qop
;qsolve.c:600: MUL(T2, I1, I2); MUL(T2, T2, I0);
	ld	hl, #0x2a12
	call	_qop
	ld	hl, #0x2aa0
;qsolve.c:602: }
	jp	_qop
;qsolve.c:606: static void t_vp(U8 m)       /* h k x y */
;	---------------------------------
; Function t_vp
; ---------------------------------
_t_vp:
;qsolve.c:609: SUB(T0, I2, I0); SUB(T1, I3, I1);
	ld	hl, #0x1820
	call	_qop
	ld	hl, #0x1931
	call	_qop
;qsolve.c:610: if (R[T0].n == 0) { fail(R[T1].n ? "x=h: NOT A FUNCTION" : "POINT IS THE VERTEX"); return; }
	ld	bc, (#_R + 32)
	ld	a, b
	or	a, c
	jr	NZ, 00102$
	ld	hl, (#_R + 36)
	ld	a, h
	or	a, l
	jr	Z, 00107$
	ld	de, #___str_8+0
	jr	00108$
00107$:
	ld	de, #___str_9+0
00108$:
	ex	de, hl
	jp	_fail
00102$:
;qsolve.c:611: SQ(T2, T0); DIV(T3, T1, T2);
	ld	hl, #0x2a88
	call	_qop
	ld	hl, #0x3b9a
	call	_qop
;qsolve.c:612: if (R[T3].n == 0) { fail("a=0: NOT A PARABOLA"); return; }
	ld	hl, (#_R + 44)
	ld	a, h
	or	a, l
	jr	NZ, 00104$
	ld	hl, #___str_10
	jp	_fail
00104$:
;qsolve.c:613: pl("a=(y-k)/(x-h)|");
	ld	hl, #___str_11
	call	_pl
;qsolve.c:614: ps("a="); pq(T1); pc('/'); pq(T2); nl();
	ld	hl, #___str_12
	call	_ps
	ld	a, #0x09
	call	_pq
	ld	a, #0x2f
	call	_pc
	ld	a, #0x0a
	call	_pq
	call	_nl
;qsolve.c:615: ps("a="); pq(T3); nl();
	ld	hl, #___str_12
	call	_ps
	ld	a, #0x0b
	call	_pq
	call	_nl
;qsolve.c:616: ps("y="); pvtx(T3, I0, I1); nl();
	ld	hl, #___str_13
	call	_ps
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_pvtx
	call	_nl
;qsolve.c:617: MUL(T4, T3, I0); ADD(T4, T4, T4); NEG(T4, T4);
	ld	hl, #0x2cb0
	call	_qop
	ld	hl, #0x0ccc
	call	_qop
	ld	hl, #0x4cc0
	call	_qop
;qsolve.c:618: SQ(T5, I0); MUL(T5, T5, T3); ADD(T5, T5, I1);
	ld	hl, #0x2d00
	call	_qop
	ld	hl, #0x2ddb
	call	_qop
	ld	hl, #0x0dd1
	call	_qop
;qsolve.c:619: ps("y="); ppoly(T3, T4, T5, 'x'); nl();
	ld	hl, #___str_13
	call	_ps
	ld	hl, #0x780d
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_ppoly
;qsolve.c:620: }
	jp	_nl
___str_8:
	.ascii "x=h: NOT A FUNCTION"
	.db 0x00
___str_9:
	.ascii "POINT IS THE VERTEX"
	.db 0x00
___str_10:
	.ascii "a=0: NOT A PARABOLA"
	.db 0x00
___str_11:
	.ascii "a=(y-k)/(x-h)|"
	.db 0x00
___str_12:
	.ascii "a="
	.db 0x00
___str_13:
	.ascii "y="
	.db 0x00
;qsolve.c:624: static void t_tr(U8 m)       /* right  up  reflect  stretch */
;	---------------------------------
; Function t_tr
; ---------------------------------
_t_tr:
;qsolve.c:627: MOV(T0, I3);
	ld	hl, #0x5830
	call	_qop
;qsolve.c:628: if (R[I2].n) NEG(T0, T0);
	ld	hl, (#_R + 8)
	ld	a, h
	or	a, l
	jr	Z, 00102$
	ld	hl, #0x4880
	call	_qop
00102$:
;qsolve.c:629: if (R[T0].n == 0) { fail("STRETCH CANNOT BE 0"); return; }
	ld	bc, (#(_R + 32) + 0)
	ld	a, b
	or	a, c
	jr	NZ, 00104$
	ld	hl, #___str_14
	jp	_fail
00104$:
;qsolve.c:630: pl("f(x)=x| shifted:");
	ld	hl, #___str_15
	call	_pl
;qsolve.c:631: pl("vertex form");
	ld	hl, #___str_16
	call	_pl
;qsolve.c:632: ps("y="); pvtx(T0, I0, I1); nl();
	ld	hl, #___str_17
	call	_ps
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_pvtx
	call	_nl
;qsolve.c:633: MUL(T1, T0, I0); ADD(T1, T1, T1); NEG(T1, T1);
	ld	hl, #0x2980
	call	_qop
	ld	hl, #0x0999
	call	_qop
	ld	hl, #0x4990
	call	_qop
;qsolve.c:634: SQ(T2, I0); MUL(T2, T2, T0); ADD(T2, T2, I1);
	ld	hl, #0x2a00
	call	_qop
	ld	hl, #0x2aa8
	call	_qop
	ld	hl, #0x0aa1
	call	_qop
;qsolve.c:635: pl("standard form");
	ld	hl, #___str_18
	call	_pl
;qsolve.c:636: ps("y="); ppoly(T0, T1, T2, 'x'); nl();
	ld	hl, #___str_17
	call	_ps
	ld	hl, #0x780a
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_ppoly
	call	_nl
;qsolve.c:637: ps("vertex "); ppt(I0, I1); nl();
	ld	hl, #___str_19
	call	_ps
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_ppt
	call	_nl
;qsolve.c:638: pl(R[T0].n > 0 ? "opens up" : "opens down");
	ld	hl, (#(_R + 32) + 0)
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00107$
	ld	de, #___str_20+0
	jr	00108$
00107$:
	ld	de, #___str_21+0
00108$:
	ex	de, hl
;qsolve.c:639: }
	jp	_pl
___str_14:
	.ascii "STRETCH CANNOT BE 0"
	.db 0x00
___str_15:
	.ascii "f(x)=x| shifted:"
	.db 0x00
___str_16:
	.ascii "vertex form"
	.db 0x00
___str_17:
	.ascii "y="
	.db 0x00
___str_18:
	.ascii "standard form"
	.db 0x00
___str_19:
	.ascii "vertex "
	.db 0x00
___str_20:
	.ascii "opens up"
	.db 0x00
___str_21:
	.ascii "opens down"
	.db 0x00
;qsolve.c:643: static void t_fac(U8 m)      /* left a b c, right a b c */
;	---------------------------------
; Function t_fac
; ---------------------------------
_t_fac:
;qsolve.c:646: SUB(T0, I0, I3); SUB(T1, I1, I4); SUB(T2, I2, I5);
	ld	hl, #0x1803
	call	_qop
	ld	hl, #0x1914
	call	_qop
	ld	hl, #0x1a25
	call	_qop
;qsolve.c:647: if (R[T0].n == 0 && R[T1].n == 0) { fail("NO x| OR x TERM LEFT"); return; }
	ld	bc, (#_R + 32)
	ld	a, b
	or	a, c
	jr	NZ, 00102$
	ld	hl, (#_R + 36)
	ld	a, h
	or	a, l
	jr	NZ, 00102$
	ld	hl, #___str_22
	jp	_fail
00102$:
;qsolve.c:648: toint(T0, T1, T2, 1);
	ld	hl, #0x10a
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_toint
;qsolve.c:649: if (ia < 0 || (ia == 0 && ib < 0)) { ia = -ia; ib = -ib; ic = -ic; }
	ld	hl, #_ia + 1
	bit	7, (hl)
	jr	NZ, 00104$
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00105$
	ld	a, (#_ib + 1)
	bit	7, a
	jr	Z, 00105$
00104$:
	xor	a, a
	ld	hl, #_ia
	sub	a, (hl)
	ld	(hl), a
	inc	hl
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
	xor	a, a
	ld	hl, #_ib
	sub	a, (hl)
	ld	(hl), a
	inc	hl
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
	xor	a, a
	ld	hl, #_ic
	sub	a, (hl)
	ld	(hl), a
	inc	hl
	sbc	a, a
	sub	a, (hl)
	ld	(hl), a
00105$:
;qsolve.c:650: qint(T3, ia); qint(T4, ib); qint(T5, ic);
	ld	hl, #_ia
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x0b
	call	_qint
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x0c
	call	_qint
	ld	hl, #_ic
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x0d
	call	_qint
;qsolve.c:651: ppoly(T3, T4, T5, 'x'); pl("=0");
	ld	hl, #0x780d
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_ppoly
	ld	hl, #___str_23
	call	_pl
;qsolve.c:652: if (ia && canfac()) { dofactor(); pl("=0"); }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z, 00111$
	call	_canfac
	or	a, a
	jr	Z, 00111$
	call	_dofactor
	ld	hl, #___str_23
	call	_pl
	jr	00112$
00111$:
;qsolve.c:653: else if (ia) { pl("not factorable over Q"); pl("use quad formula:"); }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z, 00112$
	ld	hl, #___str_24
	call	_pl
	ld	hl, #___str_25
	call	_pl
00112$:
;qsolve.c:654: solveint('x');
	ld	a, #0x78
;qsolve.c:655: }
	jp	_solveint
___str_22:
	.ascii "NO x| OR x TERM LEFT"
	.db 0x00
___str_23:
	.ascii "=0"
	.db 0x00
___str_24:
	.ascii "not factorable over Q"
	.db 0x00
___str_25:
	.ascii "use quad formula:"
	.db 0x00
;qsolve.c:659: static void t_sq(U8 m)       /* a  h  c  : a(x-h)^2 = c */
;	---------------------------------
; Function t_sq
; ---------------------------------
_t_sq:
;qsolve.c:662: if (R[I0].n == 0) { fail("a CANNOT BE 0"); return; }
	ld	bc, (#_R + 0)
	ld	a, b
	or	a, c
	jr	NZ, 00102$
	ld	hl, #___str_26
	jp	_fail
00102$:
;qsolve.c:663: if (R[I0].n != 1 || R[I0].d != 1) pq(I0);
	ld	a, c
	dec	a
	or	a, b
	jr	NZ, 00103$
	ld	hl, (#(_R + 2) + 0)
	ld	a, l
	dec	a
	or	a, h
	jr	Z, 00104$
00103$:
	xor	a, a
	call	_pq
00104$:
;qsolve.c:664: pxh(I1); ps("|="); pq(I2); nl();
	ld	a, #0x01
	call	_pxh
	ld	hl, #___str_27
	call	_ps
	ld	a, #0x02
	call	_pq
	call	_nl
;qsolve.c:665: DIV(T0, I2, I0);
	ld	hl, #0x3820
	call	_qop
;qsolve.c:666: ps(R[I1].n ? "(x-h)|=" : "x|="); pq(T0); nl();
	ld	hl, (#_R + 4)
	ld	a, h
	or	a, l
	jr	Z, 00112$
	ld	de, #___str_28+0
	jr	00113$
00112$:
	ld	de, #___str_29+0
00113$:
	ex	de, hl
	call	_ps
	ld	a, #0x08
	call	_pq
	call	_nl
;qsolve.c:667: if (R[T0].n == 0) { ps("x="); pq(I1); nl(); return; }
	ld	hl, (#(_R + 32) + 0)
	ld	a, h
	or	a, l
	jr	NZ, 00107$
	ld	hl, #___str_30
	call	_ps
	ld	a, #0x01
	call	_pq
	jp	_nl
00107$:
;qsolve.c:668: sqrtq(T0);
	ld	a, #0x08
	call	_sqrtq
;qsolve.c:669: MOV(SU, I1); sim = R[T0].n < 0;
	ld	hl, #0x5e10
	call	_qop
	ld	bc, (#(_R + 32) + 0)
	ld	a, b
	rlca
	and	a,#0x01
	ld	(#_sim),a
;qsolve.c:670: if (err) return;
	ld	hl, #_err
	ld	a, (hl)
	or	a, a
	ret	NZ
;qsolve.c:671: psols('x');
	ld	a, #0x78
;qsolve.c:672: }
	jp	_psols
___str_26:
	.ascii "a CANNOT BE 0"
	.db 0x00
___str_27:
	.ascii "|="
	.db 0x00
___str_28:
	.ascii "(x-h)|="
	.db 0x00
___str_29:
	.ascii "x|="
	.db 0x00
___str_30:
	.ascii "x="
	.db 0x00
;qsolve.c:676: static void t_vf(U8 m)       /* a b c -> vertex form */
;	---------------------------------
; Function t_vf
; ---------------------------------
_t_vf:
;qsolve.c:679: if (R[I0].n == 0) { fail("a CANNOT BE 0"); return; }
	ld	bc, (#_R + 0)
	ld	a, b
	or	a, c
	jr	NZ, 00102$
	ld	hl, #___str_31
	jp	_fail
00102$:
;qsolve.c:680: vertex(I0, I1, I2, T0, T1);
	ld	hl, #0x908
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_vertex
;qsolve.c:681: ps("h=-b/(2a)="); pq(T0); nl();
	ld	hl, #___str_32
	call	_ps
	ld	a, #0x08
	call	_pq
	call	_nl
;qsolve.c:682: ps("k=f(h)="); pq(T1); nl();
	ld	hl, #___str_33
	call	_ps
	ld	a, #0x09
	call	_pq
	call	_nl
;qsolve.c:683: ps("y="); pvtx(I0, T0, T1); nl();
	ld	hl, #___str_34
	call	_ps
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_pvtx
	call	_nl
;qsolve.c:684: ps("vertex "); ppt(T0, T1); nl();
	ld	hl, #___str_35
	call	_ps
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_ppt
;qsolve.c:685: }
	jp	_nl
___str_31:
	.ascii "a CANNOT BE 0"
	.db 0x00
___str_32:
	.ascii "h=-b/(2a)="
	.db 0x00
___str_33:
	.ascii "k=f(h)="
	.db 0x00
___str_34:
	.ascii "y="
	.db 0x00
___str_35:
	.ascii "vertex "
	.db 0x00
;qsolve.c:689: static void t_qf(U8 m)       /* a b c */
;	---------------------------------
; Function t_qf
; ---------------------------------
_t_qf:
;qsolve.c:693: toint(I0, I1, I2, 1);
	ld	hl, #0x102
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_toint
;qsolve.c:694: if (ia == 0) { fail("a CANNOT BE 0"); return; }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00102$
	ld	hl, #___str_36
	jp	_fail
00102$:
;qsolve.c:695: ps("a="); pn(ia); ps(" b="); pn(ib); ps(" c="); pn(ic); nl();
	ld	hl, #___str_37
	call	_ps
	ld	hl, #_ia
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
	ld	hl, #___str_38
	call	_ps
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
	ld	hl, #___str_39
	call	_ps
	ld	hl, #_ic
	ld	e, (hl)
	inc	hl
	ld	a, (hl)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_pn
	call	_nl
;qsolve.c:696: D = disc(ia, ib, ic);
	ld	hl, (_ic)
	push	hl
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (_ia)
	call	_disc
;qsolve.c:697: ps("D=b|-4ac="); pn(D); nl();
	ex	(sp),hl
	push	de
	ld	hl, #___str_40
	call	_ps
	pop	de
;	spillPairReg hl
;	spillPairReg hl
	pop	hl
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
	call	_nl
;qsolve.c:698: pl("x=(-b{}D)/(2a)");
	ld	hl, #___str_41
	call	_pl
;qsolve.c:699: solveint('x');
	ld	a, #0x78
;qsolve.c:700: }
	jp	_solveint
___str_36:
	.ascii "a CANNOT BE 0"
	.db 0x00
___str_37:
	.ascii "a="
	.db 0x00
___str_38:
	.ascii " b="
	.db 0x00
___str_39:
	.ascii " c="
	.db 0x00
___str_40:
	.ascii "D=b|-4ac="
	.db 0x00
___str_41:
	.ascii "x=(-b{}D)/(2a)"
	.db 0x00
;qsolve.c:726: static void t_fq(U8 m)       /* a b c */
;	---------------------------------
; Function t_fq
; ---------------------------------
_t_fq:
;qsolve.c:729: toint(I0, I1, I2, 0);
	ld	hl, #0x02
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_toint
;qsolve.c:730: if (ia == 0) { fail("a CANNOT BE 0"); return; }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00102$
	ld	hl, #___str_42
	jp	_fail
00102$:
;qsolve.c:731: qint(T3, ia); qint(T4, ib); qint(T5, ic);
	ld	hl, #_ia
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x0b
	call	_qint
	ld	hl, #_ib
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x0c
	call	_qint
	ld	hl, #_ic
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x0d
	call	_qint
;qsolve.c:732: ppoly(T3, T4, T5, 'x'); nl();
	ld	hl, #0x780d
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_ppoly
	call	_nl
;qsolve.c:733: if (canfac()) { ps("="); dofactor(); nl(); }
	call	_canfac
	or	a, a
	jr	Z, 00104$
	ld	hl, #___str_43
	call	_ps
	call	_dofactor
	jp	_nl
00104$:
;qsolve.c:734: else { pl("prime over rationals"); pl("roots by formula:"); solveint('x'); }
	ld	hl, #___str_44
	call	_pl
	ld	hl, #___str_45
	call	_pl
	ld	a, #0x78
;qsolve.c:735: }
	jp	_solveint
___str_42:
	.ascii "a CANNOT BE 0"
	.db 0x00
___str_43:
	.ascii "="
	.db 0x00
___str_44:
	.ascii "prime over rationals"
	.db 0x00
___str_45:
	.ascii "roots by formula:"
	.db 0x00
;qsolve.c:756: static void pz(U8 re, U8 im)
;	---------------------------------
; Function pz
; ---------------------------------
_pz:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-1 (ix), a
;qsolve.c:758: if (R[im].n == 0) { pq(re); return; }
	ld	-5 (ix), l
	ld	-4 (ix), #0x00
	pop	hl
	push	hl
	add	hl, hl
	add	hl, hl
	ld	de, #_R
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	NZ, 00102$
	ld	a, -1 (ix)
	call	_pq
	jr	00113$
00102$:
;qsolve.c:759: if (R[re].n) pq(re);
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_R
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	Z, 00104$
	push	de
	ld	a, -1 (ix)
	call	_pq
	pop	de
00104$:
;qsolve.c:760: if (R[im].n < 0) pc('-'); else if (R[re].n) pc('+');
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	inc	hl
	bit	7, (hl)
	jr	Z, 00108$
	ld	a, #0x2d
	call	_pc
	jr	00109$
00108$:
	ex	de,hl
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	Z, 00109$
	ld	a, #0x2b
	call	_pc
00109$:
;qsolve.c:761: ABS(T5, im);
	pop	hl
	push	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, h
	or	a, #0x6d
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	call	_qop
;qsolve.c:762: if (!(R[T5].n == 1 && R[T5].d == 1)) pq(T5);
	ld	hl, (#_R + 52)
	ld	a, l
	dec	a
	or	a, h
	jr	NZ, 00110$
	ld	hl, (#_R + 54)
	ld	a, l
	dec	a
	or	a, h
	jr	Z, 00111$
00110$:
	ld	a, #0x0d
	call	_pq
00111$:
;qsolve.c:763: pc('i');
	ld	a, #0x69
	call	_pc
00113$:
;qsolve.c:764: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:1020: static U8 strlen_(const char *s)
;	---------------------------------
; Function strlen_
; ---------------------------------
_strlen_:
;qsolve.c:1023: while (*s++) n++;
	ld	c, #0x00
00101$:
	ld	a, (hl)
	inc	hl
	or	a, a
	jr	Z, 00103$
	inc	c
	jr	00101$
00103$:
;qsolve.c:1024: return n;
	ld	a, c
;qsolve.c:1025: }
	ret
_lbl_vp:
	.dw __str_46
	.dw __str_47
	.dw __str_48
	.dw __str_49
_lbl_tr:
	.dw __str_50
	.dw __str_51
	.dw __str_52
	.dw __str_53
_def_tr:
	.dw __str_54
	.dw __str_54
	.dw __str_54
	.dw __str_55
_lbl_fac:
	.dw __str_56
	.dw __str_57
	.dw __str_58
	.dw __str_59
	.dw __str_60
	.dw __str_61
_lbl_sq:
	.dw __str_62
	.dw __str_63
	.dw __str_64
_def_sq:
	.dw __str_55
	.dw __str_54
	.dw __str_54
_lbl_abc:
	.dw __str_65
	.dw __str_66
	.dw __str_64
_lbl_abcp:
	.dw __str_65
	.dw __str_66
	.dw __str_64
	.dw __str_67
	.dw __str_68
_lbl_vf:
	.dw __str_62
	.dw __str_69
	.dw __str_70
	.dw __str_67
	.dw __str_68
_lbl_ff:
	.dw __str_62
	.dw __str_71
	.dw __str_72
	.dw __str_67
	.dw __str_68
_lbl_zf:
	.dw __str_62
	.dw __str_73
	.dw __str_74
_lbl_z2:
	.dw __str_75
	.dw __str_76
	.dw __str_77
	.dw __str_78
_lbl_n:
	.dw __str_79
_lbl_rad:
	.dw __str_80
_lbl_ac:
	.dw __str_65
	.dw __str_64
_lbl_pj:
	.dw __str_81
	.dw __str_82
	.dw __str_83
_def_one:
	.dw __str_55
_d_zero:
	.dw __str_54
	.dw __str_54
	.dw __str_54
	.dw __str_54
	.dw __str_54
	.dw __str_54
_d_opt:
	.dw __str_54
	.dw __str_54
	.dw __str_54
	.dw __str_84
	.dw __str_84
_T:
	.dw __str_85
	.db #0x04	; 4
	.dw _lbl_vp
	.dw _d_zero
	.dw _t_vp
	.db #0x00	; 0
	.dw __str_86
	.db #0x04	; 4
	.dw _lbl_tr
	.dw _def_tr
	.dw _t_tr
	.db #0x00	; 0
	.dw __str_87
	.db #0x06	; 6
	.dw _lbl_fac
	.dw _d_zero
	.dw _t_fac
	.db #0x00	; 0
	.dw __str_88
	.db #0x03	; 3
	.dw _lbl_sq
	.dw _def_sq
	.dw _t_sq
	.db #0x00	; 0
	.dw __str_89
	.db #0x03	; 3
	.dw _lbl_abc
	.dw _d_zero
	.dw _t_vf
	.db #0x00	; 0
	.dw __str_90
	.db #0x03	; 3
	.dw _lbl_abc
	.dw _d_zero
	.dw _t_qf
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw __str_91
	.db #0x03	; 3
	.dw _lbl_abc
	.dw _d_zero
	.dw _t_fq
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
__str_46:
	.ascii "h (vertex x)"
	.db 0x00
__str_47:
	.ascii "k (vertex y)"
	.db 0x00
__str_48:
	.ascii "point x"
	.db 0x00
__str_49:
	.ascii "point y"
	.db 0x00
__str_50:
	.ascii "right(+)/left"
	.db 0x00
__str_51:
	.ascii "up(+)/down"
	.db 0x00
__str_52:
	.ascii "reflect x=1"
	.db 0x00
__str_53:
	.ascii "stretch"
	.db 0x00
__str_54:
	.ascii "0"
	.db 0x00
__str_55:
	.ascii "1"
	.db 0x00
__str_56:
	.ascii "left x| "
	.db 0x00
__str_57:
	.ascii "left x "
	.db 0x00
__str_58:
	.ascii "left num"
	.db 0x00
__str_59:
	.ascii "right x| "
	.db 0x00
__str_60:
	.ascii "right x "
	.db 0x00
__str_61:
	.ascii "right num"
	.db 0x00
__str_62:
	.ascii "a"
	.db 0x00
__str_63:
	.ascii "h  (x-h)|"
	.db 0x00
__str_64:
	.ascii "c"
	.db 0x00
__str_65:
	.ascii "a (x|)"
	.db 0x00
__str_66:
	.ascii "b (x)"
	.db 0x00
__str_67:
	.ascii "pt x opt"
	.db 0x00
__str_68:
	.ascii "pt y opt"
	.db 0x00
__str_69:
	.ascii "h"
	.db 0x00
__str_70:
	.ascii "k"
	.db 0x00
__str_71:
	.ascii "p"
	.db 0x00
__str_72:
	.ascii "q"
	.db 0x00
__str_73:
	.ascii "p  (x-p)"
	.db 0x00
__str_74:
	.ascii "q  (x-q)"
	.db 0x00
__str_75:
	.ascii "z1 real"
	.db 0x00
__str_76:
	.ascii "z1 imag"
	.db 0x00
__str_77:
	.ascii "z2 real"
	.db 0x00
__str_78:
	.ascii "z2 imag"
	.db 0x00
__str_79:
	.ascii "n"
	.db 0x00
__str_80:
	.ascii "radicand"
	.db 0x00
__str_81:
	.ascii "t| coef"
	.db 0x00
__str_82:
	.ascii "t coef"
	.db 0x00
__str_83:
	.ascii "constant"
	.db 0x00
__str_84:
	.db 0x00
__str_85:
	.ascii "VERTEX+POINT>PARABOLA"
	.db 0x00
__str_86:
	.ascii "TRANSFORMATIONS"
	.db 0x00
__str_87:
	.ascii "SOLVE BY FACTORING"
	.db 0x00
__str_88:
	.ascii "SOLVE BY SQUARE ROOTS"
	.db 0x00
__str_89:
	.ascii "STANDARD>VERTEX FORM"
	.db 0x00
__str_90:
	.ascii "QUADRATIC FORMULA"
	.db 0x00
__str_91:
	.ascii "FACTOR QUADRATIC"
	.db 0x00
;qsolve.c:1027: static signed char digit(U8 k)
;	---------------------------------
; Function digit
; ---------------------------------
_digit:
;qsolve.c:1029: switch (k) {
	ld	c, a
	sub	a, #0x12
	jr	Z, 00104$
	ld	a,c
	cp	a,#0x13
	jr	Z, 00107$
	cp	a,#0x14
	jr	Z, 00110$
	cp	a,#0x1a
	jr	Z, 00103$
	cp	a,#0x1b
	jr	Z, 00106$
	cp	a,#0x1c
	jr	Z, 00109$
	cp	a,#0x21
	jr	Z, 00101$
	cp	a,#0x22
	jr	Z, 00102$
	cp	a,#0x23
	jr	Z, 00105$
	sub	a, #0x24
	jr	Z, 00108$
	jr	00111$
;qsolve.c:1030: case 0x21: return 0; case 0x22: return 1; case 0x1A: return 2; case 0x12: return 3;
00101$:
	xor	a, a
	ret
00102$:
	ld	a, #0x01
	ret
00103$:
	ld	a, #0x02
	ret
00104$:
	ld	a, #0x03
	ret
;qsolve.c:1031: case 0x23: return 4; case 0x1B: return 5; case 0x13: return 6; case 0x24: return 7;
00105$:
	ld	a, #0x04
	ret
00106$:
	ld	a, #0x05
	ret
00107$:
	ld	a, #0x06
	ret
00108$:
	ld	a, #0x07
	ret
;qsolve.c:1032: case 0x1C: return 8; case 0x14: return 9;
00109$:
	ld	a, #0x08
	ret
00110$:
	ld	a, #0x09
	ret
;qsolve.c:1033: }
00111$:
;qsolve.c:1034: return -1;
	ld	a, #0xff
;qsolve.c:1035: }
	ret
;qsolve.c:1038: static U8 parse(const char *s, U8 i)
;	---------------------------------
; Function parse
; ---------------------------------
_parse:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
;qsolve.c:1040: unsigned n = 0, d = 1, den = 0, *t;
	xor	a, a
	ld	-12 (ix), a
	ld	-11 (ix), a
	ld	-4 (ix), #0x01
	ld	-3 (ix), #0
	xor	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
;qsolve.c:1041: U8 neg = 0, dot = 0, slash = 0, dg = 0;
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
;qsolve.c:1042: if (*s == '-') { neg = 1; s++; }
	ld	a, (hl)
	sub	a, #0x2d
	jr	NZ, 00156$
	ld	-8 (ix), #0x01
	inc	hl
00156$:
	ld	-2 (ix), l
	ld	-1 (ix), h
00136$:
;qsolve.c:1043: for (; *s; s++) {
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	Z, 00124$
;qsolve.c:1044: if (*s == '.') { if (dot || slash) return 1; dot = 1; }
	ld	a, c
	sub	a, #0x2e
	jr	NZ, 00122$
	ld	a, -7 (ix)
	or	a, a
	jr	NZ, 00103$
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00104$
00103$:
	ld	a, #0x01
	jp	00138$
00104$:
	ld	-7 (ix), #0x01
	jp	00137$
00122$:
;qsolve.c:1045: else if (*s == '/') { if (slash || !dg) return 1; slash = 1; dg = 0; den = 0; }
	ld	a, c
	sub	a, #0x2f
	jr	NZ, 00119$
	ld	a, -6 (ix)
	or	a, a
	jr	NZ, 00106$
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00107$
00106$:
	ld	a, #0x01
	jp	00138$
00107$:
	ld	-6 (ix), #0x01
	ld	-5 (ix), #0x00
	xor	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	jp	00137$
00119$:
;qsolve.c:1047: dg = 1;
	ld	-5 (ix), #0x01
;qsolve.c:1048: t = slash ? &den : &n;
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00140$
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	jr	00141$
00140$:
	ld	hl, #0
	add	hl, sp
	ex	de, hl
00141$:
;qsolve.c:1049: if (*t > 3276) { err = 1; return 1; }
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0xcc
	cp	a, l
	ld	a, #0x0c
	sbc	a, h
	jr	NC, 00110$
	ld	hl, #_err
	ld	a,#0x01
	ld	(hl),a
	jp	00138$
00110$:
;qsolve.c:1050: *t = *t * 10 + (*s - '0');
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	a, c
	ld	b, #0x00
	add	a, #0xd0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l, e
	ld	h, d
	ld	(hl), c
	inc	hl
	ld	(hl), b
;qsolve.c:1051: if (dot && !slash) { if (d > 3276) { err = 1; return 1; } d *= 10; }
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00114$
	ld	a, -6 (ix)
	or	a, a
	jr	NZ, 00114$
	ld	a, #0xcc
	cp	a, -4 (ix)
	ld	a, #0x0c
	sbc	a, -3 (ix)
	jr	NC, 00112$
	ld	hl, #_err
	ld	a,#0x01
	ld	(hl),a
	jp	00138$
00112$:
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	-4 (ix), l
	ld	-3 (ix), h
00114$:
;qsolve.c:1052: if (*t > 32767) { err = 1; return 1; }
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xff
	cp	a, c
	ld	a, #0x7f
	sbc	a, b
	jr	NC, 00137$
	ld	hl, #_err
	ld	a,#0x01
	ld	(hl),a
	jp	00138$
00137$:
;qsolve.c:1043: for (; *s; s++) {
	inc	-2 (ix)
	jp	NZ,00136$
	inc	-1 (ix)
	jp	00136$
00124$:
;qsolve.c:1055: if (!dg) { if (neg || slash || dot) return 1; qint(i, 0); return 0; }
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00130$
	ld	a, -8 (ix)
	or	a, a
	jr	NZ, 00125$
	ld	a, -6 (ix)
	or	a, a
	jr	NZ, 00125$
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00126$
00125$:
	ld	a, #0x01
	jp	00138$
00126$:
	ld	de, #0x0000
	ld	a, 4 (ix)
	call	_qint
	xor	a, a
	jr	00138$
00130$:
;qsolve.c:1056: if (slash) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00134$
;qsolve.c:1057: if (den == 0) { err = 2; return 1; }
	ld	a, -9 (ix)
	or	a, -10 (ix)
	jr	NZ, 00132$
	ld	hl, #_err
	ld	(hl), #0x02
	ld	a, #0x01
	jr	00138$
00132$:
;qsolve.c:1058: d = mi(d, den);
	pop	hl
	pop	de
	push	de
	push	hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ld	-4 (ix), e
	ld	-3 (ix), d
00134$:
;qsolve.c:1060: qn(&R[i], neg ? -(I)n : (I)n, d);
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	a, -11 (ix)
	ld	-1 (ix), a
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00142$
	xor	a, a
	sub	a, -2 (ix)
	ld	-6 (ix), a
	sbc	a, a
	sub	a, -1 (ix)
	ld	-5 (ix), a
	jr	00143$
00142$:
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
00143$:
	ld	bc, #_R+0
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	push	de
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	call	_qn
;qsolve.c:1061: return err;
	ld	a, (#_err)
00138$:
;qsolve.c:1062: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;qsolve.c:1064: static void title(const char *t)
;	---------------------------------
; Function title
; ---------------------------------
_title:
;qsolve.c:1066: clrrow(0, 1);
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_clrrow
	pop	hl
;qsolve.c:1067: puts_(0, 0, t, 1);
	ld	a, #0x01
	push	af
	inc	sp
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_puts_
;qsolve.c:1068: }
	ret
;qsolve.c:1070: static U8 menu(const char *ttl, const char *const *items, U8 n)
;	---------------------------------
; Function menu
; ---------------------------------
_menu:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
	ld	-4 (ix), l
	ld	-3 (ix), h
;qsolve.c:1072: U8 sel = 0, top = 0, i, k, c, r, inv;
	ld	-2 (ix), #0x00
	ld	-11 (ix), #0x00
00138$:
;qsolve.c:1075: cls();
	call	_cls
;qsolve.c:1076: title(ttl);
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_title
;qsolve.c:1077: if (top) putg(23, 0, '^', 1);
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00102$
	ld	hl, #0x15e
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x17
	call	_putg
00102$:
;qsolve.c:1078: if (top + 9 < n) putg(23, 0, 'v', 1);
	ld	c, -11 (ix)
	ld	b, #0x00
	ld	hl, #0x0009
	add	hl, bc
	ex	de, hl
	ld	a, 6 (ix)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, e
	sub	a, -10 (ix)
	ld	a, d
	sbc	a, -9 (ix)
	jp	PO, 00235$
	xor	a, #0x80
00235$:
	jp	P, 00150$
	push	bc
	ld	hl, #0x176
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x17
	call	_putg
	pop	bc
;qsolve.c:1079: for (i = 0; i < 9 && top + i < n; i++) {
00150$:
	ld	-1 (ix), #0x00
00136$:
	ld	a, -1 (ix)
	sub	a, #0x09
	jp	NC, 00107$
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, l
	sub	a, -10 (ix)
	ld	a, h
	sbc	a, -9 (ix)
	jp	PO, 00236$
	xor	a, #0x80
00236$:
	jp	P, 00107$
;qsolve.c:1080: r = top + i; inv = (r == sel);
	ld	a, -11 (ix)
	add	a, -1 (ix)
	ld	-8 (ix), a
	ld	a, -2 (ix)
	sub	a, -8 (ix)
	ld	a, #0x01
	jr	Z, 00238$
	xor	a, a
00238$:
	ld	-7 (ix), a
;qsolve.c:1081: clrrow(i + 1, inv);
	ld	a, -1 (ix)
	inc	a
	ld	-6 (ix), a
	push	bc
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -6 (ix)
	call	_clrrow
	pop	bc
;qsolve.c:1082: c = 0;
	ld	e, #0x00
;qsolve.c:1083: if (r >= 9) putg(c++, i + 1, '1', inv);
	ld	a, -8 (ix)
	sub	a, #0x09
	ld	a, #0x00
	rla
	ld	d, a
	bit	0, d
	jr	NZ, 00106$
	ld	e, #0x01
	push	bc
	push	de
	ld	h, -7 (ix)
	ld	l, #0x31
	push	hl
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_putg
	pop	de
	pop	bc
00106$:
;qsolve.c:1084: putg(c++, i + 1, '0' + (r < 9 ? r + 1 : r - 9), inv);
	ld	a, -8 (ix)
	inc	d
	dec	d
	jr	Z, 00142$
	inc	a
	jr	00143$
00142$:
	add	a, #0xf7
00143$:
	add	a, #0x30
	ld	d, e
	inc	e
	push	bc
	push	de
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	call	_putg
	pop	de
	pop	bc
;qsolve.c:1085: putg(c++, i + 1, ':', inv);
	ld	d, e
	ld	a, e
	inc	a
	ld	-5 (ix), a
	push	bc
	ld	h, -7 (ix)
	ld	l, #0x3a
	push	hl
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	call	_putg
	pop	bc
;qsolve.c:1086: puts_(c, i + 1, items[r], inv);
	ld	a, -8 (ix)
	ld	d, #0x00
	add	a, a
	rl	d
	add	a, 4 (ix)
	ld	e, a
	ld	a, d
	adc	a, 5 (ix)
	ld	d, a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	a, -7 (ix)
	push	af
	inc	sp
	push	de
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -5 (ix)
	call	_puts_
	pop	bc
;qsolve.c:1079: for (i = 0; i < 9 && top + i < n; i++) {
	inc	-1 (ix)
	jp	00136$
00107$:
;qsolve.c:1088: present();
	call	_present
;qsolve.c:1089: k = key();
	call	_key
;qsolve.c:1090: dg = digit(k);
	ld	-6 (ix), a
	call	_digit
	ld	-5 (ix), a
;qsolve.c:1091: if (k == K_UP) { if (sel) sel--; else sel = n - 1; }
	ld	a, 6 (ix)
	ld	-1 (ix), a
	ld	a, -6 (ix)
	sub	a, #0x04
	jr	NZ, 00127$
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00109$
	dec	-2 (ix)
	jr	00128$
00109$:
	ld	a, -1 (ix)
	dec	a
	ld	-2 (ix), a
	jr	00128$
00127$:
;qsolve.c:1092: else if (k == K_DOWN) { if (sel + 1 < n) sel++; else sel = 0; }
	ld	a, -6 (ix)
	dec	a
	jr	NZ, 00124$
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	a, -8 (ix)
	add	a, #0x01
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -6 (ix)
	sub	a, -10 (ix)
	ld	a, -5 (ix)
	sbc	a, -9 (ix)
	jp	PO, 00244$
	xor	a, #0x80
00244$:
	jp	P, 00112$
	inc	-2 (ix)
	jr	00128$
00112$:
	ld	-2 (ix), #0x00
	jr	00128$
00124$:
;qsolve.c:1093: else if (k == K_ENTER) return sel;
	ld	a, -6 (ix)
	sub	a, #0x09
	jr	NZ, 00121$
	ld	a, -2 (ix)
	jr	00140$
00121$:
;qsolve.c:1094: else if (k == K_CLEAR) return 255;
	ld	a, -6 (ix)
	sub	a, #0x0f
	jr	NZ, 00118$
	ld	a, #0xff
	jr	00140$
00118$:
;qsolve.c:1095: else if (dg >= 1 && dg <= (signed char)n) return dg - 1;
	ld	a, -5 (ix)
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00128$
	ld	a, -1 (ix)
	sub	a, -5 (ix)
	jp	PO, 00249$
	xor	a, #0x80
00249$:
	jp	M, 00128$
	ld	a, -5 (ix)
	dec	a
	jr	00140$
00128$:
;qsolve.c:1096: if (sel < top) top = sel;
	ld	a, -2 (ix)
	sub	a, -11 (ix)
	jr	NC, 00130$
	ld	a, -2 (ix)
	ld	-11 (ix), a
00130$:
;qsolve.c:1097: if (sel >= top + 9) top = sel - 8;
	ld	a, -11 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	add	a, #0x09
	ld	-8 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	sub	a, -8 (ix)
	ld	a, -5 (ix)
	sbc	a, -7 (ix)
	jp	PO, 00250$
	xor	a, #0x80
00250$:
	jp	M, 00138$
	ld	a, -2 (ix)
	add	a, #0xf8
	ld	-11 (ix), a
	jp	00138$
00140$:
;qsolve.c:1099: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	inc	sp
	jp	(hl)
;qsolve.c:1101: static U8 viewer(void)       /* 1 = back to form, 0 = menu */
;	---------------------------------
; Function viewer
; ---------------------------------
_viewer:
	call	___sdcc_enter_ix
	push	af
	push	af
;qsolve.c:1103: U8 top = 0, i, k;
	ld	c, #0x00
00124$:
;qsolve.c:1105: cls();
	push	bc
	call	_cls
	pop	bc
;qsolve.c:1106: for (i = 0; i < 9 && top + i < nlines; i++) puts_(0, i, LINE(top + i), 0);
	ld	b, #0x00
00122$:
	ld	-4 (ix), c
	ld	-3 (ix), #0x00
	ld	a,b
	cp	a,#0x09
	jr	NC, 00101$
	ld	d, #0x00
	add	a, -4 (ix)
	ld	e, a
	ld	a, d
	adc	a, -3 (ix)
	ld	d, a
	ld	hl, #_nlines
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00189$
	xor	a, #0x80
00189$:
	jp	P, 00101$
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #0x86ec
	add	hl, de
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
	pop	bc
	inc	b
	jr	00122$
00101$:
;qsolve.c:1107: clrrow(9, 1);
	push	bc
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_clrrow
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #___str_92
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
	pop	bc
;qsolve.c:1109: if (top) putg(23, 9, '^', 1);
	ld	a, c
	or	a, a
	jr	Z, 00103$
	push	bc
	ld	hl, #0x15e
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x17
	call	_putg
	pop	bc
00103$:
;qsolve.c:1110: if (top + 9 < nlines) putg(22, 9, 'v', 1);
	ld	a, -4 (ix)
	add	a, #0x09
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	hl, #_nlines
	ld	b, (hl)
	ld	e, #0x00
	ld	a, -2 (ix)
	sub	a, b
	ld	a, -1 (ix)
	sbc	a, e
	jp	PO, 00190$
	xor	a, #0x80
00190$:
	jp	P, 00105$
	push	bc
	ld	hl, #0x176
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x16
	call	_putg
	pop	bc
00105$:
;qsolve.c:1111: present();
	push	bc
	call	_present
	call	_key
	pop	bc
;qsolve.c:1113: if (k == K_UP && top) top--;
	ld	b, a
	sub	a,#0x04
	jr	NZ, 00116$
	or	a,c
	jr	Z, 00116$
	dec	c
	jp	00124$
00116$:
;qsolve.c:1114: else if (k == K_DOWN && top + 9 < nlines) top++;
	ld	a, b
	dec	a
	jr	NZ, 00112$
	ld	hl, #_nlines
	ld	e, (hl)
	ld	d, #0x00
	ld	a, -2 (ix)
	sub	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jp	PO, 00195$
	xor	a, #0x80
00195$:
	jp	P, 00112$
	inc	c
	jp	00124$
00112$:
;qsolve.c:1115: else if (k == K_ENTER) return 1;
	ld	a, b
	sub	a, #0x09
	jr	NZ, 00109$
	ld	a, #0x01
	jr	00126$
00109$:
;qsolve.c:1116: else if (k == K_CLEAR) return 0;
	ld	a, b
	sub	a, #0x0f
	jp	NZ,00124$
	xor	a, a
00126$:
;qsolve.c:1118: }
	ld	sp, ix
	pop	ix
	ret
___str_92:
	.ascii "ENTER:edit CLEAR:menu"
	.db 0x00
;qsolve.c:1120: static void notice(const char *m)
;	---------------------------------
; Function notice
; ---------------------------------
_notice:
;qsolve.c:1122: clrrow(9, 1);
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_clrrow
	pop	hl
;qsolve.c:1123: puts_(0, 9, m, 1);
	ld	a, #0x01
	push	af
	inc	sp
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
;qsolve.c:1124: present();
	call	_present
;qsolve.c:1125: key();
;qsolve.c:1126: }
	jp	_key
;qsolve.c:1128: static void strcpy_(char *d, const char *s)
;	---------------------------------
; Function strcpy_
; ---------------------------------
_strcpy_:
;qsolve.c:1130: while ((*d++ = *s++)) ;
00101$:
	ld	a, (de)
	inc	de
	ld	(hl), a
	inc	hl
	or	a, a
	jr	NZ, 00101$
;qsolve.c:1131: }
	ret
;qsolve.c:1133: static void run(U8 ti)
;	---------------------------------
; Function run
; ---------------------------------
_run:
	call	___sdcc_enter_ix
	ld	hl, #-25
	add	hl, sp
	ld	sp, hl
	ld	e, a
;qsolve.c:1135: const Tool *t = &T[ti];
	ld	bc, #_T+0
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	-23 (ix), l
	ld	-22 (ix), h
;qsolve.c:1136: U8 nf = t->nf, f = 0, i, k, len, j, num;
	pop	hl
	pop	bc
	push	bc
	push	hl
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-21 (ix), a
	ld	-1 (ix), #0x00
;qsolve.c:1139: for (i = 0; i < nf; i++) { strcpy_(fb[i], t->def[i]); fresh[i] = 1; }
	ld	a, -23 (ix)
	ld	-8 (ix), a
	ld	a, -22 (ix)
	ld	-7 (ix), a
	ld	-2 (ix), #0x00
00165$:
	ld	a, -2 (ix)
	sub	a, -21 (ix)
	jr	NC, 00204$
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #_fb
	add	hl, bc
	call	_strcpy_
	ld	a, #<(_fresh)
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_fresh)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x01
	inc	-2 (ix)
	jr	00165$
00204$:
	ld	a, -23 (ix)
	ld	-20 (ix), a
	ld	a, -22 (ix)
	ld	-19 (ix), a
	ld	a, -23 (ix)
	ld	-18 (ix), a
	ld	a, -22 (ix)
	ld	-17 (ix), a
	ld	a, -23 (ix)
	ld	-16 (ix), a
	ld	a, -22 (ix)
	ld	-15 (ix), a
00176$:
;qsolve.c:1141: cls();
	call	_cls
;qsolve.c:1142: title(t->title);
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_title
;qsolve.c:1143: for (i = 0; i < nf; i++) {
	ld	-2 (ix), #0x00
00168$:
	ld	a, -2 (ix)
	sub	a, -21 (ix)
	jr	NC, 00102$
;qsolve.c:1144: puts_(0, i + 1, t->lab[i], i == f);
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	ld	a, #0x01
	jr	Z, 00405$
	xor	a, a
00405$:
	ld	-5 (ix), a
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	c, -2 (ix)
	inc	c
	push	bc
	ld	a, -5 (ix)
	push	af
	inc	sp
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
	pop	bc
;qsolve.c:1145: puts_(12, i + 1, fb[i], 0);
	ld	e, -2 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_fb
	add	hl, de
	xor	a, a
	push	af
	inc	sp
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_puts_
;qsolve.c:1143: for (i = 0; i < nf; i++) {
	inc	-2 (ix)
	jr	00168$
00102$:
;qsolve.c:1147: putg(12 + strlen_(fb[f]), f + 1, '_', 0);
	ld	b, -1 (ix)
	inc	b
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_fb
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	call	_strlen_
	pop	de
	pop	bc
	add	a, #0x0c
	ld	c, a
	push	de
	ld	hl, #0x5f
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_putg
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_93
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
	call	_present
	call	_key
	pop	de
	ld	-14 (ix), a
;qsolve.c:1151: b = fb[f];
;qsolve.c:1152: len = strlen_(b);
;	spillPairReg hl
;	spillPairReg hl
	ld	-13 (ix), e
	ld	-12 (ix), d
	ex	de,hl
;	spillPairReg hl
;	spillPairReg hl
	call	_strlen_
	ld	-11 (ix), a
;qsolve.c:1153: dg = digit(k);
	ld	a, -14 (ix)
	call	_digit
;qsolve.c:1154: num = dg >= 0 || k == K_DOT || k == K_DIV;
	ld	-10 (ix), a
	rlca
	and	a,#0x01
	ld	-9 (ix), a
	ld	a, -14 (ix)
	sub	a, #0x19
	ld	a, #0x01
	jr	Z, 00407$
	xor	a, a
00407$:
	ld	-8 (ix), a
	bit	0, -9 (ix)
	jr	Z, 00180$
	bit	0, -8 (ix)
	jr	NZ, 00180$
	ld	a, -14 (ix)
	sub	a, #0x0d
	jr	Z, 00180$
	xor	a, a
	jr	00181$
00180$:
	ld	a, #0x01
00181$:
	ld	-7 (ix), a
;qsolve.c:1155: if (k == K_CLEAR) {
	ld	a, -14 (ix)
	sub	a, #0x0f
	jr	NZ, 00160$
;qsolve.c:1156: if (len) { b[0] = 0; fresh[f] = 0; } else return;
	ld	a, -11 (ix)
	or	a, a
	jp	Z,00177$
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x00
	ld	a, #<(_fresh)
	add	a, -1 (ix)
	ld	c, a
	ld	a, #>(_fresh)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
	jp	00176$
00160$:
;qsolve.c:1157: } else if (k == K_UP) { if (f) f--; }
	ld	a, -14 (ix)
	sub	a, #0x04
	jr	NZ, 00157$
	ld	a, -1 (ix)
	or	a, a
	jp	Z, 00176$
	dec	-1 (ix)
	jp	00176$
00157$:
;qsolve.c:1158: else if (k == K_DOWN) { if (f + 1 < nf) f++; }
	ld	a, -1 (ix)
	ld	-25 (ix), a
	ld	-24 (ix), #0x00
	ld	a, -21 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -1 (ix)
	inc	a
	ld	-4 (ix), a
	ld	a, -25 (ix)
	add	a, #0x01
	ld	-3 (ix), a
	ld	a, -24 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	a, -3 (ix)
	sub	a, -6 (ix)
	ld	a, -2 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00413$
	xor	a, #0x80
00413$:
	rlca
	and	a,#0x01
	ld	-2 (ix), a
	ld	a, -14 (ix)
	dec	a
	jr	NZ, 00154$
	ld	a, -2 (ix)
	or	a, a
	jp	Z, 00176$
	ld	a, -4 (ix)
	ld	-1 (ix), a
	jp	00176$
00154$:
;qsolve.c:1159: else if (k == K_DEL) { if (len) b[len - 1] = 0; fresh[f] = 0; }
	ld	a, -14 (ix)
	sub	a, #0x38
	jr	NZ, 00151$
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00111$
	ld	a, -11 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	a, -3 (ix)
	add	a, #0xff
	ld	-5 (ix), a
	ld	a, -2 (ix)
	adc	a, #0xff
	ld	-4 (ix), a
	ld	a, -13 (ix)
	add	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -12 (ix)
	adc	a, -4 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x00
00111$:
	ld	a, #<(_fresh)
	add	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, #>(_fresh)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x00
	jp	00176$
00151$:
;qsolve.c:1160: else if (num || k == K_CHS || k == K_SUB) {
	ld	a, -7 (ix)
	or	a, a
	jr	NZ, 00145$
	ld	a, -14 (ix)
	sub	a, #0x11
	jr	Z, 00145$
	ld	a, -14 (ix)
	sub	a, #0x0b
	jp	NZ,00146$
00145$:
;qsolve.c:1161: if (fresh[f] && num) { b[0] = 0; len = 0; }
	ld	a, #<(_fresh)
	add	a, -1 (ix)
	ld	c, a
	ld	a, #>(_fresh)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	Z, 00113$
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00113$
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x00
	ld	-11 (ix), #0x00
00113$:
;qsolve.c:1162: fresh[f] = 0;
	xor	a, a
	ld	(bc), a
;qsolve.c:1164: if (len < 11) {
	ld	a, -11 (ix)
	sub	a, #0x0b
	ld	a, #0x00
	rla
	ld	-2 (ix), a
;qsolve.c:1163: if (num) {
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00124$
;qsolve.c:1164: if (len < 11) {
	ld	a, -2 (ix)
	or	a, a
	jp	Z, 00176$
;qsolve.c:1165: b[len] = dg >= 0 ? '0' + dg : k == K_DOT ? '.' : '/';
	ld	a, -13 (ix)
	add	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	bit	0, -9 (ix)
	jr	NZ, 00185$
	ld	a, -10 (ix)
	add	a, #0x30
	ld	-4 (ix), a
	ld	-5 (ix), a
	rlca
	sbc	a, a
	ld	-4 (ix), a
	jr	00186$
00185$:
	ld	a, -8 (ix)
	ld	-4 (ix), a
	or	a, a
	jr	Z, 00187$
	ld	-5 (ix), #0x2e
	ld	-4 (ix), #0
	jr	00188$
00187$:
	ld	-5 (ix), #0x2f
	ld	-4 (ix), #0
00188$:
00186$:
	ld	a, -5 (ix)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), a
;qsolve.c:1166: b[len + 1] = 0;
	ld	c, -11 (ix)
	ld	b, #0x00
	inc	bc
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	add	hl, bc
	ld	(hl), #0x00
	jp	00176$
00124$:
;qsolve.c:1168: } else if (b[0] == '-') strcpy_(b, b + 1);   /* toggle leading minus */
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, (hl)
	sub	a, #0x2d
	jr	NZ, 00121$
	ld	e, -13 (ix)
	ld	d, -12 (ix)
	inc	de
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_strcpy_
	jp	00176$
00121$:
;qsolve.c:1169: else if (len < 11) {
	ld	a, -2 (ix)
	or	a, a
	jp	Z, 00176$
;qsolve.c:1170: for (j = len + 1; j; j--) b[j] = b[j - 1];
	ld	a, -11 (ix)
	inc	a
	ld	-2 (ix), a
00171$:
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00117$
	ld	a, -13 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	b, a
	ld	e, -2 (ix)
	ld	d, #0x00
	dec	de
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	dec	-2 (ix)
	jr	00171$
00117$:
;qsolve.c:1171: b[0] = '-';
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x2d
	jp	00176$
00146$:
;qsolve.c:1173: } else if (k == K_ENTER && f + 1 < nf) f++;
	ld	a, -14 (ix)
	sub	a, #0x09
	ld	a, #0x01
	jr	Z, 00424$
	xor	a, a
00424$:
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00142$
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00142$
	ld	a, -4 (ix)
	ld	-1 (ix), a
	jp	00176$
00142$:
;qsolve.c:1174: else if (k == K_GRAPH || k == K_ENTER) {
	ld	a, -14 (ix)
	sub	a, #0x31
	jr	Z, 00138$
	ld	a, -3 (ix)
	or	a, a
	jp	Z, 00176$
00138$:
;qsolve.c:1175: err = 0;
	ld	hl, #_err
	ld	(hl), #0x00
;qsolve.c:1176: for (i = 0; i < nf; i++) {
	ld	-2 (ix), #0x00
00174$:
	ld	a, -2 (ix)
	sub	a, -21 (ix)
	ld	a, #0x00
	rla
	ld	-8 (ix), a
	or	a, a
	jp	Z, 00129$
;qsolve.c:1177: have[i] = fb[i][0] != 0;
	ld	a, #<(_have)
	add	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, #>(_have)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	a, #<(_fb)
	add	a, -10 (ix)
	ld	-5 (ix), a
	ld	a, #>(_fb)
	adc	a, -9 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	-3 (ix), a
	xor	a, #0x01
	ld	-3 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), a
;qsolve.c:1178: qint(i, 0);
	ld	de, #0x0000
	ld	a, -2 (ix)
	call	_qint
;qsolve.c:1179: if (have[i] && parse(fb[i], i)) break;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00175$
	ld	a, -5 (ix)
	ld	-10 (ix), a
	ld	a, -4 (ix)
	ld	-9 (ix), a
	ld	a, -2 (ix)
	push	af
	inc	sp
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_parse
	or	a, a
	jr	NZ, 00129$
00175$:
;qsolve.c:1176: for (i = 0; i < nf; i++) {
	inc	-2 (ix)
	jp	00174$
00129$:
;qsolve.c:1181: if (i < nf) {
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00131$
;qsolve.c:1182: f = i;
	ld	a, -2 (ix)
	ld	-1 (ix), a
;qsolve.c:1183: notice(err == 2 ? "DIVIDE BY ZERO" : err ? "NUMBER TOO LARGE" : "BAD NUMBER");
	ld	hl, #_err
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00189$
	ld	de, #___str_94
	jr	00190$
00189$:
	ld	hl, #_err
	ld	a, (hl)
	or	a, a
	jr	Z, 00191$
	ld	de, #___str_95
	jr	00192$
00191$:
	ld	de, #___str_96
00192$:
00190$:
	ex	de, hl
	call	_notice
;qsolve.c:1184: continue;
	jp	00176$
00131$:
;qsolve.c:1186: lreset();
	call	_lreset
;qsolve.c:1187: t->fn(t->mode);
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	de, #0x0007
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	bc, #0x0009
	add	hl, bc
	ld	a, (hl)
	ex	de, hl
	call	___sdcc_call_hl
;qsolve.c:1188: if (err) {
	ld	a, (#_err)
	or	a, a
	jr	Z, 00133$
;qsolve.c:1189: lreset();
	call	_lreset
;qsolve.c:1190: pl("ERROR:");
	ld	hl, #___str_97
	call	_pl
;qsolve.c:1191: pl(err == 2 ? "DIVIDE BY ZERO" : "NUMBER TOO LARGE");
	ld	a, (#_err)
	sub	a, #0x02
	jr	NZ, 00193$
	ld	hl, #___str_94
	jr	00194$
00193$:
	ld	hl, #___str_95
00194$:
	call	_pl
00133$:
;qsolve.c:1193: if (col) nl();
	ld	a, (#_col)
	or	a, a
	jr	Z, 00135$
	call	_nl
00135$:
;qsolve.c:1194: if (!viewer()) return;
	call	_viewer
	or	a, a
	jp	NZ, 00176$
00177$:
;qsolve.c:1197: }
	ld	sp, ix
	pop	ix
	ret
___str_93:
	.ascii "ENTER:next GRAPH:solve"
	.db 0x00
___str_94:
	.ascii "DIVIDE BY ZERO"
	.db 0x00
___str_95:
	.ascii "NUMBER TOO LARGE"
	.db 0x00
___str_96:
	.ascii "BAD NUMBER"
	.db 0x00
___str_97:
	.ascii "ERROR:"
	.db 0x00
;qsolve.c:1212: void app_main(void)
;	---------------------------------
; Function app_main
; ---------------------------------
_app_main::
00104$:
;qsolve.c:1216: s = menu("QUAD SOLVER 1", mainmenu1, 7);
	ld	a, #0x07
	push	af
	inc	sp
	ld	hl, #_mainmenu1
	push	hl
	ld	hl, #___str_98
	call	_menu
;qsolve.c:1217: if (s == 255) return;
	cp	a, #0xff
	ret	Z
	jr	00102$
00102$:
;qsolve.c:1218: run(s < 6 ? s : 9);
	cp	a, #0x06
	jr	NC, 00108$
	ld	c, a
	jr	00109$
00108$:
	ld	bc, #0x0009
00109$:
	ld	a, c
	call	_run
;qsolve.c:1220: }
	jr	00104$
_mainmenu:
	.dw __str_99
	.dw __str_100
	.dw __str_101
	.dw __str_102
	.dw __str_103
	.dw __str_104
	.dw __str_105
	.dw __str_106
	.dw __str_107
	.dw __str_108
	.dw __str_109
	.dw __str_110
	.dw __str_111
_formmenu:
	.dw __str_112
	.dw __str_113
	.dw __str_114
_cxmenu:
	.dw __str_115
	.dw __str_116
	.dw __str_117
	.dw __str_118
	.dw __str_119
	.dw __str_120
	.dw __str_121
_mainmenu1:
	.dw __str_99
	.dw __str_100
	.dw __str_101
	.dw __str_102
	.dw __str_103
	.dw __str_104
	.dw __str_106
___str_98:
	.ascii "QUAD SOLVER 1"
	.db 0x00
__str_99:
	.ascii "Vertex+Point>Parabola"
	.db 0x00
__str_100:
	.ascii "Transformations"
	.db 0x00
__str_101:
	.ascii "Solve by Factoring"
	.db 0x00
__str_102:
	.ascii "Solve by Sq Roots"
	.db 0x00
__str_103:
	.ascii "Standard>Vertex Form"
	.db 0x00
__str_104:
	.ascii "Quadratic Formula"
	.db 0x00
__str_105:
	.ascii "Parabola Features"
	.db 0x00
__str_106:
	.ascii "Factor Quadratic"
	.db 0x00
__str_107:
	.ascii "Find Zeros"
	.db 0x00
__str_108:
	.ascii "Complex Numbers"
	.db 0x00
__str_109:
	.ascii "Discriminant"
	.db 0x00
__str_110:
	.ascii "Find b: 1 Solution"
	.db 0x00
__str_111:
	.ascii "Projectile Maximum"
	.db 0x00
__str_112:
	.ascii "ax|+bx+c"
	.db 0x00
__str_113:
	.ascii "a(x-h)|+k"
	.db 0x00
__str_114:
	.ascii "a(x-p)(x-q)"
	.db 0x00
__str_115:
	.ascii "z1 + z2"
	.db 0x00
__str_116:
	.ascii "z1 - z2"
	.db 0x00
__str_117:
	.ascii "z1 * z2"
	.db 0x00
__str_118:
	.ascii "z1 / z2"
	.db 0x00
__str_119:
	.ascii "Conjugate"
	.db 0x00
__str_120:
	.ascii "i^n"
	.db 0x00
__str_121:
	.ascii "Simplify sqrt(n)"
	.db 0x00
;diag.c:4: static void stage(U8 n, const char *s){ cls(); title("DIAG"); puts_(0,2,s,0); putg(0,4,'0'+n,0); puts_(2,4,"press a key",0); present(); key(); }
;	---------------------------------
; Function stage
; ---------------------------------
_stage:
	call	___sdcc_enter_ix
	dec	sp
	ld	-1 (ix), a
	push	de
	call	_cls
	ld	hl, #___str_122
	call	_title
	pop	de
	xor	a, a
	push	af
	inc	sp
	push	de
	ld	l, #0x02
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
	ld	a, -1 (ix)
	add	a, #0x30
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_putg
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_123
	push	hl
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_puts_
	call	_present
	call	_key
	inc	sp
	pop	ix
	ret
___str_122:
	.ascii "DIAG"
	.db 0x00
___str_123:
	.ascii "press a key"
	.db 0x00
;diag.c:5: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;diag.c:6: stage(1,"S1 basic draw ok");
	ld	de, #___str_124
	ld	a, #0x01
	call	_stage
;diag.c:7: qint(I0,7); qint(I1,3); ADD(T0,I0,I1); lreset(); pq(T0); nl(); stage(2,LINE(0));          /* data + line buffers + qop */
	ld	de, #0x0007
	xor	a, a
	call	_qint
	ld	de, #0x0003
	ld	a, #0x01
	call	_qint
	ld	hl, #0x0801
	call	_qop
	call	_lreset
	ld	a, #0x08
	call	_pq
	call	_nl
	ld	de, #0x86ec
	ld	a, #0x02
	call	_stage
;diag.c:8: lreset(); toint(I0,I1,I0,1); pn(disc(3,4,-5)); nl(); stage(3,LINE(0));                  /* long math libs */
	call	_lreset
	ld	hl, #0x100
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_toint
	ld	hl, #0xfffb
	push	hl
	ld	de, #0x0004
	ld	hl, #0x0003
	call	_disc
	pop	af
	call	_pn
	call	_nl
	ld	de, #0x86ec
	ld	a, #0x03
	call	_stage
;diag.c:9: lreset(); ps("x|+{}"); nl(); stage(4,LINE(0));
	call	_lreset
	ld	hl, #___str_125
	call	_ps
	call	_nl
	ld	de, #0x86ec
	ld	a, #0x04
	call	_stage
;diag.c:10: app_main();
;diag.c:11: }
	jp	_app_main
___str_124:
	.ascii "S1 basic draw ok"
	.db 0x00
___str_125:
	.ascii "x|+{}"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
