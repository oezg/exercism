#!/usr/bin/env bash

declare -a sounds=([3]=i [5]=a [7]=o)

for i in "${!sounds[@]}"; do
    (($1 % i)) || result+=Pl${sounds[$i]}ng
done

echo "${result-$1}"
