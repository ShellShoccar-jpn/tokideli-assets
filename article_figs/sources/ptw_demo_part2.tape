# ptw_demo_part2.tape - regenerate ../images/ptw_demo_part2.gif with:
#   vhs ptw_demo_part2.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools,
#  python3 + the "requests" module, and "ptw" on PATH, plus network
#  access to hacker-news.firebaseio.com. Needs
#  best_articles_on_hackernews.py in this same directory. See
#  ../../demo.tape for how this kind of recording is produced without
#  root access.)
#
# Companion to ptw_demo_part1.tape (phase 1). Each phase below makes
# real HTTP requests and takes a variable amount of time depending on
# network conditions, so Wait+Screen is used instead of a fixed Sleep
# -- each phase script prints its own "--- phaseN done ---" marker
# only after the whole pipeline has actually finished (and the screen
# has been cleared).
#
# Each of phases 2-4 clears the screen after it finishes (instead of
# accumulating all three on one screen), specifically so a normal-size
# canvas can be used here. An earlier version of this recording kept
# phases 2-4 all on one ever-growing screen for direct side-by-side
# comparison and needed a very tall (1800px) canvas to avoid a
# mid-recording scroll, because this recording pipeline (vhs/ttyd + a
# headless browser) is known to hang once a scroll becomes necessary
# (confirmed again here: splitting phase 1 into its own fresh
# recording did NOT help -- a fresh session starting straight into
# phases 2+3+4 without clearing still hung at the same relative point,
# which is what led to clearing between phases instead).

Output ../images/ptw_demo_part2.gif

Set Shell "bash"
Set FontSize 16
Set Width 1000
Set Height 700
Set Padding 20
Set Theme "Dracula"

# --- Phase 2: piped into grep -- Python fully-buffers, output bursts at the end ---

Type "sh ptw_demo_phase2.sh"
Enter
Wait+Screen@60s /--- phase2 done ---/
Sleep 300ms

# --- Phase 3: try stdbuf -o L -- doesn't fix Python's own buffering ---

Type "sh ptw_demo_phase3.sh"
Enter
Wait+Screen@60s /--- phase3 done ---/
Sleep 300ms

# --- Phase 4: use ptw instead -- a real pty restores streaming (final) ---

Type "sh ptw_demo_phase4.sh"
Enter
Wait+Screen@60s /--- phase4 done ---/
Sleep 1000ms
