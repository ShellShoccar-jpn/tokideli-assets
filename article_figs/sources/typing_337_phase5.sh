#!/bin/sh
# Phase 5 (final) of typing_337_demo.tape: replay 337_typing.log at
# 1/2 speed (each timestamp doubled) with the same BEL/flashbel trick
# as phase 3. This is the last phase, so no trailing clear is needed.
#
# Note: the awk program below reads "print", not the "orint" typo
# that appeared in the originally-specified one-liner -- "orint" is
# not a valid awk command and the line wouldn't run as given.

printf '\033[1;33m$ cat 337_typing.log | awk '\''{print $1*2,$2}'\'' | sed $(printf '\''s/$/\\007/'\'') | tscat -zZ\033[0m\n'
cat 337_typing.log | awk '{print $1*2,$2}' | sed "$(printf 's/$/\007/')" | tscat -zZ | flashbel

printf '\n\033[1;32m--- phase5 done ---\033[0m\n'
