#!/usr/bin/env bash

find "$PWD/test/" \
    -name "*_test.exs" \
    -exec sed -i '0,/^\([[:space:]]*\)\(@tag :pending\)/ s//\1# \2/' {} \; \
    -quit

mix test