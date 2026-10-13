#!/bin/sh
# Phase 3 of typing_337_demo.tape: replay 337_typing.log (written by
# the keystroke-recording phase) at its original (1x) speed, turning
# each typed character into a BEL so the flash trick is visible.
#
# The displayed header is the literal one-liner as specified; the
# command actually run appends "| flashbel" at the end, since no
# terminal in this recording pipeline flashes on BEL by itself (see
# flashbel.c for why). flashbel just wraps each BEL with an OSC 11
# background-color flash and otherwise passes bytes through unchanged.
#
# Pauses 1s after playback finishes, then clears the screen so the
# recording doesn't grow tall.

printf '\033[1;33m$ cat 337_typing.log | sed $(printf '\''s/$/\\007/'\'') | tscat -zZ\033[0m\n'
cat 337_typing.log | sed "$(printf 's/$/\007/')" | tscat -zZ | flashbel
sleep 1
clear

printf '\033[1;32m--- phase3 done ---\033[0m\n'
