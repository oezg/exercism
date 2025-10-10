#!/usr/bin/env bats
load bats-extra

# Check if the given string is a pangram

@test "empty sentence" {
  run gawk -f pangram.awk <<< ""
  assert_success
  assert_output "false"
}

@test "perfect lower case" {
  run gawk -f pangram.awk <<< "abcdefghijklmnopqrstuvwxyz"
  assert_success
  assert_output "true"
}

@test "only lower case" {
  run gawk -f pangram.awk <<< "the quick brown fox jumps over the lazy dog"
  assert_success
  assert_output "true"
}

@test "missing the letter 'x'" {
  run gawk -f pangram.awk <<< "a quick movement of the enemy will jeopardize five gunboats"
  assert_success
  assert_output "false"
}

@test "missing the letter 'h'" {
  run gawk -f pangram.awk <<< "five boxing wizards jump quickly at it"
  assert_success
  assert_output "false"
}

@test "with underscores" {
  run gawk -f pangram.awk <<< "the_quick_brown_fox_jumps_over_the_lazy_dog"
  assert_success
  assert_output "true"
}

@test "with numbers" {
  run gawk -f pangram.awk <<< "the 1 quick brown fox jumps over the 2 lazy dogs"
  assert_success
  assert_output "true"
}

@test "missing letters replaced by numbers" {
  run gawk -f pangram.awk <<< "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
  assert_success
  assert_output "false"
}

@test "mixed case and punctuation" {
  run gawk -f pangram.awk <<< "\"Five quacking Zephyrs jolt my wax bed.\""
  assert_success
  assert_output "true"
}

@test "a-m and A-M are 26 different characters but not a pangram" {
  run gawk -f pangram.awk <<< "abcdefghijklm ABCDEFGHIJKLM"
  assert_success
  assert_output "false"
}
