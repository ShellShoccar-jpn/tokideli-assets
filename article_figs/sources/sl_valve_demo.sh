#!/bin/sh
# Demo script recorded by sl_valve_demo.tape (via vhs) for
# ../images/sl_valve_demo.gif.
#
# Pipes the classic "sl" (steam locomotive) joke command's output
# through "valve 9600bps" (byte-unit pacing is valve's default mode),
# to show sl's screen-redrawing animation trickling out in slow
# motion, one byte at a time, instead of at sl's own (much faster)
# internal animation pace. Companion recording to sl_demo.gif, which
# runs the same command on its own for comparison.

printf '\033[1;33m$ sl | valve 9600bps\033[0m\n'
sl | valve 9600bps
