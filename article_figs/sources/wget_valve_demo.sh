#!/bin/sh
# Demo script recorded by wget_valve_demo.tape (via vhs) for
# ../images/wget_valve_demo.gif.
#
# Downloads 10 files from a web server, one every 3 seconds, by pacing
# the *requests* (not the downloads themselves) with "valve -l 3s".
# Each file's own download time fluctuates with network conditions,
# but the interval at which new downloads are kicked off stays fixed.
#
# If a wget takes longer than the 3s interval, valve will catch up by
# bursting through the filenames that piled up while it was waiting;
# this is valve's normal recovery behavior and is expected to happen
# here, not a problem to work around.

cat <<'SCRIPT'
$ seq -f '%02.0f' 1 10 |
  valve -l 3s          |
  while read n; do
    wget "https://richlab.org/tmp/file_${n}.bin"
  done
SCRIPT
echo

seq -f '%02.0f' 1 10 |
valve -l 3s          |
while read n; do
  wget "https://richlab.org/tmp/file_${n}.bin"
done

echo
printf '\033[1;32m--- done ---\033[0m\n'
