# fortune_valve_demo.tape - regenerate ../images/fortune_valve_demo.gif with:
#   vhs fortune_valve_demo.tape
# (run from article_figs/sources/; requires the vhs/ttyd/ffmpeg tools and a
#  "valve" binary on PATH, e.g. built and installed via tokideli's
#  INSTALLIN.sh. See ../../demo.tape for how this kind of recording is
#  produced without root access.)

Output ../images/fortune_valve_demo.gif

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 560
Set Padding 20
Set Theme "Dracula"

Type "sh fortune_valve_demo.sh"
Enter
Sleep 15000ms
