# wget_valve_demo.tape - regenerate ../images/wget_valve_demo.gif with:
#   vhs wget_valve_demo.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools, a
#  "valve" binary, and network access to richlab.org. See ../../demo.tape
#  for how this kind of recording is produced without root access. Uses
#  Wait+Screen instead of a fixed Sleep, since each run's total time
#  depends on real network conditions.)
#
# Height is set tall enough that the full (unabbreviated, no "-nv")
# wget output for all 10 files never needs to scroll the terminal.
# This recording pipeline (vhs/ttyd + a headless browser) reliably
# hangs partway through once the terminal content grows past the
# visible height and a scroll becomes necessary -- confirmed by
# reproducing the hang at several heights/output verbosities and
# seeing it go away entirely once the canvas was made tall enough
# to hold everything. 2300px was measured (by trial) to be enough
# for this script's actual output; if the script or file sizes
# change enough to add more lines, this may need to grow again.

Output ../images/wget_valve_demo.gif

Set Shell "bash"
Set FontSize 14
Set Width 1000
Set Height 2300
Set Padding 20
Set Theme "Dracula"

Type "sh wget_valve_demo.sh"
Enter
Wait+Screen@120s /--- done ---/
Sleep 1000ms
