#!/bin/sh
# Demo script recorded by sl_demo.tape (via vhs) for
# ../images/sl_demo.gif.
#
# Just runs the classic "sl" (steam locomotive) joke command on its
# own, at its own (unthrottled) animation pace. Companion recording to
# sl_valve_demo.gif, which pipes the same command through
# "valve 9600bps" to show the same animation in slow motion.

printf '\033[1;33m$ sl\033[0m\n'
sl
