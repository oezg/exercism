#!/usr/bin/env bash

find . \
    -type f \
    -name "test-*.bats" \
    -exec sed -i '0,/^[^#]*BATS_RUN_SKIPPED/{/BATS_RUN_SKIPPED/d}' {} \; \
    -exec bats {} \;

