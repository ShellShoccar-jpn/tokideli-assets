# delay_echo_demo.tape - regenerate ../images/delay_echo_demo.gif with:
#   vhs delay_echo_demo.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools and
#  "typeliner"/"delay" on PATH ("tee" is a standard POSIX utility). See
#  ../../demo.tape for how this kind of recording is produced without
#  root access.)
#
# Both phases below type "yo-ho!" + Enter directly into the live
# terminal (not via a wrapper script) with Sleep durations matching a
# real human's recorded typing, because typeliner only does anything
# interesting when its input is a real tty -- a script feeding it
# synthetic stdin wouldn't exercise the same code path. TypingSpeed is
# set near-zero so each single-character Type command itself adds
# negligible delay, leaving the explicit Sleep durations as the sole
# source of inter-keystroke timing.
#
# The displayed header for each phase is the literal one-liner as
# specified; the command actually run wraps it in "( ... ); printf
# '\n--- phaseN done ---\n'" so Wait+Screen can detect true completion
# (these pipelines keep running for several seconds after typing ends,
# since "delay" intentionally keeps emitting already-buffered bytes
# past EOF -- see delay.man.ja.md), without having to hand-compute the
# exact finish time ourselves.
#
# Quoting note: vhs's Type "..." form cannot contain a literal '"'
# (tested: even \" breaks its parser), so each Type command below uses
# single-quote delimiters instead (Type '...'), and the shell command
# inside uses only double quotes throughout (escaped with \" where it
# is itself inside a double-quoted printf string) so the typed text
# never contains a single quote either. This also means the originally
# single-quoted `-t ''` in phase 2's one-liner is shown/typed here as
# `-t ""` instead -- functionally identical, just re-quoted to fit.

Output ../images/delay_echo_demo.gif

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 700
Set Padding 20
Set Theme "Dracula"
Set TypingSpeed 1ms

# --- Phase 1: single echo, delayed by 3s ---

Type 'printf "\033[1;33m\$ typeliner -t \"\" | (tee /dev/stderr | delay 3s) 2>&1\033[0m\n"; ( typeliner -t "" | (tee /dev/stderr | delay 3s) 2>&1 ); printf "\n\033[1;32m--- phase1 done ---\033[0m\n"'
Enter
Sleep 500ms
Type "y"
Sleep 99ms
Type "o"
Sleep 300ms
Type "-"
Sleep 322ms
Type "h"
Sleep 59ms
Type "o"
Sleep 279ms
Type "!"
Sleep 207ms
Enter
Sleep 100ms
Ctrl+D
Wait+Screen@30s /--- phase1 done ---/
Sleep 500ms

# --- Phase 2: doubled echo, delayed by 3s then 6s more ---

Type 'printf "\033[1;33m\$ typeliner -t \"\" | (( tee /dev/stderr | delay 3s ) 2>&1 | tee /dev/stderr | delay 6s) 2>&1\033[0m\n"; ( typeliner -t "" | (( tee /dev/stderr | delay 3s ) 2>&1 | tee /dev/stderr | delay 6s) 2>&1 ); printf "\n\033[1;32m--- phase2 done ---\033[0m\n"'
Enter
Sleep 500ms
Type "y"
Sleep 99ms
Type "o"
Sleep 300ms
Type "-"
Sleep 322ms
Type "h"
Sleep 59ms
Type "o"
Sleep 279ms
Type "!"
Sleep 207ms
Enter
Sleep 100ms
Ctrl+D
Wait+Screen@30s /--- phase2 done ---/
Sleep 1000ms
