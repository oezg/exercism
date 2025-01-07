#!/usr/bin/env bash

filename=$1

if [[ ! $filename =~ .bats$ ]]; then
    filename=${filename}bats
fi

sed -i '0,/^  \(\[\[ $BATS_RUN_SKIPPED == "true" ]] || skip$\)/ s//  # \1/' "$filename"

bats "$filename"
