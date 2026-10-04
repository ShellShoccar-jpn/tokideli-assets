# assets/demo.tape - regenerate assets/demo.gif and assets/demo.mp4 with:
#   vhs assets/demo.tape
# (run from the repository root; requires the vhs/ttyd/ffmpeg tools, see
#  the project's README for how this recording was produced without root
#  access. The mp4 is embedded via <video controls> in README.{ja,en}.md
#  instead of <img> for the gif, because GitHub's built-in GIF pause
#  button snaps back to the first frame instead of freezing on the
#  current one; a real <video> element doesn't have that problem.)

Output assets/demo.gif
Output assets/demo.mp4

Set Shell "bash"
Set FontSize 16
Set Width 900
Set Height 560
Set Padding 20
Set Theme "Dracula"

Type "sh assets/demo.sh"
Enter
Sleep 4500ms
