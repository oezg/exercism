#!/usr/bin/env bats
load bats-extra

# local version: 2.0.0.0


@test "paired square brackets" {
    run gawk -f matching-brackets.awk <<< "[]"
    assert_success
    assert_output "true"
}

@test "empty string" {
    run gawk -f matching-brackets.awk <<< ""
    assert_success
    assert_output "true"
}

@test "unpaired brackets" {
    run gawk -f matching-brackets.awk <<< "[["
    assert_success
    assert_output "false"
}

@test "wrong ordered brackets" {
    run gawk -f matching-brackets.awk <<< "}{"
    assert_success
    assert_output "false"
}

@test "wrong closing bracket" {
    run gawk -f matching-brackets.awk <<< "{]"
    assert_success
    assert_output "false"
}

@test "paired with whitespace" {
    run gawk -f matching-brackets.awk <<< "{ }"
    assert_success
    assert_output "true"
}

@test "partially paired brackets" {
    run gawk -f matching-brackets.awk <<< "{[])"
    assert_success
    assert_output "false"
}

@test "simple nested brackets" {
    run gawk -f matching-brackets.awk <<< "{[]}"
    assert_success
    assert_output "true"
}

@test "several paired brackets" {
    run gawk -f matching-brackets.awk <<< "{}[]"
    assert_success
    assert_output "true"
}

@test "paired and nested brackets" {
    run gawk -f matching-brackets.awk <<< "([{}({}[])])"
    assert_success
    assert_output "true"
}

@test "unopened closing brackets" {
    run gawk -f matching-brackets.awk <<< "{[)][]}"
    assert_success
    assert_output "false"
}

@test "unpaired and nested brackets" {
    run gawk -f matching-brackets.awk <<< "([{])"
    assert_success
    assert_output "false"
}

@test "paired and wrong nested brackets" {
    run gawk -f matching-brackets.awk <<< "[({]})"
    assert_success
    assert_output "false"
}

@test "paired and wrong nested brackets but innermost are correct" {
    run gawk -f matching-brackets.awk <<< "[({}])"
    assert_success
    assert_output "false"
}

@test "paired and incomplete brackets" {
    run gawk -f matching-brackets.awk <<< "{}["
    assert_success
    assert_output "false"
}

@test "too many closing brackets" {
    run gawk -f matching-brackets.awk <<< "[]]"
    assert_success
    assert_output "false"
}

@test "early unexpected brackets" {
    run gawk -f matching-brackets.awk <<< ")()"
    assert_success
    assert_output "false"
}

@test "early mismatched brackets" {
    run gawk -f matching-brackets.awk <<< "{)()"
    assert_success
    assert_output "false"
}

@test "math expression" {
    run gawk -f matching-brackets.awk <<< "(((185 + 223.85) * 15) - 543)/2"
    assert_success
    assert_output "true"
}

@test "complex latex expression" {
    run gawk -f matching-brackets.awk <<< "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
    assert_success
    assert_output "true"
}
