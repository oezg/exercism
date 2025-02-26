#!/usr/bin/env bash

filename=$1

if [[ ! $filename =~ .bats$ ]]; then
    filename=${filename}bats
fi

sed -i 's/^\s\{2,4\}\(\[\[ $BATS_RUN_SKIPPED == "true" ]] || skip$\)/  # \1/g' "$filename"

bats "$filename"
