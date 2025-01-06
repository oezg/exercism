#!/usr/bin/env bash

main() {
    printf "One for %s, one for me." "$1"
}

main "${1:-"you"}"
