;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module qsolve
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
_items:
	.ds 46
_idx:
	.ds 23
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
;qsolve.c:101: static void present(void) __naked
;	---------------------------------
; Function present
; ---------------------------------
_present:
;qsolve.c:110: __endasm;
	push	ix
	ld	iy,#0x89F0
	call	#0x4092
	ld	iy,#0x89F0
	pop	ix
	ret
;qsolve.c:111: }
;qsolve.c:113: static U8 getcsc(void) __naked
;	---------------------------------
; Function getcsc
; ---------------------------------
_getcsc:
;qsolve.c:125: __endasm;
	push	ix
	ei
	halt
	ld	iy,#0x89F0
	rst	#0x28
	.dw	#0x4018
	pop	ix
	ld	l,a
	ret
;qsolve.c:126: }
;qsolve.c:149: static U8 key(void)
;	---------------------------------
; Function key
; ---------------------------------
_key:
;qsolve.c:152: do k = getcsc(); while (!k);
00101$:
	call	_getcsc
;qsolve.c:153: return k;
	or	a,a
	jr	Z, 00101$
;qsolve.c:154: }
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
;qsolve.c:156: static void putg(U8 c, U8 r, U8 ch, U8 inv)
;	---------------------------------
; Function putg
; ---------------------------------
_putg:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-3 (ix), a
	ld	e, l
;qsolve.c:160: if (ch < 32 || ch > 126) ch = 32;
	ld	a, 4 (ix)
	sub	a, #0x20
	jr	C, 00101$
	ld	a, #0x7e
	sub	a, 4 (ix)
	jr	NC, 00102$
00101$:
	ld	4 (ix), #0x20
00102$:
;qsolve.c:161: g = font + (unsigned)(ch - 32) * 5;
	ld	a, 4 (ix)
	ld	b, #0x00
	add	a, #0xe0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #_font
	add	hl, bc
	ld	c, l
	ld	b, h
;qsolve.c:162: p = GBUF + (unsigned)r * 72 + (c >> 1);
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
	ld	a, -3 (ix)
	srl	a
	add	a, l
	ld	e, a
	ld	a, #0x00
	adc	a, h
	ld	d, a
;qsolve.c:163: for (i = 0; i < 6; i++) {
	ld	a, -3 (ix)
	and	a, #0x01
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	ld	-2 (ix), #0x00
00110$:
;qsolve.c:164: n = i < 5 ? (U8)(g[i] << 1) : 0;
	ld	a, -2 (ix)
	sub	a, #0x05
	jr	NC, 00114$
	ld	l, -2 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	add	a, a
;	spillPairReg hl
;	spillPairReg hl
	jr	00115$
00114$:
	xor	a, a
;	spillPairReg hl
;	spillPairReg hl
00115$:
	ld	-1 (ix), a
;qsolve.c:165: if (inv) n ^= 15;
	ld	a, 5 (ix)
	or	a, a
	jr	Z, 00105$
	ld	a, -1 (ix)
	xor	a, #0x0f
	ld	-1 (ix), a
00105$:
;qsolve.c:166: if (c & 1) *p = (*p & 0xF0) | n; else *p = (*p & 0x0F) | (U8)(n << 4);
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -4 (ix)
	or	a, -5 (ix)
	jr	Z, 00107$
	ld	a, l
	and	a, #0xf0
	or	a, -1 (ix)
	ld	(de), a
	jr	00108$
00107$:
	ld	a, l
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, l
	ld	(de), a
00108$:
;qsolve.c:167: p += 12;
	ld	hl, #0x000c
	add	hl, de
	ex	de, hl
;qsolve.c:163: for (i = 0; i < 6; i++) {
	inc	-2 (ix)
	ld	a, -2 (ix)
	sub	a, #0x06
	jr	C, 00110$
;qsolve.c:169: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;qsolve.c:171: static void puts_(U8 c, U8 r, const char *s, U8 inv)
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
;qsolve.c:173: while (*s && c < LW) putg(c++, r, *s++, inv);
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
;qsolve.c:174: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;qsolve.c:176: static void clrrow(U8 r, U8 inv)
;	---------------------------------
; Function clrrow
; ---------------------------------
_clrrow:
	ld	c, a
	ld	b, l
;qsolve.c:179: for (c = 0; c < LW; c++) putg(c, r, ' ', inv);
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
;qsolve.c:180: }
	ret
;qsolve.c:182: static void cls(void)
;	---------------------------------
; Function cls
; ---------------------------------
_cls:
;qsolve.c:185: for (r = 0; r < 10; r++) clrrow(r, 0);
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
;qsolve.c:186: }
	ret
;qsolve.c:191: static I ck(L x)
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
;qsolve.c:193: if (x != (I)x) { err = 1; return 0; }
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
;qsolve.c:194: return (I)x;
	ld	e, c
	ld	d, b
00103$:
;qsolve.c:195: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:196: static I mi(I a, I b) { return ck((L)a * b); }
;	---------------------------------
; Function mi
; ---------------------------------
_mi:
	call	___mulsint2slong
	jp	_ck
;qsolve.c:197: static I iabs(I a) { return a < 0 ? -a : a; }
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
;qsolve.c:198: static I gcd(I a, I b)
;	---------------------------------
; Function gcd
; ---------------------------------
_gcd:
;qsolve.c:201: a = iabs(a); b = iabs(b);
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
;qsolve.c:202: while (b) { t = a % b; a = b; b = t; }
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
;qsolve.c:203: return a;
	ex	de, hl
;qsolve.c:204: }
	ret
;qsolve.c:205: static I lcm(I a, I b) { return mi(a / gcd(a, b), b); }
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
;qsolve.c:207: static void qn(Q *r, I n, I d)
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
;qsolve.c:210: if (d == 0) { err = 2; r->n = 0; r->d = 1; return; }
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
;qsolve.c:211: if (d < 0) { n = -n; d = -d; }
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
;qsolve.c:212: g = gcd(n, d);
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
;qsolve.c:213: if (g > 1) { n /= g; d /= g; }
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
;qsolve.c:214: r->n = n; r->d = d;
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
;qsolve.c:215: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;qsolve.c:230: static void qop(unsigned x)
;	---------------------------------
; Function qop
; ---------------------------------
_qop:
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
	ex	de, hl
;qsolve.c:232: Q *r = &R[(x >> 8) & 15], *a = &R[(x >> 4) & 15], *b = &R[x & 15];
	ld	a, d
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_R
	add	hl, bc
	ex	(sp), hl
	ld	c, e
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	b, #0x04
00151$:
	srl	l
	rr	c
	djnz	00151$
	ld	a, c
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_R
	add	hl, bc
	ld	a, e
	and	a, #0x0f
	ld	b, #0x00
	add	a, a
	rl	b
	add	a, a
	rl	b
	add	a, #<(_R)
	ld	c, a
	ld	a, b
	adc	a, #>(_R)
	ld	b, a
;qsolve.c:233: I g, g2, an = a->n, ad = a->d, bn = b->n, bd = b->d;
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	a, (bc)
	ld	-2 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-1 (ix), a
	dec	bc
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;qsolve.c:234: switch (x >> 12) {
	ld	a, d
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
;qsolve.c:241: if (bn == 0) { err = 2; r->n = 0; r->d = 1; return; }
	ld	a, -12 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;qsolve.c:234: switch (x >> 12) {
	push	de
	ld	d, #0x00
	ld	hl, #00153$
	add	hl, de
	add	hl, de
	add	hl, de
	pop	de
	jp	(hl)
00153$:
	jp	00102$
	jp	00102$
	jp	00110$
	jp	00105$
	jp	00115$
	jp	00116$
	jp	00117$
;qsolve.c:235: case 0: case 1:
00102$:
;qsolve.c:236: if (x >> 12) bn = -bn;
	ld	a, d
	or	a, e
	jr	Z, 00104$
	xor	a, a
	sub	a, -2 (ix)
	ld	-2 (ix), a
	sbc	a, a
	sub	a, -1 (ix)
	ld	-1 (ix), a
00104$:
;qsolve.c:237: g = gcd(ad, bd);
	push	bc
	ld	e, c
	ld	d, b
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_gcd
	pop	bc
	ex	de, hl
;qsolve.c:238: qn(r, ck((L)mi(an, bd / g) + mi(bn, ad / g)), mi(ad / g, bd));
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
	ld	-6 (ix), e
	ld	-5 (ix), d
	pop	bc
	push	bc
	ld	e, c
	ld	d, b
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ld	-4 (ix), e
	ld	-3 (ix), d
	pop	bc
	pop	hl
	ex	de, hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
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
	ld	-10 (ix), e
	ld	a, d
	ld	-9 (ix), a
	rlca
	sbc	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ld	a, d
	rlca
	sbc	hl, hl
	ld	a, e
	add	a, -10 (ix)
	ld	e, a
	ld	a, d
	adc	a, -9 (ix)
	ld	d, a
	ld	a, l
	adc	a, -8 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -7 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	call	_ck
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
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
;qsolve.c:239: break;
	jp	00119$
;qsolve.c:240: case 3:
00105$:
;qsolve.c:241: if (bn == 0) { err = 2; r->n = 0; r->d = 1; return; }
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	NZ, 00107$
	ld	hl, #_err
	ld	(hl), #0x02
	pop	hl
	push	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	jp	00119$
00107$:
;qsolve.c:242: g = bd; bd = bn; bn = g;
	ld	e, c
	ld	d, b
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	-2 (ix), e
	ld	-1 (ix), d
;qsolve.c:243: if (bd < 0) { bd = -bd; bn = -bn; }
	bit	7, b
	jr	Z, 00110$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	xor	a, a
	sub	a, e
	ld	e, a
	sbc	a, a
	sub	a, d
	ld	-2 (ix), e
	ld	-1 (ix), a
;qsolve.c:245: case 2:
00110$:
;qsolve.c:246: g = gcd(an, bd); g2 = gcd(bn, ad);
	push	bc
	ld	e, c
	ld	d, b
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_gcd
	pop	bc
	ld	-6 (ix), e
	ld	-5 (ix), d
	push	bc
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_gcd
	pop	bc
	ex	de, hl
;qsolve.c:247: if (!g) g = 1;
	ld	a, -5 (ix)
	or	a, -6 (ix)
	jr	NZ, 00112$
	ld	-6 (ix), #0x01
	ld	-5 (ix), #0
00112$:
;qsolve.c:248: if (!g2) g2 = 1;
	ld	a, h
	or	a, l
	jr	NZ, 00114$
	ld	hl, #0x0001
00114$:
;qsolve.c:249: qn(r, mi(an / g, bn / g2), mi(ad / g2, bd / g));
	push	hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	-4 (ix), e
	ld	-3 (ix), d
	pop	hl
	ex	de, hl
	push	de
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	c, e
	ld	b, d
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_mi
	ld	-4 (ix), e
	ld	-3 (ix), d
	pop	hl
	ex	de, hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	push	de
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ex	de, hl
	pop	de
	call	_mi
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
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
;qsolve.c:250: break;
	jr	00119$
;qsolve.c:251: case 4: r->n = -an; r->d = ad; break;
00115$:
	xor	a, a
	sub	a, -10 (ix)
	ld	c, a
	sbc	a, a
	sub	a, -9 (ix)
	ld	b, a
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
	jr	00119$
;qsolve.c:252: case 5: r->n = an; r->d = ad; break;
00116$:
	pop	hl
	push	hl
	ld	a, -10 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -9 (ix)
	ld	(hl), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
	jr	00119$
;qsolve.c:253: case 6: r->n = iabs(an); r->d = ad; break;
00117$:
	pop	de
	pop	hl
	push	hl
	push	de
	call	_iabs
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;qsolve.c:254: }
00119$:
;qsolve.c:255: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:256: static void qint(U8 r, I n) { R[r].n = n; R[r].d = 1; }
;	---------------------------------
; Function qint
; ---------------------------------
_qint:
	ld	c, a
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
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
	inc	sp
	inc	sp
	push	de
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	call	___mulsint2slong
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	hl, #8
	add	hl, sp
	ld	bc, #4
	ldir
;qsolve.c:263: if (p > 0x1FFFFFFFL || p < -0x1FFFFFFFL) { err = 1; return 0; }
	ld	a, #0xff
	cp	a, -14 (ix)
	sbc	a, -13 (ix)
	ld	a, #0xff
	sbc	a, -12 (ix)
	ld	a, #0x1f
	sbc	a, -11 (ix)
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	M, 00101$
	ld	a, -14 (ix)
	sub	a, #0x01
	ld	a, -13 (ix)
	sbc	a, #0x00
	ld	a, -12 (ix)
	sbc	a, #0x00
	ld	a, -11 (ix)
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
	pop	de
	push	de
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	b, #0x02
00125$:
	ex	de, hl
	add	hl, hl
	ex	de, hl
	adc	hl, hl
	djnz	00125$
	ld	a, -10 (ix)
	sub	a, e
	ld	c, a
	ld	a, -9 (ix)
	sbc	a, d
	ld	b, a
	ld	a, -8 (ix)
	sbc	a, l
	ld	e, a
	ld	a, -7 (ix)
	sbc	a, h
	ld	-6 (ix), c
	ld	-5 (ix), b
	ld	-4 (ix), e
	ld	-3 (ix), a
;qsolve.c:265: if (p < 0 && D < q) err = 1;
	bit	7, -11 (ix)
	jr	Z, 00105$
	ld	a, -6 (ix)
	sub	a, -10 (ix)
	ld	a, -5 (ix)
	sbc	a, -9 (ix)
	ld	a, -4 (ix)
	sbc	a, -8 (ix)
	ld	a, -3 (ix)
	sbc	a, -7 (ix)
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
;qsolve.c:271: static UL isqrt(UL n)
;	---------------------------------
; Function isqrt
; ---------------------------------
_isqrt:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-20
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
;qsolve.c:273: UL x = n, r = 0, bit = 1UL << 30;
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
;qsolve.c:274: while (bit > x) bit >>= 2;
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
;qsolve.c:275: while (bit) {
00107$:
	ld	a, -1 (ix)
	or	a, -2 (ix)
	or	a, -3 (ix)
	or	a, -4 (ix)
	jp	Z, 00109$
;qsolve.c:276: if (x >= r + bit) { x -= r + bit; r = (r >> 1) + bit; }
	ld	a, -12 (ix)
	add	a, -4 (ix)
	ld	-20 (ix), a
	ld	a, -11 (ix)
	adc	a, -3 (ix)
	ld	-19 (ix), a
	ld	a, -10 (ix)
	adc	a, -2 (ix)
	ld	-18 (ix), a
	ld	a, -9 (ix)
	adc	a, -1 (ix)
	ld	-17 (ix), a
	ld	a, -12 (ix)
	ld	-16 (ix), a
	ld	a, -11 (ix)
	ld	-15 (ix), a
	ld	a, -10 (ix)
	ld	-14 (ix), a
	ld	a, -9 (ix)
	ld	-13 (ix), a
	srl	-13 (ix)
	rr	-14 (ix)
	rr	-15 (ix)
	rr	-16 (ix)
	ld	a, -8 (ix)
	sub	a, -20 (ix)
	ld	a, -7 (ix)
	sbc	a, -19 (ix)
	ld	a, -6 (ix)
	sbc	a, -18 (ix)
	ld	a, -5 (ix)
	sbc	a, -17 (ix)
	jr	C, 00105$
	ld	a, -8 (ix)
	sub	a, -20 (ix)
	ld	-8 (ix), a
	ld	a, -7 (ix)
	sbc	a, -19 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	sbc	a, -18 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	sbc	a, -17 (ix)
	ld	-5 (ix), a
	ld	a, -16 (ix)
	add	a, -4 (ix)
	ld	-12 (ix), a
	ld	a, -15 (ix)
	adc	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, -14 (ix)
	adc	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -13 (ix)
	adc	a, -1 (ix)
	ld	-9 (ix), a
	jr	00106$
00105$:
;qsolve.c:277: else r >>= 1;
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	hl, #4
	add	hl, sp
	ld	bc, #4
	ldir
00106$:
;qsolve.c:278: bit >>= 2;
	ld	b, #0x02
00141$:
	srl	-1 (ix)
	rr	-2 (ix)
	rr	-3 (ix)
	rr	-4 (ix)
	djnz	00141$
	jp	00107$
00109$:
;qsolve.c:280: return r;
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
;qsolve.c:281: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:320: static void lreset(void)
;	---------------------------------
; Function lreset
; ---------------------------------
_lreset:
;qsolve.c:322: nlines = 0; col = 0; cur = LINE(0);
	ld	hl, #_nlines
	ld	(hl), #0x00
	ld	hl, #_col
	ld	(hl), #0x00
	ld	hl, #_cur
	ld	(hl), #0xec
	inc	hl
	ld	(hl), #0x86
;qsolve.c:323: }
	ret
;qsolve.c:324: static void nl(void)
;	---------------------------------
; Function nl
; ---------------------------------
_nl:
;qsolve.c:326: cur[col] = 0;
	ld	a, (#_cur)
	ld	hl, #_col
	add	a, (hl)
	ld	c, a
	ld	a, (#_cur + 1)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;qsolve.c:327: if (nlines < NL - 1) nlines++;
	ld	hl, #_nlines
	ld	a, (hl)
	sub	a, #0x1d
	jr	NC, 00102$
	inc	(hl)
00102$:
;qsolve.c:328: col = 0; cur = LINE(nlines);
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
;qsolve.c:329: }
	ret
;qsolve.c:330: static void pc(char c)
;	---------------------------------
; Function pc
; ---------------------------------
_pc:
	ld	c, a
;qsolve.c:332: if (col >= LW) { nl(); cur[col++] = ' '; }
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
;qsolve.c:333: cur[col++] = c;
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
;qsolve.c:334: }
	ret
;qsolve.c:335: static void ps(const char *s) { while (*s) pc(*s++); }
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
;qsolve.c:336: static void pl(const char *s) { ps(s); nl(); }
;	---------------------------------
; Function pl
; ---------------------------------
_pl:
	call	_ps
	jp	_nl
;qsolve.c:337: static void pn(L n)
;	---------------------------------
; Function pn
; ---------------------------------
_pn:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-17
	add	hl, sp
	ld	sp, hl
;qsolve.c:342: if (n < 0) { pc('-'); u = -n; } else u = n;
	bit	7, b
	jr	Z, 00102$
	push	bc
	push	de
	ld	a, #0x2d
	call	_pc
	pop	de
	pop	bc
	ld	hl, #0x0000
	cp	a, a
	sbc	hl, de
	ex	de, hl
	ld	a, #0x00
	sbc	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
;qsolve.c:343: do { b[i++] = '0' + (char)(u % 10); u /= 10; } while (u);
00102$:
	ld	-1 (ix), #0x00
00104$:
	push	de
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	inc	-1 (ix)
	push	hl
	push	bc
	push	de
	push	hl
	ld	hl, #0x0000
	ex	(sp), hl
	push	hl
	ld	hl, #0x000a
	ex	(sp), hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__modulong
	pop	af
	pop	af
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	-3 (ix), l
	ld	-2 (ix), h
	pop	de
	pop	bc
	pop	hl
	ld	a, -5 (ix)
	add	a, #0x30
	ld	(hl), a
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
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
	ld	c, l
	ld	b, h
	ld	a, b
	or	a, c
	or	a, d
	or	a, e
	jr	NZ, 00104$
;qsolve.c:344: while (i) pc(b[--i]);
	ld	c, -1 (ix)
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
;qsolve.c:345: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:346: static void pq(U8 i)
;	---------------------------------
; Function pq
; ---------------------------------
_pq:
	ld	e, a
;qsolve.c:348: pn(R[i].n);
	ld	bc, #_R+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
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
;qsolve.c:349: if (R[i].d != 1) { pc('/'); pn(R[i].d); }
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
;qsolve.c:350: }
	jp	_pn
;qsolve.c:351: static void ppt(U8 x, U8 y)
;	---------------------------------
; Function ppt
; ---------------------------------
_ppt:
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;qsolve.c:353: pc('('); pq(x); pc(','); pq(y); pc(')');
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
;qsolve.c:354: }
	jp	_pc
;qsolve.c:402: static void fail(const char *m)
;	---------------------------------
; Function fail
; ---------------------------------
_fail:
;qsolve.c:404: lreset();
	push	hl
	call	_lreset
	ld	hl, #___str_0
	call	_pl
	pop	de
;qsolve.c:406: pl(m);
	ex	de, hl
;qsolve.c:407: }
	jp	_pl
___str_0:
	.ascii "ERROR:"
	.db 0x00
;qsolve.c:411: static void pterm(U8 ci, const char *v, U8 first)
;	---------------------------------
; Function pterm
; ---------------------------------
_pterm:
	call	___sdcc_enter_ix
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	ld	c, a
	ld	-2 (ix), e
	ld	-1 (ix), d
;qsolve.c:413: I n = iabs(R[ci].n);
	ld	de, #_R+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_iabs
	inc	sp
	inc	sp
	push	de
;qsolve.c:414: if (R[ci].n == 0) return;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, b
	or	a, c
	jp	Z,00118$
;qsolve.c:415: if (R[ci].n < 0) pc('-'); else if (!first) pc('+');
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
;qsolve.c:416: if (*v) {
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
;qsolve.c:417: if (R[ci].d == 1) { if (n != 1) pn(n); }
	ld	e, -6 (ix)
	push	af
	ld	a, -5 (ix)
	ld	d, a
	rlca
	sbc	a, a
	ld	c, a
	ld	b, a
	pop	af
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
;qsolve.c:416: if (*v) {
	or	a, a
	jr	Z, 00116$
;qsolve.c:417: if (R[ci].d == 1) { if (n != 1) pn(n); }
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	dec	hl
	ld	a, -4 (ix)
	dec	a
	or	a, -3 (ix)
	jr	NZ, 00111$
	ld	a, -6 (ix)
	dec	a
	or	a, -5 (ix)
	jr	Z, 00112$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
	jr	00112$
00111$:
;qsolve.c:418: else { pc('('); pn(n); pc('/'); pn(R[ci].d); pc(')'); }
	push	hl
	push	bc
	push	de
	ld	a, #0x28
	call	_pc
	pop	de
;	spillPairReg hl
;	spillPairReg hl
	pop	hl
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
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
	ld	a, #0x29
	call	_pc
00112$:
;qsolve.c:419: ps(v);
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_ps
	jr	00118$
00116$:
;qsolve.c:421: pn(n);
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_pn
	pop	hl
;qsolve.c:422: if (R[ci].d != 1) { pc('/'); pn(R[ci].d); }
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	dec	a
	or	a, b
	jr	Z, 00118$
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
00118$:
;qsolve.c:424: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;qsolve.c:427: static void ppoly(U8 a, U8 b, U8 c, char var)
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
;qsolve.c:430: U8 first = 1;
	ld	b, #0x01
;qsolve.c:431: v2[0] = var; v2[1] = '|'; v2[2] = 0;
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, 5 (ix)
	ld	(de), a
	ld	-5 (ix), #0x7c
	ld	-4 (ix), #0x00
;qsolve.c:432: v1[0] = var; v1[1] = 0;
	ld	a, 5 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
;qsolve.c:433: pterm(a, v2, first); if (R[a].n) first = 0;
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
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
;qsolve.c:434: pterm(b, v1, first); if (R[b].n) first = 0;
	push	bc
	push	bc
	inc	sp
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	a, c
	call	_pterm
	pop	bc
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
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
;qsolve.c:435: pterm(c, "", first); if (R[c].n) first = 0;
	push	bc
	push	bc
	inc	sp
	ld	de, #___str_1
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
;qsolve.c:436: if (first) pc('0');
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	a, #0x30
	call	_pc
00109$:
;qsolve.c:437: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
___str_1:
	.db 0x00
;qsolve.c:466: static void toint(U8 a, U8 b, U8 c, U8 red)
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
;qsolve.c:468: I m = lcm(lcm(R[a].d, R[b].d), R[c].d), g;
	ld	bc, #_R+0
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	(sp), hl
	ld	a, -13 (ix)
	add	a, #0x02
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, -7 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
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
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	-3 (ix), l
	ld	-2 (ix), h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_lcm
	ld	c, e
	ld	b, d
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_lcm
	ld	c, e
	ld	b, d
	pop	hl
;qsolve.c:469: ia = mi(R[a].n, m / R[a].d);
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	pop	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
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
;qsolve.c:470: ib = mi(R[b].n, m / R[b].d);
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
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
	ld	(_ib), hl
;qsolve.c:471: ic = mi(R[c].n, m / R[c].d);
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
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
;qsolve.c:472: if (red) {
	ld	a, 5 (ix)
	or	a, a
	jr	Z, 00105$
;qsolve.c:473: g = gcd(gcd(ia, ib), ic);
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
;qsolve.c:474: if (g > 1) { ia /= g; ib /= g; ic /= g; }
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
;qsolve.c:476: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;qsolve.c:488: static U8 before(U8 a, U8 b)
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
;qsolve.c:490: if (R[a].d != R[b].d) return R[a].d > R[b].d;
	ld	bc, #_R+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
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
;qsolve.c:491: return iabs(R[a].n) >= iabs(R[b].n);
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
;qsolve.c:492: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:495: static void swp(U8 a, U8 b)
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
;qsolve.c:498: t = R[a]; R[a] = R[b]; R[b] = t;
	ld	bc, #_R+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
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
;qsolve.c:499: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:502: static void pfac(U8 r)
;	---------------------------------
; Function pfac
; ---------------------------------
_pfac:
	call	___sdcc_enter_ix
	push	af
	ld	e, a
;qsolve.c:504: if (R[r].d == 1 && R[r].n == 0) { pc('x'); return; }
	ld	bc, #_R+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
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
;qsolve.c:505: pc('(');
	push	bc
	ld	a, #0x28
	call	_pc
	pop	bc
;qsolve.c:506: if (R[r].d != 1) pn(R[r].d);
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
;qsolve.c:507: pc('x'); pc(R[r].n < 0 ? '+' : '-'); pn(iabs(R[r].n)); pc(')');
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
;qsolve.c:508: }
	pop	af
	pop	ix
	ret
;qsolve.c:512: static U8 canfac(void)
;	---------------------------------
; Function canfac
; ---------------------------------
_canfac:
	call	___sdcc_enter_ix
	push	af
	push	af
;qsolve.c:514: L D = disc(ia, ib, ic), s;
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
;qsolve.c:515: if (err || D < 0) return 0;
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
;qsolve.c:516: s = isqrt(D);
	pop	de
	push	de
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_isqrt
;qsolve.c:517: return s * s == D;
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
;qsolve.c:518: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:521: static void dofactor(void)
;	---------------------------------
; Function dofactor
; ---------------------------------
_dofactor:
	call	___sdcc_enter_ix
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;qsolve.c:523: L D = disc(ia, ib, ic), s = isqrt(D);
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
;qsolve.c:525: qn(&R[T0], ck(-ib + s), mi(2, ia));
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
;qsolve.c:526: qn(&R[T1], ck(-ib - s), mi(2, ia));
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
;qsolve.c:527: if (!before(T0, T1)) swp(T0, T1);
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
;qsolve.c:528: K = ia / mi(R[T0].d, R[T1].d);
	ld	de, (#_R + 38)
	ld	hl, (#_R + 34)
	call	_mi
	ld	hl, (_ia)
	call	__divsint
;qsolve.c:529: if (K == -1) pc('-'); else if (K != 1) pn(K);
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
;qsolve.c:530: pfac(T0);
	ld	a, #0x08
	call	_pfac
;qsolve.c:531: if (D == 0) pc('|'); else pfac(T1);
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
;qsolve.c:532: }
	ld	sp, ix
	pop	ix
	ret
;qsolve.c:533: static void proots(void)
;	---------------------------------
; Function proots
; ---------------------------------
_proots:
;qsolve.c:535: ps("x="); pq(T0);
	ld	hl, #___str_2
	call	_ps
	ld	a, #0x08
	call	_pq
;qsolve.c:536: if (R[T0].n != R[T1].n || R[T0].d != R[T1].d) { ps(", "); pq(T1); }
	ld	bc, (#_R + 32)
	ld	hl, (#_R + 36)
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00101$
	ld	bc, (#_R + 34)
	ld	hl, (#_R + 38)
	cp	a, a
	sbc	hl, bc
	jp	Z,_nl
00101$:
	ld	hl, #___str_3
	call	_ps
	ld	a, #0x09
	call	_pq
;qsolve.c:537: nl();
;qsolve.c:538: }
	jp	_nl
___str_2:
	.ascii "x="
	.db 0x00
___str_3:
	.ascii ", "
	.db 0x00
;qsolve.c:702: static void t_fac(U8 m)      /* left a b c, right a b c */
;	---------------------------------
; Function t_fac
; ---------------------------------
_t_fac:
;qsolve.c:705: SUB(T0, I0, I3); SUB(T1, I1, I4); SUB(T2, I2, I5);
	ld	hl, #0x1803
	call	_qop
	ld	hl, #0x1914
	call	_qop
	ld	hl, #0x1a25
	call	_qop
;qsolve.c:706: if (R[T0].n == 0 && R[T1].n == 0) { fail("NO x| OR x TERM LEFT"); return; }
	ld	hl, (#_R + 32)
	ld	a, h
	or	a, l
	jr	NZ, 00102$
	ld	hl, (#_R + 36)
	ld	a, h
	or	a, l
	jr	NZ, 00102$
	ld	hl, #___str_4
	jp	_fail
00102$:
;qsolve.c:707: toint(T0, T1, T2, 1);
	ld	hl, #0x10a
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_toint
;qsolve.c:708: if (ia < 0 || (ia == 0 && ib < 0)) { ia = -ia; ib = -ib; ic = -ic; }
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
;qsolve.c:709: qint(T3, ia); qint(T4, ib); qint(T5, ic);
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
;qsolve.c:710: ppoly(T3, T4, T5, 'x'); pl("=0");
	ld	hl, #0x780d
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_ppoly
	ld	hl, #___str_5
	call	_pl
;qsolve.c:711: if (ia && canfac()) { dofactor(); pl("=0"); }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z, 00111$
	call	_canfac
	or	a, a
	jr	Z, 00111$
	call	_dofactor
	ld	hl, #___str_5
	call	_pl
	jr	00112$
00111$:
;qsolve.c:712: else if (ia) { pl("not factorable over Q"); pl("use quad formula:"); }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z, 00112$
	ld	hl, #___str_6
	call	_pl
	ld	hl, #___str_7
	call	_pl
00112$:
;qsolve.c:716: if (!ia) { DIV(T3, T2, T1); NEG(T3, T3); ps("x="); pq(T3); nl(); }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00118$
	ld	hl, #0x3ba9
	call	_qop
	ld	hl, #0x4bb0
	call	_qop
	ld	hl, #___str_8
	call	_ps
	ld	a, #0x0b
	call	_pq
	jp	_nl
00118$:
;qsolve.c:717: else if (canfac()) proots();
	call	_canfac
	or	a, a
	jp	NZ,_proots
;qsolve.c:718: else pl("(Quadratic Formula app)");
	ld	hl, #___str_9
;qsolve.c:720: }
	jp	_pl
___str_4:
	.ascii "NO x| OR x TERM LEFT"
	.db 0x00
___str_5:
	.ascii "=0"
	.db 0x00
___str_6:
	.ascii "not factorable over Q"
	.db 0x00
___str_7:
	.ascii "use quad formula:"
	.db 0x00
___str_8:
	.ascii "x="
	.db 0x00
___str_9:
	.ascii "(Quadratic Formula app)"
	.db 0x00
;qsolve.c:791: static void t_fq(U8 m)       /* a b c */
;	---------------------------------
; Function t_fq
; ---------------------------------
_t_fq:
;qsolve.c:794: toint(I0, I1, I2, 0);
	ld	hl, #0x02
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_toint
;qsolve.c:795: if (ia == 0) { fail("a CANNOT BE 0"); return; }
	ld	hl, #_ia + 1
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ, 00102$
	ld	hl, #___str_10
	jp	_fail
00102$:
;qsolve.c:796: qint(T3, ia); qint(T4, ib); qint(T5, ic);
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
;qsolve.c:797: ppoly(T3, T4, T5, 'x'); nl();
	ld	hl, #0x780d
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_ppoly
	call	_nl
;qsolve.c:798: if (canfac()) { ps("="); dofactor(); nl(); }
	call	_canfac
	or	a, a
	jr	Z, 00104$
	ld	hl, #___str_11
	call	_ps
	call	_dofactor
	jp	_nl
00104$:
;qsolve.c:800: pl("prime over rationals");
	ld	hl, #___str_12
	call	_pl
;qsolve.c:804: pl("(Quadratic Formula app)");
	ld	hl, #___str_13
;qsolve.c:807: }
	jp	_pl
___str_10:
	.ascii "a CANNOT BE 0"
	.db 0x00
___str_11:
	.ascii "="
	.db 0x00
___str_12:
	.ascii "prime over rationals"
	.db 0x00
___str_13:
	.ascii "(Quadratic Formula app)"
	.db 0x00
;qsolve.c:1098: static U8 strlen_(const char *s)
;	---------------------------------
; Function strlen_
; ---------------------------------
_strlen_:
;qsolve.c:1101: while (*s++) n++;
	ld	c, #0x00
00101$:
	ld	a, (hl)
	inc	hl
	or	a, a
	jr	Z, 00103$
	inc	c
	jr	00101$
00103$:
;qsolve.c:1102: return n;
	ld	a, c
;qsolve.c:1103: }
	ret
_lbl_vp:
	.dw __str_14
	.dw __str_15
	.dw __str_16
	.dw __str_17
_lbl_tr:
	.dw __str_18
	.dw __str_19
	.dw __str_20
	.dw __str_21
_def_tr:
	.dw __str_22
	.dw __str_22
	.dw __str_22
	.dw __str_23
_lbl_fac:
	.dw __str_24
	.dw __str_25
	.dw __str_26
	.dw __str_27
	.dw __str_28
	.dw __str_29
_lbl_sq:
	.dw __str_30
	.dw __str_31
	.dw __str_32
_def_sq:
	.dw __str_23
	.dw __str_22
	.dw __str_22
_lbl_abc:
	.dw __str_33
	.dw __str_34
	.dw __str_32
_lbl_abcp:
	.dw __str_33
	.dw __str_34
	.dw __str_32
	.dw __str_35
	.dw __str_36
_lbl_vf:
	.dw __str_30
	.dw __str_37
	.dw __str_38
	.dw __str_35
	.dw __str_36
_lbl_ff:
	.dw __str_30
	.dw __str_39
	.dw __str_40
	.dw __str_35
	.dw __str_36
_lbl_zf:
	.dw __str_30
	.dw __str_41
	.dw __str_42
_lbl_z2:
	.dw __str_43
	.dw __str_44
	.dw __str_45
	.dw __str_46
_lbl_n:
	.dw __str_47
_lbl_rad:
	.dw __str_48
_lbl_ac:
	.dw __str_33
	.dw __str_32
_lbl_pj:
	.dw __str_49
	.dw __str_50
	.dw __str_51
_def_one:
	.dw __str_23
_d_zero:
	.dw __str_22
	.dw __str_22
	.dw __str_22
	.dw __str_22
	.dw __str_22
	.dw __str_22
_d_opt:
	.dw __str_22
	.dw __str_22
	.dw __str_22
	.dw __str_52
	.dw __str_52
_T:
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
	.dw __str_53
	.db #0x06	; 6
	.dw _lbl_fac
	.dw _d_zero
	.dw _t_fac
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
	.dw __str_54
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
__str_14:
	.ascii "h (vertex x)"
	.db 0x00
__str_15:
	.ascii "k (vertex y)"
	.db 0x00
__str_16:
	.ascii "point x"
	.db 0x00
__str_17:
	.ascii "point y"
	.db 0x00
__str_18:
	.ascii "right(+)/left"
	.db 0x00
__str_19:
	.ascii "up(+)/down"
	.db 0x00
__str_20:
	.ascii "reflect x=1"
	.db 0x00
__str_21:
	.ascii "stretch"
	.db 0x00
__str_22:
	.ascii "0"
	.db 0x00
__str_23:
	.ascii "1"
	.db 0x00
__str_24:
	.ascii "left x| "
	.db 0x00
__str_25:
	.ascii "left x "
	.db 0x00
__str_26:
	.ascii "left num"
	.db 0x00
__str_27:
	.ascii "right x| "
	.db 0x00
__str_28:
	.ascii "right x "
	.db 0x00
__str_29:
	.ascii "right num"
	.db 0x00
__str_30:
	.ascii "a"
	.db 0x00
__str_31:
	.ascii "h  (x-h)|"
	.db 0x00
__str_32:
	.ascii "c"
	.db 0x00
__str_33:
	.ascii "a (x|)"
	.db 0x00
__str_34:
	.ascii "b (x)"
	.db 0x00
__str_35:
	.ascii "pt x opt"
	.db 0x00
__str_36:
	.ascii "pt y opt"
	.db 0x00
__str_37:
	.ascii "h"
	.db 0x00
__str_38:
	.ascii "k"
	.db 0x00
__str_39:
	.ascii "p"
	.db 0x00
__str_40:
	.ascii "q"
	.db 0x00
__str_41:
	.ascii "p  (x-p)"
	.db 0x00
__str_42:
	.ascii "q  (x-q)"
	.db 0x00
__str_43:
	.ascii "z1 real"
	.db 0x00
__str_44:
	.ascii "z1 imag"
	.db 0x00
__str_45:
	.ascii "z2 real"
	.db 0x00
__str_46:
	.ascii "z2 imag"
	.db 0x00
__str_47:
	.ascii "n"
	.db 0x00
__str_48:
	.ascii "radicand"
	.db 0x00
__str_49:
	.ascii "t| coef"
	.db 0x00
__str_50:
	.ascii "t coef"
	.db 0x00
__str_51:
	.ascii "constant"
	.db 0x00
__str_52:
	.db 0x00
__str_53:
	.ascii "SOLVE BY FACTORING"
	.db 0x00
__str_54:
	.ascii "FACTOR QUADRATIC"
	.db 0x00
;qsolve.c:1105: static U8 digit(U8 k)
;	---------------------------------
; Function digit
; ---------------------------------
_digit:
;qsolve.c:1107: switch (k) {
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
;qsolve.c:1108: case 0x21: return 0; case 0x22: return 1; case 0x1A: return 2; case 0x12: return 3;
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
;qsolve.c:1109: case 0x23: return 4; case 0x1B: return 5; case 0x13: return 6; case 0x24: return 7;
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
;qsolve.c:1110: case 0x1C: return 8; case 0x14: return 9;
00109$:
	ld	a, #0x08
	ret
00110$:
	ld	a, #0x09
	ret
;qsolve.c:1111: }
00111$:
;qsolve.c:1112: return 255;
	ld	a, #0xff
;qsolve.c:1113: }
	ret
;qsolve.c:1116: static U8 parse(const char *s, U8 i)
;	---------------------------------
; Function parse
; ---------------------------------
_parse:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
;qsolve.c:1118: unsigned n = 0, d = 1, den = 0, *t;
	xor	a, a
	ld	-13 (ix), a
	ld	-12 (ix), a
	ld	-4 (ix), #0x01
	ld	-3 (ix), #0
	xor	a, a
	ld	-11 (ix), a
	ld	-10 (ix), a
;qsolve.c:1119: U8 neg = 0, dot = 0, slash = 0, dg = 0;
	ld	-9 (ix), #0x00
	ld	-8 (ix), #0x00
	ld	c, #0x00
	ld	-7 (ix), #0x00
;qsolve.c:1120: if (*s == '-') { neg = 1; s++; }
	ld	a, (hl)
	sub	a, #0x2d
	jr	NZ, 00156$
	ld	-9 (ix), #0x01
	inc	hl
00156$:
	ld	-2 (ix), l
	ld	-1 (ix), h
00136$:
;qsolve.c:1121: for (; *s; s++) {
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	b, (hl)
	ld	a, b
	or	a, a
	jp	Z, 00124$
;qsolve.c:1122: if (*s == '.') { if (dot || slash) return 1; dot = 1; }
	ld	a, b
	sub	a, #0x2e
	jr	NZ, 00122$
	ld	a, -8 (ix)
	or	a,a
	jr	NZ, 00103$
	or	a,c
	jr	Z, 00104$
00103$:
	ld	a, #0x01
	jp	00138$
00104$:
	ld	-8 (ix), #0x01
	jp	00137$
00122$:
;qsolve.c:1123: else if (*s == '/') { if (slash || !dg) return 1; slash = 1; dg = 0; den = 0; }
	ld	a, b
	sub	a,#0x2f
	jr	NZ, 00119$
	or	a,c
	jr	NZ, 00106$
	ld	a, -7 (ix)
	or	a, a
	jr	NZ, 00107$
00106$:
	ld	a, #0x01
	jp	00138$
00107$:
	ld	c, #0x01
	ld	-7 (ix), #0x00
	xor	a, a
	ld	-11 (ix), a
	ld	-10 (ix), a
	jp	00137$
00119$:
;qsolve.c:1125: dg = 1;
	ld	-7 (ix), #0x01
;qsolve.c:1126: t = slash ? &den : &n;
	ld	a, c
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
;qsolve.c:1127: if (*t > 3276) { err = 1; return 1; }
	ld	-6 (ix), e
	ld	-5 (ix), d
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0xcc
	cp	a, e
	ld	a, #0x0c
	sbc	a, d
	jr	NC, 00110$
	ld	hl, #_err
	ld	a,#0x01
	ld	(hl),a
	jp	00138$
00110$:
;qsolve.c:1128: *t = *t * 10 + (*s - '0');
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	a, b
	ld	b, #0x00
	add	a, #0xd0
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	add	hl, de
	ex	de, hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;qsolve.c:1129: if (dot && !slash) { if (d > 3276) { err = 1; return 1; } d *= 10; }
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00114$
	ld	a, c
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
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	-4 (ix), l
	ld	-3 (ix), h
00114$:
;qsolve.c:1130: if (*t > 32767) { err = 1; return 1; }
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	ld	a, #0xff
	cp	a, b
	ld	a, #0x7f
	sbc	a, e
	jr	NC, 00137$
	ld	hl, #_err
	ld	a,#0x01
	ld	(hl),a
	jp	00138$
00137$:
;qsolve.c:1121: for (; *s; s++) {
	inc	-2 (ix)
	jp	NZ,00136$
	inc	-1 (ix)
	jp	00136$
00124$:
;qsolve.c:1133: if (!dg) { if (neg || slash || dot) return 1; qint(i, 0); return 0; }
	ld	a, -7 (ix)
	or	a, a
	jr	NZ, 00130$
	ld	a, -9 (ix)
	or	a,a
	jr	NZ, 00125$
	or	a,c
	jr	NZ, 00125$
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00126$
00125$:
	ld	a, #0x01
	jr	00138$
00126$:
	ld	de, #0x0000
	ld	a, 4 (ix)
	call	_qint
	xor	a, a
	jr	00138$
00130$:
;qsolve.c:1134: if (slash) {
	ld	a, c
	or	a, a
	jr	Z, 00134$
;qsolve.c:1135: if (den == 0) { err = 2; return 1; }
	ld	a, -10 (ix)
	or	a, -11 (ix)
	jr	NZ, 00132$
	ld	hl, #_err
	ld	(hl), #0x02
	ld	a, #0x01
	jr	00138$
00132$:
;qsolve.c:1136: d = mi(d, den);
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
;qsolve.c:1138: qn(&R[i], neg ? -(I)n : (I)n, d);
	pop	bc
	push	bc
	ld	a, -9 (ix)
	or	a, a
	jr	Z, 00142$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00142$:
	ld	e, 4 (ix)
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_R
	add	hl, de
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	push	de
	ld	e, c
	ld	d, b
	call	_qn
;qsolve.c:1139: return err;
	ld	a, (#_err)
00138$:
;qsolve.c:1140: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;qsolve.c:1142: static void title(const char *t)
;	---------------------------------
; Function title
; ---------------------------------
_title:
;qsolve.c:1144: clrrow(0, 1);
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_clrrow
	pop	hl
;qsolve.c:1145: puts_(0, 0, t, 1);
	ld	a, #0x01
	push	af
	inc	sp
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_puts_
;qsolve.c:1146: }
	ret
;qsolve.c:1148: static void notice(const char *m)
;	---------------------------------
; Function notice
; ---------------------------------
_notice:
;qsolve.c:1150: clrrow(9, 1);
	push	hl
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_clrrow
	pop	hl
;qsolve.c:1151: puts_(0, 9, m, 1);
	ld	a, #0x01
	push	af
	inc	sp
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
;qsolve.c:1152: present();
	call	_present
;qsolve.c:1153: key();
;qsolve.c:1154: }
	jp	_key
;qsolve.c:1156: static U8 menu(const char *ttl, const char *const *items, U8 n)
;	---------------------------------
; Function menu
; ---------------------------------
_menu:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	push	af
	ld	-3 (ix), l
	ld	-2 (ix), h
;qsolve.c:1158: U8 sel = 0, top = 0, i, k, r, inv, c;
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
00128$:
;qsolve.c:1160: cls();
	call	_cls
;qsolve.c:1161: title(ttl);
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_title
;qsolve.c:1162: for (i = 0; i < 9 && top + i < n; i++) {
	ld	-1 (ix), #0x00
00126$:
	ld	a, 6 (ix)
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	a, -1 (ix)
	sub	a, #0x09
	jp	NC, 00103$
	ld	c, -5 (ix)
	ld	b, #0x00
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, l
	sub	a, -8 (ix)
	ld	a, h
	sbc	a, -7 (ix)
	jp	PO, 00219$
	xor	a, #0x80
00219$:
	jp	P, 00103$
;qsolve.c:1163: r = top + i; inv = (r == sel);
	ld	a, -5 (ix)
	add	a, -1 (ix)
	ld	c, a
	ld	a, -6 (ix)
	sub	a, c
	ld	a, #0x01
	jr	Z, 00221$
	xor	a, a
00221$:
	ld	d, a
;qsolve.c:1164: clrrow(i + 1, inv);
	ld	a, -1 (ix)
	inc	a
	ld	-4 (ix), a
	push	bc
	push	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -4 (ix)
	call	_clrrow
	pop	de
	pop	bc
;qsolve.c:1165: c = 0;
	ld	b, #0x00
;qsolve.c:1166: if (r >= 9) putg(c++, i + 1, '1', inv);
	ld	a, c
	sub	a, #0x09
	ld	a, #0x00
	rla
	ld	e, a
	bit	0, e
	jr	NZ, 00102$
	ld	b, #0x01
	push	bc
	push	de
	ld	e, #0x31
	push	de
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_putg
	pop	de
	pop	bc
00102$:
;qsolve.c:1167: putg(c++, i + 1, '0' + (r < 9 ? r + 1 : r - 9), inv);
	ld	a, c
	inc	e
	dec	e
	jr	Z, 00132$
	inc	a
	jr	00133$
00132$:
	add	a, #0xf7
00133$:
	add	a, #0x30
	ld	e, b
	inc	b
	push	bc
	push	de
	push	de
	inc	sp
	push	af
	inc	sp
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_putg
	pop	de
	pop	bc
;qsolve.c:1168: putg(c++, i + 1, ':', inv);
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	e, b
	inc	e
	push	bc
	push	de
	ld	e, #0x3a
	push	de
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_putg
	pop	de
	pop	bc
;qsolve.c:1169: puts_(c, i + 1, items[r], inv);
	ld	a, c
	ld	b, #0x00
	add	a, a
	rl	b
	add	a, 4 (ix)
	ld	c, a
	ld	a, b
	adc	a, 5 (ix)
	ld	b, a
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	de
	inc	sp
	push	bc
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_puts_
;qsolve.c:1162: for (i = 0; i < 9 && top + i < n; i++) {
	inc	-1 (ix)
	jp	00126$
00103$:
;qsolve.c:1171: present();
	call	_present
;qsolve.c:1172: k = key();
	call	_key
	ld	c, a
;qsolve.c:1173: if (k == K_UP) sel = sel ? sel - 1 : n - 1;
	ld	e, -6 (ix)
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00117$
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00134$
	dec	e
	jr	00135$
00134$:
	ld	e, 6 (ix)
	dec	e
00135$:
	ld	-6 (ix), e
	jr	00118$
00117$:
;qsolve.c:1174: else if (k == K_DOWN) sel = sel + 1 < n ? sel + 1 : 0;
	ld	a, c
	dec	a
	jr	NZ, 00114$
	ld	c, -6 (ix)
	ld	b, #0x00
	inc	bc
	ld	a, c
	sub	a, -8 (ix)
	ld	a, b
	sbc	a, -7 (ix)
	jp	PO, 00227$
	xor	a, #0x80
00227$:
	jp	P, 00136$
	inc	e
	ld	a, e
	rlca
	jr	00137$
00136$:
	ld	de, #0x0000
00137$:
	ld	-6 (ix), e
	jr	00118$
00114$:
;qsolve.c:1175: else if (k == K_ENTER) return sel;
	ld	a, c
	sub	a, #0x09
	jr	NZ, 00111$
	ld	a, -6 (ix)
	jr	00130$
00111$:
;qsolve.c:1176: else if (k == K_CLEAR) return 255;
	ld	a, c
	sub	a, #0x0f
	jr	NZ, 00108$
	ld	a, #0xff
	jr	00130$
00108$:
;qsolve.c:1177: else if ((i = digit(k)) >= 1 && i <= n) return i - 1;
	ld	a, c
	call	_digit
	ld	c, a
	sub	a, #0x01
	jr	C, 00118$
	ld	a, 6 (ix)
	sub	a, c
	jr	C, 00118$
	ld	a, c
	dec	a
	jr	00130$
00118$:
;qsolve.c:1178: if (sel < top) top = sel;
	ld	a, -6 (ix)
	sub	a, -5 (ix)
	jr	NC, 00120$
	ld	a, -6 (ix)
	ld	-5 (ix), a
00120$:
;qsolve.c:1179: if (sel >= top + 9) top = sel - 8;
	ld	c, -5 (ix)
	ld	b, #0x00
	ld	hl, #0x0009
	add	hl, bc
	ld	a, -6 (ix)
	ld	b, #0x00
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00232$
	xor	a, #0x80
00232$:
	jp	M, 00128$
	ld	a, -6 (ix)
	add	a, #0xf8
	ld	-5 (ix), a
	jp	00128$
00130$:
;qsolve.c:1181: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	inc	sp
	jp	(hl)
;qsolve.c:1183: static U8 viewer(void)       /* 1 = back to form, 0 = menu */
;	---------------------------------
; Function viewer
; ---------------------------------
_viewer:
	call	___sdcc_enter_ix
	push	af
;qsolve.c:1185: U8 top = 0, i, k;
	ld	c, #0x00
00120$:
;qsolve.c:1187: cls();
	push	bc
	call	_cls
	pop	bc
;qsolve.c:1188: for (i = 0; i < 9 && top + i < nlines; i++) puts_(0, i, LINE(top + i), 0);
	ld	b, #0x00
00118$:
	ld	-2 (ix), c
	ld	-1 (ix), #0x00
	ld	a,b
	cp	a,#0x09
	jr	NC, 00101$
	ld	d, #0x00
	add	a, -2 (ix)
	ld	e, a
	ld	a, d
	adc	a, -1 (ix)
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
	jp	PO, 00175$
	xor	a, #0x80
00175$:
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
	jr	00118$
00101$:
;qsolve.c:1189: clrrow(9, 1);
	push	bc
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_clrrow
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #___str_55
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
	call	_present
	call	_key
	pop	bc
;qsolve.c:1193: if (k == K_UP && top) top--;
	ld	b, a
	sub	a,#0x04
	jr	NZ, 00112$
	or	a,c
	jr	Z, 00112$
	dec	c
	jr	00120$
00112$:
;qsolve.c:1194: else if (k == K_DOWN && top + 9 < nlines) top++;
	ld	a, b
	dec	a
	jr	NZ, 00108$
	ld	a, -2 (ix)
	add	a, #0x09
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
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
	jp	PO, 00180$
	xor	a, #0x80
00180$:
	jp	P, 00108$
	inc	c
	jp	00120$
00108$:
;qsolve.c:1195: else if (k == K_ENTER) return 1;
	ld	a, b
	sub	a, #0x09
	jr	NZ, 00105$
	ld	a, #0x01
	jr	00122$
00105$:
;qsolve.c:1196: else if (k == K_CLEAR) return 0;
	ld	a, b
	sub	a, #0x0f
	jp	NZ,00120$
	xor	a, a
00122$:
;qsolve.c:1198: }
	pop	bc
	pop	ix
	ret
___str_55:
	.ascii "ENTER:edit CLEAR:menu"
	.db 0x00
;qsolve.c:1200: static void strcpy_(char *d, const char *s)
;	---------------------------------
; Function strcpy_
; ---------------------------------
_strcpy_:
;qsolve.c:1202: while ((*d++ = *s++)) ;
00101$:
	ld	a, (de)
	inc	de
	ld	(hl), a
	inc	hl
	or	a, a
	jr	NZ, 00101$
;qsolve.c:1203: }
	ret
;qsolve.c:1205: static void run(U8 ti)
;	---------------------------------
; Function run
; ---------------------------------
_run:
	call	___sdcc_enter_ix
	ld	hl, #-22
	add	hl, sp
	ld	sp, hl
	ld	e, a
;qsolve.c:1207: const Tool *t = &T[ti];
	ld	bc, #_T+0
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	(sp), hl
;qsolve.c:1208: U8 nf = t->nf, f = 0, i, k, len, fr = 0xFF, num;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-20 (ix), a
	ld	-1 (ix), #0x00
	ld	-19 (ix), #0xff
;qsolve.c:1210: for (i = 0; i < nf; i++) strcpy_(fb[i], t->def[i]);
	ld	a, -22 (ix)
	ld	-3 (ix), a
	ld	a, -21 (ix)
	ld	-2 (ix), a
	ld	c, #0x00
00163$:
	ld	a, c
	sub	a, -20 (ix)
	jr	NC, 00202$
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, #<(_fb)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_fb)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_strcpy_
	pop	bc
	inc	c
	jr	00163$
00202$:
	ld	a, -22 (ix)
	ld	-18 (ix), a
	ld	a, -21 (ix)
	ld	-17 (ix), a
	ld	a, -22 (ix)
	ld	-16 (ix), a
	ld	a, -21 (ix)
	ld	-15 (ix), a
	ld	a, -22 (ix)
	ld	-14 (ix), a
	ld	a, -21 (ix)
	ld	-13 (ix), a
00174$:
;qsolve.c:1212: cls();
	call	_cls
;qsolve.c:1213: title(t->title);
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_title
;qsolve.c:1214: for (i = 0; i < nf; i++) {
	ld	c, #0x00
00166$:
	ld	a, c
	sub	a, -20 (ix)
	jr	NC, 00102$
;qsolve.c:1215: puts_(0, i + 1, t->lab[i], i == f);
	ld	a, -1 (ix)
	sub	a, c
	ld	a, #0x01
	jr	Z, 00393$
	xor	a, a
00393$:
	ld	-2 (ix), a
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, c
	inc	b
	push	bc
	ld	a, -2 (ix)
	push	af
	inc	sp
	push	de
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
	pop	bc
;qsolve.c:1216: puts_(12, i + 1, fb[i], 0);
	ld	e, c
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
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_puts_
	pop	bc
;qsolve.c:1214: for (i = 0; i < nf; i++) {
	inc	c
	jr	00166$
00102$:
;qsolve.c:1218: b = fb[f];
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_fb
	add	hl, de
;qsolve.c:1219: len = strlen_(b);
;	spillPairReg hl
;	spillPairReg hl
	ld	-12 (ix), l
	ld	-11 (ix), h
;	spillPairReg hl
;	spillPairReg hl
	call	_strlen_
	ld	-10 (ix), a
;qsolve.c:1220: putg(12 + len, f + 1, '_', 0);
	ld	a, -1 (ix)
	ld	-2 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	ld	a, -10 (ix)
	ld	-9 (ix), a
	add	a, #0x0c
	ld	c, a
	ld	de, #0x5f
	push	de
	ld	a, c
	call	_putg
;qsolve.c:1221: puts_(0, 9, "ENTER:next GRAPH:solve", 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_56
	push	hl
	ld	l, #0x09
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_puts_
;qsolve.c:1222: present();
	call	_present
;qsolve.c:1223: k = key();
	call	_key
;qsolve.c:1224: num = digit(k) < 10 || k == K_DOT || k == K_DIV;
	ld	-8 (ix), a
	call	_digit
	ld	c, a
	ld	a, -8 (ix)
	sub	a, #0x19
	ld	a, #0x01
	jr	Z, 00395$
	xor	a, a
00395$:
	ld	-7 (ix), a
	ld	a, -8 (ix)
	sub	a, #0x0d
	ld	a, #0x01
	jr	Z, 00397$
	xor	a, a
00397$:
	ld	-6 (ix), a
	ld	a, c
	sub	a, #0x0a
	jr	C, 00178$
	bit	0, -7 (ix)
	jr	NZ, 00178$
	bit	0, -6 (ix)
	jr	NZ, 00178$
	xor	a, a
	jr	00179$
00178$:
	ld	a, #0x01
00179$:
	ld	-5 (ix), a
;qsolve.c:1225: if (k == K_CLEAR) { if (len) { b[0] = 0; fr &= ~(1 << f); } else return; }
	ld	b, -2 (ix)
	ld	a, #0x01
	inc	b
	jr	00399$
00398$:
	add	a, a
00399$:
	djnz	00398$
	cpl
	and	a, -19 (ix)
	ld	-4 (ix), a
	ld	a, -8 (ix)
	sub	a, #0x0f
	jr	NZ, 00158$
	ld	a, -10 (ix)
	or	a, a
	jp	Z,00175$
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0x00
	ld	a, -4 (ix)
	ld	-19 (ix), a
	jp	00174$
00158$:
;qsolve.c:1226: else if (k == K_UP) { if (f) f--; }
	ld	a, -8 (ix)
	sub	a, #0x04
	jr	NZ, 00155$
	ld	a, -1 (ix)
	or	a, a
	jp	Z, 00174$
	dec	-1 (ix)
	jp	00174$
00155$:
;qsolve.c:1227: else if (k == K_DOWN) { if (f + 1 < nf) f++; }
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	e, -20 (ix)
	ld	d, #0x00
	ld	a, -1 (ix)
	inc	a
	ld	-3 (ix), a
	inc	bc
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00404$
	xor	a, #0x80
00404$:
	rlca
	and	a,#0x01
	ld	-2 (ix), a
	ld	a, -8 (ix)
	dec	a
	jr	NZ, 00152$
	ld	a, -2 (ix)
	or	a, a
	jp	Z, 00174$
	ld	a, -3 (ix)
	ld	-1 (ix), a
	jp	00174$
00152$:
;qsolve.c:1228: else if (k == K_DEL) { if (len) b[len - 1] = 0; fr &= ~(1 << f); }
	ld	a, -8 (ix)
	sub	a, #0x38
	jr	NZ, 00149$
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00111$
	ld	c, -10 (ix)
	ld	b, #0x00
	dec	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	add	hl, bc
	ld	(hl), #0x00
00111$:
	ld	a, -4 (ix)
	ld	-19 (ix), a
	jp	00174$
00149$:
;qsolve.c:1229: else if (num) {
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00146$
;qsolve.c:1230: if ((fr >> f) & 1) { b[0] = 0; len = 0; fr &= ~(1 << f); }
	ld	b, -1 (ix)
	ld	c, -19 (ix)
	inc	b
	jr	00410$
00409$:
	srl	c
00410$:
	djnz	00409$
	bit	0, c
	jr	Z, 00113$
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0x00
	ld	-10 (ix), #0x00
	ld	a, -4 (ix)
	ld	-19 (ix), a
00113$:
;qsolve.c:1231: if (len < 11) { b[len] = k == K_DOT ? '.' : k == K_DIV ? '/' : '0' + digit(k); b[len + 1] = 0; }
	ld	a, -10 (ix)
	sub	a, #0x0b
	jp	NC, 00174$
	ld	a, -12 (ix)
	add	a, -10 (ix)
	ld	-3 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00183$
	ld	bc, #0x002e
	jr	00184$
00183$:
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00185$
	ld	bc, #0x002f
	jr	00186$
00185$:
	ld	a, -8 (ix)
	call	_digit
	add	a, #0x30
	ld	c, a
	rlca
00186$:
00184$:
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
	ld	c, -10 (ix)
	ld	b, #0x00
	inc	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	add	hl, bc
	ld	(hl), #0x00
	jp	00174$
00146$:
;qsolve.c:1232: } else if (k == K_CHS || k == K_SUB) {                  /* toggle leading minus */
	ld	a, -8 (ix)
	sub	a, #0x11
	jr	Z, 00141$
	ld	a, -8 (ix)
	sub	a, #0x0b
	jr	NZ, 00142$
00141$:
;qsolve.c:1233: fr &= ~(1 << f);
	ld	a, -4 (ix)
	ld	-19 (ix), a
;qsolve.c:1234: if (b[0] == '-') strcpy_(b, b + 1);
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	sub	a, #0x2d
	jr	NZ, 00120$
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	inc	de
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_strcpy_
	jp	00174$
00120$:
;qsolve.c:1235: else if (len < 11) { for (i = len + 1; i; i--) b[i] = b[i - 1]; b[0] = '-'; }
	ld	a, -10 (ix)
	sub	a, #0x0b
	jp	NC, 00174$
	ld	e, -9 (ix)
	inc	e
00169$:
	ld	a, e
	or	a, a
	jr	Z, 00116$
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	d, #0x00
	add	hl, de
	ld	c, e
	ld	b, #0x00
	dec	bc
	ld	a, -12 (ix)
	add	a, c
	ld	c, a
	ld	a, -11 (ix)
	adc	a, b
	ld	b, a
	ld	a, (bc)
	ld	(hl), a
	dec	e
	jr	00169$
00116$:
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0x2d
	jp	00174$
00142$:
;qsolve.c:1236: } else if (k == K_ENTER && f + 1 < nf) f++;
	ld	a, -8 (ix)
	sub	a, #0x09
	ld	a, #0x01
	jr	Z, 00418$
	xor	a, a
00418$:
	ld	-4 (ix), a
	or	a, a
	jr	Z, 00138$
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00138$
	ld	a, -3 (ix)
	ld	-1 (ix), a
	jp	00174$
00138$:
;qsolve.c:1237: else if (k == K_GRAPH || k == K_ENTER) {
	ld	a, -8 (ix)
	sub	a, #0x31
	jr	Z, 00134$
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00174$
00134$:
;qsolve.c:1238: err = 0;
	ld	hl, #_err
	ld	(hl), #0x00
;qsolve.c:1239: for (i = 0; i < nf; i++) {
	ld	-2 (ix), #0x00
00172$:
	ld	a, -2 (ix)
	sub	a, -20 (ix)
	ld	a, #0x00
	rla
	ld	-5 (ix), a
	or	a, a
	jr	Z, 00125$
;qsolve.c:1240: have[i] = fb[i][0] != 0;
	ld	a, #<(_have)
	add	a, -2 (ix)
	ld	c, a
	ld	a, #>(_have)
	adc	a, #0x00
	ld	b, a
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
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, (hl)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	(bc), a
;qsolve.c:1241: qint(i, 0);
	push	bc
	ld	de, #0x0000
	ld	a, -2 (ix)
	call	_qint
	pop	bc
;qsolve.c:1242: if (have[i] && parse(fb[i], i)) break;
	ld	a, (bc)
	or	a, a
	jr	Z, 00173$
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	push	af
	inc	sp
	call	_parse
	or	a, a
	jr	NZ, 00125$
00173$:
;qsolve.c:1239: for (i = 0; i < nf; i++) {
	inc	-2 (ix)
	jr	00172$
00125$:
;qsolve.c:1244: if (i < nf) {
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00127$
;qsolve.c:1245: f = i;
	ld	a, -2 (ix)
	ld	-1 (ix), a
;qsolve.c:1246: notice(err == 2 ? "DIVIDE BY ZERO" : err ? "NUMBER TOO LARGE" : "BAD NUMBER");
	ld	hl, #_err
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00187$
	ld	de, #___str_57
	jr	00188$
00187$:
	ld	hl, #_err
	ld	a, (hl)
	or	a, a
	jr	Z, 00189$
	ld	de, #___str_58
	jr	00190$
00189$:
	ld	de, #___str_59
00190$:
00188$:
	ex	de, hl
	call	_notice
;qsolve.c:1247: continue;
	jp	00174$
00127$:
;qsolve.c:1249: lreset();
	call	_lreset
;qsolve.c:1250: t->fn(t->mode);
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x0007
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	bc, #0x0009
	add	hl, bc
	ld	a, (hl)
	ex	de, hl
	call	___sdcc_call_hl
;qsolve.c:1251: if (err) {
	ld	a, (#_err)
	or	a, a
	jr	Z, 00129$
;qsolve.c:1252: lreset();
	call	_lreset
;qsolve.c:1253: pl("ERROR:");
	ld	hl, #___str_60
	call	_pl
;qsolve.c:1254: pl(err == 2 ? "DIVIDE BY ZERO" : "NUMBER TOO LARGE");
	ld	a, (#_err)
	sub	a, #0x02
	jr	NZ, 00191$
	ld	hl, #___str_57
	jr	00192$
00191$:
	ld	hl, #___str_58
00192$:
	call	_pl
00129$:
;qsolve.c:1256: if (col) nl();
	ld	a, (#_col)
	or	a, a
	jr	Z, 00131$
	call	_nl
00131$:
;qsolve.c:1257: if (!viewer()) return;
	call	_viewer
	or	a, a
	jp	NZ, 00174$
00175$:
;qsolve.c:1260: }
	ld	sp, ix
	pop	ix
	ret
___str_56:
	.ascii "ENTER:next GRAPH:solve"
	.db 0x00
___str_57:
	.ascii "DIVIDE BY ZERO"
	.db 0x00
___str_58:
	.ascii "NUMBER TOO LARGE"
	.db 0x00
___str_59:
	.ascii "BAD NUMBER"
	.db 0x00
___str_60:
	.ascii "ERROR:"
	.db 0x00
;qsolve.c:1278: void app_main(void)
;	---------------------------------
; Function app_main
; ---------------------------------
_app_main::
	call	___sdcc_enter_ix
	push	af
;qsolve.c:1281: for (i = 0; i < 23; i++) if (T[i].fn) { items[n] = T[i].title; idx[n++] = i; }
	ld	bc, #0x0
00107$:
	ld	e, c
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_T
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x0008
	add	hl, bc
	pop	bc
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	or	a, l
	jr	Z, 00108$
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	a, l
	add	a, #<(_items)
	ld	-2 (ix), a
	ld	a, h
	adc	a, #>(_items)
	ld	-1 (ix), a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	e, b
	inc	b
	ld	hl, #_idx
	ld	d, #0x00
	add	hl, de
	ld	(hl), c
00108$:
	inc	c
	ld	a, c
	sub	a, #0x17
	jr	C, 00107$
00109$:
;qsolve.c:1283: s = menu(APPTITLE, items, n);
	push	bc
	push	bc
	inc	sp
	ld	hl, #_items
	push	hl
	ld	hl, #___str_61
	call	_menu
	pop	bc
;qsolve.c:1284: if (s == 255) return;
	ld	e, a
	inc	a
	jr	Z, 00111$
	jr	00105$
00105$:
;qsolve.c:1285: run(idx[s]);
	ld	hl, #_idx
	ld	d, #0x00
	add	hl, de
	ld	c, (hl)
	push	bc
	ld	a, c
	call	_run
	pop	bc
	jr	00109$
00111$:
;qsolve.c:1287: }
	pop	af
	pop	ix
	ret
_mainmenu:
	.dw __str_62
	.dw __str_63
	.dw __str_64
	.dw __str_65
	.dw __str_66
	.dw __str_67
	.dw __str_68
	.dw __str_69
	.dw __str_70
	.dw __str_71
	.dw __str_72
	.dw __str_73
	.dw __str_74
_formmenu:
	.dw __str_75
	.dw __str_76
	.dw __str_77
_cxmenu:
	.dw __str_78
	.dw __str_79
	.dw __str_80
	.dw __str_81
	.dw __str_82
	.dw __str_83
	.dw __str_84
___str_61:
	.ascii "QUAD g4"
	.db 0x00
__str_62:
	.ascii "Vertex+Point>Parabola"
	.db 0x00
__str_63:
	.ascii "Transformations"
	.db 0x00
__str_64:
	.ascii "Solve by Factoring"
	.db 0x00
__str_65:
	.ascii "Solve by Sq Roots"
	.db 0x00
__str_66:
	.ascii "Standard>Vertex Form"
	.db 0x00
__str_67:
	.ascii "Quadratic Formula"
	.db 0x00
__str_68:
	.ascii "Parabola Features"
	.db 0x00
__str_69:
	.ascii "Factor Quadratic"
	.db 0x00
__str_70:
	.ascii "Find Zeros"
	.db 0x00
__str_71:
	.ascii "Complex Numbers"
	.db 0x00
__str_72:
	.ascii "Discriminant"
	.db 0x00
__str_73:
	.ascii "Find b: 1 Solution"
	.db 0x00
__str_74:
	.ascii "Projectile Maximum"
	.db 0x00
__str_75:
	.ascii "ax|+bx+c"
	.db 0x00
__str_76:
	.ascii "a(x-h)|+k"
	.db 0x00
__str_77:
	.ascii "a(x-p)(x-q)"
	.db 0x00
__str_78:
	.ascii "z1 + z2"
	.db 0x00
__str_79:
	.ascii "z1 - z2"
	.db 0x00
__str_80:
	.ascii "z1 * z2"
	.db 0x00
__str_81:
	.ascii "z1 / z2"
	.db 0x00
__str_82:
	.ascii "Conjugate"
	.db 0x00
__str_83:
	.ascii "i^n"
	.db 0x00
__str_84:
	.ascii "Simplify sqrt(n)"
	.db 0x00
;qsolve.c:1309: void main(void) { app_main(); }
;	---------------------------------
; Function main
; ---------------------------------
_main::
	jp	_app_main
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
