#!/usr/bin/env bats
load bats-extra

@test "brown black" {
    run gawk -f resistor-color-duo.awk <<< "brown black"
    assert_success
    assert_output "10"
}

@test "blue grey" {
    run gawk -f resistor-color-duo.awk <<< "blue grey"
    assert_success
    assert_output "68"
}

@test "yellow violet" {
    run gawk -f resistor-color-duo.awk <<< "yellow violet"
    assert_success
    assert_output "47"
}

@test "white red" {
    run gawk -f resistor-color-duo.awk <<< "white red"
    assert_success
    assert_output "92"
}

@test "orange orange" {
    run gawk -f resistor-color-duo.awk <<< "orange orange"
    assert_success
    assert_output "33"
}

@test "invalid color" {
    run gawk -f resistor-color-duo.awk <<< "foo"
    assert_failure
    assert_output --partial "invalid color"
}

@test "ignore too many colors" {
    run gawk -f resistor-color-duo.awk <<< "green brown orange"
    assert_success
    assert_output "51"
}

@test "black brown" {
    run gawk -f resistor-color-duo.awk <<< "black brown"
    assert_success
    assert_output "1"
}

@test "black grey" {
    run gawk -f resistor-color-duo.awk <<< "black grey"
    assert_success
    assert_output "8"
}
