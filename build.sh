#!/bin/bash
# Two-pass build: the first pass finds the size of _CODE so _HOME (library helpers) can be placed right after it.
set -e
cd "$(dirname "$0")"
CF="-mz80 --opt-code-size --reserve-regs-iy"
LF="-mz80 --no-std-crt0 --code-loc 0x9D95 --data-loc 0x9872"
sdasz80 -o crt0.rel crt0.s
sdcc $CF -c qsolve.c -o qsolve.rel 2>&1 | grep -v -i "warning" || true
sdcc $LF crt0.rel qsolve.rel -o qsolve.ihx >/dev/null 2>&1
SZ=$(grep -E '^_CODE +[0-9A-F]{8} +[0-9A-F]{8}' qsolve.map | head -1 | awk '{print $3}')
HOME=$(printf '0x%04X' $((0x9D95 + 0x$SZ)))
sdcc $LF -Wl-b_HOME=$HOME crt0.rel qsolve.rel -o qsolve.ihx 2>&1 | grep -v -i warning || true
grep -E '^(_CODE|_HOME|_DATA) +[0-9A-F]{8}' qsolve.map
grep -E ' _entry| _main$' qsolve.map | head
