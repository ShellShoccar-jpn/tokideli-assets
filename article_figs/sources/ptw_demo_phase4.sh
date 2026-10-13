#!/bin/sh
# Phase 4 (final) of ptw_demo_part2.tape: this time use ptw instead of
# stdbuf. ptw gives the wrapped command a real pseudo-terminal as its
# stdout, so Python's isatty() check on stdout succeeds and it goes
# back to line-buffered output on its own -- matching lines stream
# into grep (and the screen) as soon as they're fetched again, exactly
# like phase 1.

printf '\033[1;33m$ ptw python3 best_articles_on_hackernews.py | grep $(date +%%Y-%%m-%%d)\033[0m\n'
ptw python3 best_articles_on_hackernews.py | grep "$(date +%Y-%m-%d)"

printf '\n\033[1;32m--- phase4 done ---\033[0m\n'
