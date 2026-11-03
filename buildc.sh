#!/bin/bash
# usage: buildc.sh NAME "Description" TITLE tool tool ...
set -e
cd "$(dirname "$0")"
N=$1; D=$(echo "$2" | tr _ " "); T=$(echo "$3" | tr _ " "); shift 3
echo "        .asciz \"$D\"" > desc.inc
DEFS="-DCUSTOM $EXTRA"
for t in "$@"; do DEFS="$DEFS -DUSE_$t=1"; done
echo "#define APPTITLE \"$T\"" > apptitle.h
CF="-mz80 --opt-code-size --reserve-regs-iy --max-allocs-per-node 100000 -DHAVE_APPTITLE $DEFS"
LF="-mz80 --no-std-crt0 --code-loc 0x9D95 --data-loc 0x9872"
sdasz80 -o crt0.rel crt0.s
sdcc $CF -c qsolve.c -o $N.rel 2>&1 | grep -i error || true
LF0="-mz80 --no-std-crt0 --data-loc 0x9872"
sdcc $LF0 -Wl-b_HEADER=0x9D95 -Wl-b_HOME=0xA000 -Wl-b_CODE=0xB000 crt0.rel $N.rel -o $N.ihx >/dev/null 2>&1
HS=$(grep -E '^_HEADER +[0-9A-F]{8} +[0-9A-F]{8}' $N.map | head -1 | awk '{print $3}')
MS=$(grep -E '^_HOME +[0-9A-F]{8} +[0-9A-F]{8}' $N.map | head -1 | awk '{print $3}')
H=$((0x9D95)); HOMEA=$((H + 0x$HS)); CODEA=$((HOMEA + 0x$MS))
sdcc $LF0 -Wl-b_HEADER=$H -Wl-b_HOME=$HOMEA -Wl-b_CODE=$CODEA crt0.rel $N.rel -o $N.ihx 2>&1 | grep -i error || true
echo "$N: header 0x$HS home 0x$MS code@$(printf '%X' $CODEA)"
