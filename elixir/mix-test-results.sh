#!/usr/bin/env bash

{
  printf "Results %s:\n\n" "${1:-$(basename "$PWD")}";
  mix test --include pending |
  sed -En '/\* test / s/.*\r  \* test ([a-z ]*) \(([0-9]+).*/\2 ms: \1/p' |
  sed '/^[0-9] ms/d' |
  sort -nr |
  head -n4 |
  nl -n'ln' -s'. ' -w1;
  printf "\nTested at %s\n--------------------------------\n\n" "$(date +"%T on %F")";
} >> performance.txt

