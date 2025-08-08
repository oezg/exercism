#!/usr/bin/env bash
printf "\n\n------------------------\n  * %s Results\n" "$1" >> performance.txt
mix test --include pending |
sed -En '/L#(66|72|97)/ s/.*\r  \* test ([a-z ]*)\(([0-9]+).*/\2 ms: \1/p' |
sort -nr \
>> performance.txt
