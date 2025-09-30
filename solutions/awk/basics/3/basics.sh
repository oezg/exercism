#!/bin/sh
## task 1
awk -F: '{ print $1 }' ./passwd

## task 2
awk '{ print NR }' ./passwd

## task 3
awk -F: '$6 !~ /^\/(root|home)/' ./passwd

## task 4
awk -F: '$6 ~ /^\/(root|home)/ && $7 == "/bin/bash"' ./passwd
