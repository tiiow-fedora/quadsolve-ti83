#!/usr/bin/env python3
"""Turn qsolve.ihx into ALGEBRA.8xp (MirageOS program for the TI-83+/84+) and a raw image."""
import sys, struct
BASE = 0x9D95

def read_ihx(path):
    mem = {}
    for line in open(path):
        line = line.strip()
        if not line.startswith(':'): continue
        n = int(line[1:3], 16); addr = int(line[3:7], 16); typ = int(line[7:9], 16)
        if typ == 0:
            for i in range(n): mem[addr + i] = int(line[9 + 2*i: 11 + 2*i], 16)
    return mem

def image(path):
    mem = read_ihx(path)
    lo, hi = min(mem), max(mem)
    assert lo == BASE, hex(lo)
    out = bytearray(hi - lo + 1)
    miss = 0
    for a in range(lo, hi + 1):
        if a in mem: out[a - lo] = mem[a]
        else: miss += 1
    return bytes(out), miss

def make_8xp(code, name="ALGEBRA", comment="Quad Solver for MirageOS"):
    body = b"\xBB\x6D" + code                      # AsmPrgm token + program
    data = struct.pack("<H", len(body)) + body
    nm = name.encode().ljust(8, b"\0")
    entry = struct.pack("<HHB", 13, len(data), 0x06) + nm + b"\x00\x00" + struct.pack("<H", len(data)) + data
    hdr = b"**TI83F*" + b"\x1A\x0A\x00" + comment.encode().ljust(42, b"\0")[:42]
    return hdr + struct.pack("<H", len(entry)) + entry + struct.pack("<H", sum(entry) & 0xFFFF)

if __name__ == "__main__":
    ihx = sys.argv[1] if len(sys.argv) > 1 else "qsolve.ihx"
    code, miss = image(ihx)
    open("qsolve.bin", "wb").write(code)
    open("ALGEBRA.8xp", "wb").write(make_8xp(code))
    print("image %d bytes (gaps filled with 0: %d); ALGEBRA.8xp %d bytes" % (len(code), miss, len(make_8xp(code))))
