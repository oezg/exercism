#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    SED='/BATS_RUN_SKIPPED/d'
else
    SED='0,/^[^#]*BATS_RUN_SKIPPED/{/BATS_RUN_SKIPPED/d}'
fi

find . \
    -type f \
    -name "test-*.bats" \
    -exec sed -i "$SED" {} \; \
    -exec bats {} \;

