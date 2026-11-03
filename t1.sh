cd "$(dirname "$0")"
for FL in "--reserve-regs-iy --fomit-frame-pointer" "--fomit-frame-pointer" "" "--reserve-regs-iy"; do
 sdcc -mz80 --opt-code-size $FL -S qsolve.c -o /tmp/q.asm 2>/dev/null
 echo "== [$FL]"; awk '/^_menu:/,/^_viewer/' /tmp/q.asm | tail -12 | head -14
done
