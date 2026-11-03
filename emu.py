#!/usr/bin/env python3
"""Run the real Z80 binary (qsolve.bin) under z88dk-ticks with a stubbed TI ROM + scripted keys,
and decode the final LCD framebuffer back into text.  Also drives the host build for comparison."""
import subprocess, sys, os, re, struct, tempfile
HERE = os.path.dirname(os.path.abspath(__file__))
TICKS = r"C:\z88\z88dk\bin\z88dk-ticks.exe"
Z80ASM = r"C:\z88\z88dk\bin\z88dk-z80asm.exe"
KEYS = {'-':0x11,'.':0x19,'/':0x0D,'E':9,'G':0x31,'C':0x0F,'D':0x38,'u':4,'d':1,'m':0x0B}
DIG = [0x21,0x22,0x1A,0x12,0x23,0x1B,0x13,0x24,0x1C,0x14]

def keycodes(s):
    return bytes(DIG[int(c)] if c.isdigit() else KEYS[c] for c in s)

def font():
    src = open(os.path.join(HERE,'font.h')).read()
    nums = list(map(int, re.findall(r'\d+', src.split('{',1)[1])))
    return [nums[i*5:i*5+5] for i in range(95)]
FONT = font()
SPECIAL = {'{':'±','|':'²','}':'√','`':'≈','~':'>'}

def decode(fb):
    rows = []
    for r in range(10):
        line = ''; inv = 0
        for c in range(24):
            nib = []
            for y in range(6):
                b = fb[(r*6+y)*12 + c//2]
                nib.append((b >> 4) if c % 2 == 0 else (b & 15))
            ch = None
            for flip in (0, 15):
                cell = [n ^ flip for n in nib]
                for i, g in enumerate(FONT):
                    if all(cell[y] == (g[y] << 1) & 15 for y in range(5)) and cell[5] == 0:
                        ch = chr(32 + i); 
                        if flip: inv += 1
                        break
                if ch: break
            if ch is None: ch = '?'
            line += SPECIAL.get(ch, ch)
        rows.append(line.rstrip() + ('   [inv]' if inv > 10 else ''))
    return rows

def stub_image(start):
    asm = f"""
        org 0
        di
        ld sp,0xFFF0
        call {start}
        jp 0x0100
        defs 0x28-ASMPC
        jp 0x0200
        defs 0x38-ASMPC
        ei
        reti
        defs 0x100-ASMPC
spin:   halt
        jr spin
        defs 0x200-ASMPC
        ex (sp),hl
        push de
        push af
        ld e,(hl)
        inc hl
        ld d,(hl)
        inc hl
        ld a,e
        cp 0x18
        jr nz,other
        ld a,d
        cp 0x40
        jr nz,other
        push hl
        ld hl,(0xEFFE)
        ld a,(hl)
        or a
        jp z,0x0100
        inc hl
        ld (0xEFFE),hl
        ld (0xEFFD),a
        pop hl
        pop af
        ld a,(0xEFFD)
        pop de
        ex (sp),hl
        ret
other:  ld a,0xFF
        ld (0xEFFC),a
        jp 0x0100
        defs 0x4092-ASMPC
        ret
"""
    d = tempfile.mkdtemp()
    p = os.path.join(d, 'stub.asm'); open(p, 'w').write(asm)
    subprocess.run([Z80ASM, '-b', p], check=True, capture_output=True)
    return open(os.path.join(d, 'stub.bin'), 'rb').read()

def entry_addr():
    m = open(os.path.join(HERE, os.environ.get('NAME','qsolve')+'.map')).read()
    return int(re.search(r'([0-9A-F]{8})\s+_entry', m).group(1), 16)

_stub = None
def run_z80(keys, maxsec=60):
    global _stub
    code = open(os.path.join(HERE, os.environ.get('NAME','qsolve')+'.bin'), 'rb').read()
    if _stub is None: _stub = stub_image(hex(entry_addr()).replace('0x', '0x'))
    mem = bytearray(65536)
    mem[:len(_stub)] = _stub
    mem[0x9D95:0x9D95+len(code)] = code
    kc = keycodes(keys) + b'\0'
    mem[0xEFFE:0x10000] = b''.ljust(0, b'\0') or mem[0xEFFE:0x10000]
    mem[0xEFFE] = 0x00; mem[0xEFFF] = 0xF0
    mem[0xF000:0xF000+len(kc)] = kc
    img = os.path.join(HERE, 'img_emu.bin'); open(img, 'wb').write(mem)
    out = os.path.join(HERE, 'out_emu.bin')
    if os.path.exists(out): os.remove(out)
    r = subprocess.run([TICKS, '-mz80', '-pc', '0000', '-int', '20000', '-counter', '150000000', '-output', 'out_emu.bin', 'img_emu.bin'],
                       capture_output=True, timeout=maxsec, cwd=HERE)
    dump = open(out, 'rb').read()
    if dump[0xEFFC] == 0xFF: raise RuntimeError('unexpected ROM call')
    return decode(dump[0x9340:0x9340+768])

def run_host(keys):
    exe = os.path.join(HERE, 'uitest')
    r = subprocess.run(['wsl', '-d', 'Ubuntu', '-u', 'root', '--cd', HERE, '--', './'+os.environ.get('HOSTEXE','uitest'), keys],
                       capture_output=True, timeout=60)
    return decode(open(os.path.join(HERE, 'host_screen.bin'), 'rb').read())

if __name__ == '__main__':
    k = sys.argv[1]
    for l in run_z80(k): print(l)
