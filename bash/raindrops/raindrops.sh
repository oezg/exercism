#!/usr/bin/env bash

declare -a sounds=([3]=Pling [5]=Plang [7]=Plong)

for i in "${!sounds[@]}"; do
    (($1 % i)) || result+=${sounds[$i]}
done

echo "${result-$1}"
