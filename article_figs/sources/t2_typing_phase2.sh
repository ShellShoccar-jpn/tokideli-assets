#!/bin/sh
# Phase 2 of t2_typing_demo.tape: just cat the recorded log so
# viewers can see its raw content (timestamp + typed character per
# line) before it gets replayed. Pauses 3s for that to be readable,
# then clears the screen so the recording doesn't grow tall.

printf '\033[1;33m$ cat T2_typing.log\033[0m\n'
cat T2_typing.log
sleep 3
clear

printf '\033[1;32m--- phase2 done ---\033[0m\n'
