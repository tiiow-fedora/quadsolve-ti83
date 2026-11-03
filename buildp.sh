#!/bin/bash
# usage: buildp.sh PART(0|1|2) OUTNAME
set -e
cd "$(dirname "$0")"
P=$1; N=$2
case $P in 1) D="Quad Solver 1";; 2) D="Quad Solver 2";; 3) D="Quad Solver 3";; 4) D="Quad Solver 4";; 4) D="Quad Solver 4";; *) D="Quad Solver";; esac
echo "        .asciz \"$D\"" > desc.inc
CF="-mz80 --opt-code-size --reserve-regs-iy -DPART=$P"
LF="-mz80 --no-std-crt0 --code-loc 0x9D95 --data-loc 0x9872"
sdasz80 -o crt0.rel crt0.s
sdcc $CF -c qsolve.c -o $N.rel 2>&1 | grep -i error || true
sdcc $LF crt0.rel $N.rel -o $N.ihx >/dev/null 2>&1
SZ=$(grep -E '^_CODE +[0-9A-F]{8} +[0-9A-F]{8}' $N.map | head -1 | awk '{print $3}')
HOME=$(printf '0x%04X' $((0x9D95 + 0x$SZ)))
sdcc $LF -Wl-b_HOME=$HOME crt0.rel $N.rel -o $N.ihx 2>&1 | grep -i error || true
echo "$N: $(grep -E '^(_CODE|_HOME) +[0-9A-F]{8}' $N.map | awk '{print $1,$3}' | tr '\n' ' ')"
