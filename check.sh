#!/bin/bash
cd "$(dirname "$0")"
set -e
gcc -O1 -Wall -Wno-unused -o test test.c -lm
gcc -O1 -Wno-unused -o uitest uitest.c -lm
./test | grep -v PARSE | tail -12
bash build.sh | head -3
