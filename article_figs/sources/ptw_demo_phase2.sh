#!/bin/sh
# Phase 2 of ptw_demo_part2.tape: same script, but now piped into
# grep. Since stdout is no longer a tty, Python switches to
# fully-buffered mode, so nothing reaches grep (and the screen) until
# the script exits and flushes everything at once -- all matching
# lines appear in a single burst instead of streaming in as they're
# fetched. Pauses 1s after it finishes, then clears the screen (so
# phases 2-4 each get their own clean screen instead of needing a tall
# canvas to hold all three at once).

printf '\033[1;33m$ python3 best_articles_on_hackernews.py | grep $(date +%%Y-%%m-%%d)\033[0m\n'
python3 best_articles_on_hackernews.py | grep "$(date +%Y-%m-%d)"
sleep 1
clear

printf '\033[1;32m--- phase2 done ---\033[0m\n'
