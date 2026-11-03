cd "$(dirname "$0")"
for fl in "--opt-code-size --reserve-regs-iy --fomit-frame-pointer" "--opt-code-size --reserve-regs-iy" "--opt-code-size --reserve-regs-iy --sdcccall 0" "--opt-code-size --reserve-regs-iy --sdcccall 1" "--opt-code-size --reserve-regs-iy --sdcccall 1 --fomit-frame-pointer"; do
  rm -f /tmp/ft.*; sdcc -mz80 --no-std-crt0 $fl --max-allocs-per-node 3000 --code-loc 0x9D95 --data-loc 0x9872 crt0.rel qsolve.c -o /tmp/ft.ihx >/dev/null 2>&1
  echo "$fl => $(grep -E '^_CODE ' /tmp/ft.map | awk '{print $3}') $(grep -E '^_HOME ' /tmp/ft.map | awk '{print $3}')"
done
