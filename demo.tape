# assets/demo.tape - regenerate assets/demo.gif with:
#   vhs assets/demo.tape
# (run from the repository root; requires the vhs/ttyd/ffmpeg tools, see
#  the project's README for how this GIF was produced without root access)

Output assets/demo.gif

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 560
Set Padding 20
Set Theme "Dracula"

Type "sh assets/demo.sh"
Enter
Sleep 4500ms
