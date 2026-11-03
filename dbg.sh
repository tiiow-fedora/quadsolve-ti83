cd "$(dirname "$0")"
CF="-mz80 --opt-code-size --reserve-regs-iy --fomit-frame-pointer --max-allocs-per-node 3000"
LF="-mz80 --no-std-crt0 --code-loc 0x9D95 --data-loc 0x9872"
sdcc $CF -c qdbg.c -o qdbg.rel 2>&1 | grep -i error
sdcc $LF crt0.rel qdbg.rel -o qdbg.ihx >/dev/null 2>&1
SZ=$(grep -E '^_CODE +[0-9A-F]{8} +[0-9A-F]{8}' qdbg.map | head -1 | awk '{print $3}')
HOME=$(printf '0x%04X' $((0x9D95 + 0x$SZ)))
sdcc $LF -Wl-b_HOME=$HOME crt0.rel qdbg.rel -o qdbg.ihx 2>&1 | grep -i error
grep -E " _(T|fb|run|fresh|lbl_vp|R|menu|main|entry)$" qdbg.map
