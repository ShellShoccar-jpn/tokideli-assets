#!/bin/sh
# Demo script recorded by assets/demo.tape (via vhs) for README.{ja,en}.md.
# Run from the repository root.
N=10
IV=0.2

printf '\033[1;33m# naive: while read; do ...; sleep %ss; done\033[0m\n' "$IV"
T0=$(date +%s.%N)
seq 1 $N | while IFS= read -r line; do
  printf 'line %-2s  elapsed=%6.3fs\n' "$line" "$(echo "$(date +%s.%N) - $T0" | bc)"
  sleep $IV
done
T1=$(date +%s.%N)
printf '\033[1;31m-> total %.3fs  (ideal %.3fs, drift +%.3fs)\033[0m\n\n' \
  "$(echo "$T1-$T0"|bc)" "$(echo "($N-1)*$IV"|bc)" "$(echo "$T1-$T0-($N-1)*$IV"|bc)"

printf '\033[1;33m# tokideli: seq ... | valve -l %ss\033[0m\n' "$IV"
T0=$(date +%s.%N)
seq 1 $N | c_src/valve -l "${IV}s" | while IFS= read -r line; do
  printf 'line %-2s  elapsed=%6.3fs\n' "$line" "$(echo "$(date +%s.%N) - $T0" | bc)"
done
T1=$(date +%s.%N)
printf '\033[1;32m-> total %.3fs  (ideal %.3fs, drift +%.3fs)\033[0m\n' \
  "$(echo "$T1-$T0"|bc)" "$(echo "($N-1)*$IV"|bc)" "$(echo "$T1-$T0-($N-1)*$IV"|bc)"
