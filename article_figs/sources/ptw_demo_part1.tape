# ptw_demo_part1.tape - regenerate ../images/ptw_demo_part1.gif with:
#   vhs ptw_demo_part1.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools,
#  python3 + the "requests" module, plus network access to
#  hacker-news.firebaseio.com. Needs best_articles_on_hackernews.py in
#  this same directory. See ../../demo.tape for how this kind of
#  recording is produced without root access.)
#
# Companion to ptw_demo_part2.tape (phases 2-4); split into two
# recordings/files so a normal-sized canvas could be used instead of
# a tall one -- see ptw_demo_part2.tape for why.
#
# Phase 1 makes real HTTP requests (via best_articles_on_hackernews.py)
# and takes a variable amount of time depending on network conditions,
# so Wait+Screen is used instead of a fixed Sleep -- the phase script
# prints its own "--- phase1 done ---" marker only after the whole
# pipeline has actually finished (and the screen has been cleared).

Output ../images/ptw_demo_part1.gif

Set Shell "bash"
Set FontSize 16
Set Width 1000
Set Height 700
Set Padding 20
Set Theme "Dracula"

# --- Phase 1: run directly (stdout is a tty, so it streams naturally) ---

Type "sh ptw_demo_phase1.sh"
Enter
Wait+Screen@60s /--- phase1 done ---/
Sleep 1000ms
