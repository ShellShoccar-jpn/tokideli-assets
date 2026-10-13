#!/bin/sh
# Phase 1 of ptw_demo_part1.tape: run best_articles_on_hackernews.py directly
# (stdout is the terminal itself, a tty), so Python's own stdout
# buffering is line-buffered and each matching article is printed as
# soon as it's fetched. Pauses 1s after it finishes, then clears the
# screen.

printf '\033[1;33m$ python3 best_articles_on_hackernews.py\033[0m\n'
python3 best_articles_on_hackernews.py
sleep 1
clear

printf '\033[1;32m--- phase1 done ---\033[0m\n'
