#!/bin/sh
# Phase 4 of typing_337_demo.tape: replay 337_typing.log at 2x speed
# (each timestamp halved) with the same BEL/flashbel trick as phase 3.
#
# Note: the awk program below reads "print", not the "orint" typo
# that appeared in the originally-specified one-liner -- "orint" is
# not a valid awk command and the line wouldn't run as given.
#
# Pauses 1s after playback finishes, then clears the screen so the
# recording doesn't grow tall.

printf '\033[1;33m$ cat 337_typing.log | awk '\''{print $1/2,$2}'\'' | sed $(printf '\''s/$/\\007/'\'') | tscat -zZ\033[0m\n'
cat 337_typing.log | awk '{print $1/2,$2}' | sed "$(printf 's/$/\007/')" | tscat -zZ | flashbel
sleep 1
clear

printf '\033[1;32m--- phase4 done ---\033[0m\n'
