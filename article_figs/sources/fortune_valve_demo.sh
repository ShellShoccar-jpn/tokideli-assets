#!/bin/sh
# Demo script recorded by fortune_valve_demo.tape (via vhs) for
# ../images/fortune_valve_demo.gif.
#
# Picks one message with "fortune -l -n 200", then replays that same
# text through "valve -c" at three different byte rates (300bps,
# 1200bps, 9600bps) back-to-back, to show how valve paces byte-unit
# output. ("-l -n 200" can occasionally pick a very long quote, so we
# retry until the pick is short enough to keep the recording a
# reasonable length.)

while :; do
  MSG=$(fortune -l -n 200)
  [ "$(printf '%s' "$MSG" | wc -c)" -le 400 ] && break
done

printf '\033[1;33m$ fortune -l -n 200\033[0m\n'
printf '%s\n' "$MSG"

printf '\n\033[1;33m$ ... | valve -c 300bps\033[0m\n'
printf '%s\n' "$MSG" | valve -c 300bps
printf '\n\033[1;33m$ ... | valve -c 1200bps\033[0m\n'
printf '%s\n' "$MSG" | valve -c 1200bps
printf '\n\033[1;33m$ ... | valve -c 9600bps\033[0m\n'
printf '%s\n' "$MSG" | valve -c 9600bps
