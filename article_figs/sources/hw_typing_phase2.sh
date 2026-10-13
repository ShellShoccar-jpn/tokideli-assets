#!/bin/sh
# Phase 2 of hw_typing_demo.tape: just cat the recorded log so
# viewers can see its raw content (calendar-time timestamp + typed
# character per line) before it gets replayed. Pauses 3s for that to
# be readable, then clears the screen.

printf '\033[1;33m$ cat hw.log\033[0m\n'
cat hw.log
sleep 3
clear

printf '\033[1;32m--- phase2 done ---\033[0m\n'
