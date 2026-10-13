#!/bin/sh
# Phase 3 of ptw_demo_part2.tape: try to fix the buffering with
# stdbuf -o L (force line-buffered output). This doesn't help here,
# because stdbuf's trick (overriding libc's stream buffering via
# LD_PRELOAD) doesn't affect CPython's own internal io-layer buffering
# decision -- Python still sees that stdout isn't a tty and
# fully-buffers regardless, so the output still arrives in one burst
# at the end. Pauses 1s after it finishes, then clears the screen (so
# phases 2-4 each get their own clean screen instead of needing a tall
# canvas to hold all three at once).

printf '\033[1;33m$ stdbuf -o L python3 best_articles_on_hackernews.py | grep $(date +%%Y-%%m-%%d)\033[0m\n'
stdbuf -o L python3 best_articles_on_hackernews.py | grep "$(date +%Y-%m-%d)"
sleep 1
clear

printf '\033[1;32m--- phase3 done ---\033[0m\n'
