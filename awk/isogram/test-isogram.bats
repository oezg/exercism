#!/usr/bin/env bats
load bats-extra

# Check if the given string is an isogram

@test "empty string" {
    run gawk -f isogram.awk <<< ""
    assert_success
    assert_output "true"
}

@test "isogram with only lower case characters" {
    run gawk -f isogram.awk <<< "isogram"
    assert_success
    assert_output "true"
}

@test "word with one duplicated character" {
    run gawk -f isogram.awk <<< "eleven"
    assert_success
    assert_output "false"
}

@test "word with one duplicated character from the end of the alphabet" {
    run gawk -f isogram.awk <<< "zzyzx"
    assert_success
    assert_output "false"
}

@test "longest reported english isogram" {
    run gawk -f isogram.awk <<< "subdermatoglyphic"
    assert_success
    assert_output "true"
}

@test "word with duplicated character in mixed case" {
    run gawk -f isogram.awk <<< "Alphabet"
    assert_success
    assert_output "false"
}

@test "word with duplicated character in mixed case, lowercase first" {
    run gawk -f isogram.awk <<< "alphAbet"
    assert_success
    assert_output "false"
}

@test "hypothetical isogrammic word with hyphen" {
    run gawk -f isogram.awk <<< "thumbscrew-japingly"
    assert_success
    assert_output "true"
}

@test "hypothetical word with duplicated character following hyphen" {
    run gawk -f isogram.awk <<< "thumbscrew-jappingly"
    assert_success
    assert_output "false"
}

@test "isogram with duplicated hyphen" {
    run gawk -f isogram.awk <<< "six-year-old"
    assert_success
    assert_output "true"
}

@test "made-up name that is an isogram" {
    run gawk -f isogram.awk <<< "Emily Jung Schwartzkopf"
    assert_success
    assert_output "true"
}

@test "duplicated character in the middle" {
    run gawk -f isogram.awk <<< "accentor"
    assert_success
    assert_output "false"
}

@test "same first and last characters" {
    run gawk -f isogram.awk <<< "angola"
    assert_success
    assert_output "false"
}

@test "word with duplicated character and with two hyphens" {
    run gawk -f isogram.awk <<< "up-to-date"
    assert_success
    assert_output "false"
}
