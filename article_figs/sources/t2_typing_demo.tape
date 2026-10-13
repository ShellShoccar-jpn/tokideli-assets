# t2_typing_demo.tape - regenerate ../images/t2_typing_demo.gif with:
#   vhs t2_typing_demo.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools and
#  "typeliner"/"linets"/"tscat"/"flashbel" on PATH. See ../../demo.tape
#  for how this kind of recording is produced without root access.)
#
# Phase 1 below types 20 "d" characters directly into the live
# terminal (not via a wrapper script) with Sleep durations matching a
# real human's recorded "Terminator 2" theme typing rhythm (4 groups
# of 5 taps each), because typeliner only does anything interesting
# when its input is a real tty -- a script feeding it synthetic stdin
# wouldn't exercise the same code path. TypingSpeed is set near-zero
# so each single-character Type command itself adds negligible delay,
# leaving the explicit Sleep durations as the sole source of
# inter-keystroke timing.
#
# Each later phase's script ends with a pause and a "clear", so the
# terminal's visible content never accumulates across phases and
# Height can stay a normal size (see sibling typing_337_demo.tape for
# why that matters in this recording pipeline).

Output ../images/t2_typing_demo.gif

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 700
Set Padding 20
Set Theme "Dracula"
Set TypingSpeed 1ms

# --- Phase 1: record the typing (typeliner -e | linets -3Z > T2_typing.log) ---

Type "printf '\033[1;33m$ typeliner -e | linets -3Z > T2_typing.log\033[0m\n'; typeliner -e | linets -3Z > T2_typing.log"
Enter
Sleep 500ms
Type "d"
Sleep 169ms
Type "d"
Sleep 305ms
Type "d"
Sleep 317ms
Type "d"
Sleep 193ms
Type "d"
Sleep 1040ms
Type "d"
Sleep 136ms
Type "d"
Sleep 340ms
Type "d"
Sleep 274ms
Type "d"
Sleep 174ms
Type "d"
Sleep 1057ms
Type "d"
Sleep 157ms
Type "d"
Sleep 303ms
Type "d"
Sleep 340ms
Type "d"
Sleep 180ms
Type "d"
Sleep 1074ms
Type "d"
Sleep 134ms
Type "d"
Sleep 351ms
Type "d"
Sleep 283ms
Type "d"
Sleep 175ms
Type "d"
Ctrl+D
Sleep 500ms

# --- Phase 2: cat the recorded log, pause, clear ---

Type "sh t2_typing_phase2.sh"
Enter
Wait+Screen@30s /--- phase2 done ---/
Sleep 300ms

# --- Phase 3: replay at 1x speed, pause, clear ---

Type "sh t2_typing_phase3.sh"
Enter
Wait+Screen@30s /--- phase3 done ---/
Sleep 300ms

# --- Phase 4: replay at 2x speed, pause, clear ---

Type "sh t2_typing_phase4.sh"
Enter
Wait+Screen@30s /--- phase4 done ---/
Sleep 300ms

# --- Phase 5: replay at 1/2x speed (final, no clear) ---

Type "sh t2_typing_phase5.sh"
Enter
Wait+Screen@30s /--- phase5 done ---/
Sleep 1000ms
