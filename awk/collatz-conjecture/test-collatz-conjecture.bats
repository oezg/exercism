#!/usr/bin/env bats
load bats-extra

# local version: 1.2.1.0

@test "zero steps for one" {
  run gawk -f collatz-conjecture.awk <<< "1"
  assert_success
  assert_output "0"
}

@test "divide if even" {
  run gawk -f collatz-conjecture.awk <<< "16"
  assert_success
  assert_output "4"
}

@test "even and odd steps" {
  run gawk -f collatz-conjecture.awk <<< "12"
  assert_success
  assert_output "9"
}

@test "large number of even and odd steps" {
  run gawk -f collatz-conjecture.awk <<< "1000000"
  assert_success
  assert_output "152"
}

@test "zero is an error" {
  run gawk -f collatz-conjecture.awk <<< "0"
  assert_failure
  assert_output "Error: Only positive numbers are allowed"
}

@test "negative value is an error" {
  run gawk -f collatz-conjecture.awk <<< "-15"
  assert_failure
  assert_output "Error: Only positive numbers are allowed"
}
