# sl_valve_demo.tape - regenerate ../images/sl_valve_demo.gif with:
#   vhs sl_valve_demo.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools, a
#  "valve" binary, and "sl" on PATH. See ../../demo.tape for how this kind
#  of recording is produced without root access. Companion recording to
#  sl_demo.gif/sl_demo.tape, which runs plain "sl" for comparison; kept
#  as a separate recording/file so neither GIF grows too large.)

Output ../images/sl_valve_demo.gif

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 560
Set Padding 20
Set Theme "Dracula"

Type "sh sl_valve_demo.sh"
Enter
Sleep 29000ms
