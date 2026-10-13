# typing_337_demo.tape - regenerate ../images/typing_337_demo.gif with:
#   vhs typing_337_demo.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools and
#  "typeliner"/"linets"/"tscat"/"flashbel" on PATH. See ../../demo.tape
#  for how this kind of recording is produced without root access.)
#
# Phase 1 below types 13 "@" characters directly into the live
# terminal (not via a wrapper script) with Sleep durations matching a
# real human's recorded 3-3-7-byoshi typing rhythm, because typeliner
# only does anything interesting when its input is a real tty -- a
# script feeding it synthetic stdin wouldn't exercise the same code
# path. TypingSpeed is set near-zero so each single-character Type
# command itself adds negligible delay, leaving the explicit Sleep
# durations as the sole source of inter-keystroke timing.
#
# Each later phase's script ends with a pause and a "clear", so the
# terminal's visible content never accumulates across phases and
# Height can stay a normal size -- an earlier version of this
# recording kept everything on one ever-growing screen and needed a
# very tall (2200px) canvas to avoid a scroll, because this recording
# pipeline (vhs/ttyd + a headless browser) is known to hang once a
# scroll becomes necessary (see wget_valve_demo.tape for the full
# writeup of that issue). Clearing between phases sidesteps the need
# for that tall canvas in the first place.

Output ../images/typing_337_demo.gif

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 700
Set Padding 20
Set Theme "Dracula"
Set TypingSpeed 1ms

# --- Phase 1: record the typing (typeliner -e | linets -3Z > 337_typing.log) ---
# "-e" enables typeliner's local echo, so the typed "@" characters
# are actually visible on screen as they're typed (previously omitted
# by mistake).

Type "printf '\033[1;33m$ typeliner -e | linets -3Z > 337_typing.log\033[0m\n'; typeliner -e | linets -3Z > 337_typing.log"
Enter
Sleep 500ms
Type "@"
Sleep 340ms
Type "@"
Sleep 338ms
Type "@"
Sleep 598ms
Type "@"
Sleep 328ms
Type "@"
Sleep 370ms
Type "@"
Sleep 601ms
Type "@"
Sleep 357ms
Type "@"
Sleep 296ms
Type "@"
Sleep 298ms
Type "@"
Sleep 296ms
Type "@"
Sleep 281ms
Type "@"
Sleep 343ms
Type "@"
Ctrl+D
Sleep 500ms

# --- Phase 2: cat the recorded log, pause, clear ---

Type "sh typing_337_phase2.sh"
Enter
Wait+Screen@30s /--- phase2 done ---/
Sleep 300ms

# --- Phase 3: replay at 1x speed, pause, clear ---

Type "sh typing_337_phase3.sh"
Enter
Wait+Screen@30s /--- phase3 done ---/
Sleep 300ms

# --- Phase 4: replay at 2x speed, pause, clear ---

Type "sh typing_337_phase4.sh"
Enter
Wait+Screen@30s /--- phase4 done ---/
Sleep 300ms

# --- Phase 5: replay at 1/2x speed (final, no clear) ---

Type "sh typing_337_phase5.sh"
Enter
Wait+Screen@30s /--- phase5 done ---/
Sleep 1000ms
