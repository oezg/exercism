#!/usr/bin/env bats
load bats-extra

# Test creation of Queens with invalid positions

# Program input: one line with 4 integers, which represents the (x, y) position of two queens.
# i.e. white_x white_y black_x black_y

@test "queen must have positive row" {
    # White queen at (-2, 2) and black queen at (7, 7).
    run gawk -f queen-attack.awk <<< "-2 2 7 7"
    assert_failure
    assert_output --partial "invalid"
}

@test "queen must have row on board" {
    run gawk -f queen-attack.awk <<< "8 4 7 7"
    assert_failure
    assert_output --partial "invalid"
}

@test "queen must have positive column" {
    run gawk -f queen-attack.awk <<< "2 -2 7 7"
    assert_failure
    assert_output --partial "invalid"
}

@test "queen must have column on board" {
    run gawk -f queen-attack.awk <<< "4 8 7 7"
    assert_failure
    assert_output --partial "invalid"
}

@test "same position" {
    run gawk -f queen-attack.awk <<< "7 7 7 7"
    assert_failure
    assert_output --partial "invalid"
}


# Test the ability of one queen to attack another

@test "can not attack" {
    run gawk -f queen-attack.awk <<< "2 4 6 6"
    assert_success 
    assert_output "false"
}

@test "can attack on same row" {
    run gawk -f queen-attack.awk <<< "2 4 2 6"
    assert_success 
    assert_output "true"
}

@test "can attack on same column" {
    run gawk -f queen-attack.awk <<< "4 5 2 5"
    assert_success 
    assert_output "true"
}

@test "can attack on first diagonal" {
    run gawk -f queen-attack.awk <<< "2 2 0 4"
    assert_success 
    assert_output "true"
}

@test "can attack on second diagonal" {
    run gawk -f queen-attack.awk <<< "2 2 3 1"
    assert_success 
    assert_output "true"
}

@test "can attack on third diagonal" {
    run gawk -f queen-attack.awk <<< "2 2 1 1"
    assert_success 
    assert_output "true"
}

@test "can attack on fourth diagonal" {
    run gawk -f queen-attack.awk <<< "1 7 0 6"
    assert_success 
    assert_output "true"
}

@test "cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal" {
    run gawk -f queen-attack.awk <<< "4 1 2 5"
    assert_success 
    assert_output "false"
}
