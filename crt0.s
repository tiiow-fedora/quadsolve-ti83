; MirageOS program header + startup.  Image is loaded so that the 'ret' is at 0x9D95.
        .module crt0
        .globl _main
        .area _HEADER
        .area _HOME
        .area _CODE
        .area _INITIALIZER
        .area _GSINIT
        .area _GSFINAL
        .area _DATA
        .area _INITIALIZED
        .area _BSEG
        .area _BSS
        .area _HEAP
        .area _HEADER
        ret                     ; header byte 1: TI-OS must not run it
        .db 1                   ; header byte 2: MirageOS program
        .include "icon.inc"     ; 15x15 icon, 30 bytes
        .include "desc.inc"
_entry::
        ld iy,#0x89F0
        call _main
        ld iy,#0x89F0
        ret
