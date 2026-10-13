# hw_typing_demo.tape - regenerate ../images/hw_typing_demo.gif with:
#   vhs hw_typing_demo.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools and
#  "typeliner"/"linets"/"tscat" on PATH. See ../../demo.tape for how this
#  kind of recording is produced without root access.)
#
# Phase 1 below types "hello,\nworld!\n" directly into the live
# terminal (not via a wrapper script) with Sleep durations matching a
# real human's recorded typing, because typeliner only does anything
# interesting when its input is a real tty -- a script feeding it
# synthetic stdin wouldn't exercise the same code path. TypingSpeed is
# set near-zero so each single-character Type command itself adds
# negligible delay, leaving the explicit Sleep durations as the sole
# source of inter-keystroke timing. The two newlines are sent as real
# Enter keypresses (not part of a Type string), since typeliner reads
# raw terminal input one key at a time and a literal Enter here is
# consumed by typeliner itself, not the outer shell (the shell's own
# Enter, which launches the typeliner|linets pipeline, already
# happened earlier).

Output ../images/hw_typing_demo.gif

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 560
Set Padding 20
Set Theme "Dracula"
Set TypingSpeed 1ms

# --- Phase 1: record the typing (typeliner -e | linets -3 > hw.log) ---

Type "printf '\033[1;33m$ typeliner -e | linets -3 > hw.log\033[0m\n'; typeliner -e | linets -3 > hw.log"
Enter
Sleep 500ms
Type "h"
Sleep 353ms
Type "e"
Sleep 509ms
Type "l"
Sleep 157ms
Type "l"
Sleep 214ms
Type "o"
Sleep 406ms
Type ","
Sleep 781ms
Enter
Sleep 1154ms
Type "w"
Sleep 158ms
Type "o"
Sleep 139ms
Type "r"
Sleep 128ms
Type "l"
Sleep 247ms
Type "d"
Sleep 983ms
Type "!"
Sleep 726ms
Enter
Ctrl+D
Sleep 500ms

# --- Phase 2: cat the recorded log, pause, clear ---

Type "sh hw_typing_phase2.sh"
Enter
Wait+Screen@30s /--- phase2 done ---/
Sleep 300ms

# --- Phase 3: replay with tscat -yZ (final) ---

Type "sh hw_typing_phase3.sh"
Enter
Wait+Screen@30s /--- phase3 done ---/
Sleep 1000ms
