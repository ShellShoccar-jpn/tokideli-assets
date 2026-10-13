#!/bin/sh
# Phase 3 (final) of hw_typing_demo.tape: replay hw.log with tscat's
# typing mode (-y), reproducing the original typed text and timing
# (-Z paces relative to the first line's own timestamp).

printf '\033[1;33m$ tscat -yZ hw.log\033[0m\n'
tscat -yZ hw.log

printf '\n\033[1;32m--- phase3 done ---\033[0m\n'
