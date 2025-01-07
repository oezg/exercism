#!/usr/bin/env bash

( (($# == 1)) && echo "Hello, $1") || (echo "Usage: $0 <person>" && exit 1)
