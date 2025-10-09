#!/usr/bin/env bats
load bats-extra

@test "finds the largest product if span equals length" {
    run gawk -f largest-series-product.awk <<< "29,2"
    assert_success
    assert_output "18"
}

@test "can find the largest product of 2 with numbers in order" {
    run gawk -f largest-series-product.awk <<< "0123456789,2"
    assert_success
    assert_output "72"
}

@test "can find the largest product of 2" {
    run gawk -f largest-series-product.awk <<< "576802143,2"
    assert_success
    assert_output "48"
}

@test "can find the largest product of 3 with numbers in order" {
    run gawk -f largest-series-product.awk <<< "0123456789,3"
    assert_success
    assert_output "504"
}

@test "can find the largest product of 3" {
    run gawk -f largest-series-product.awk <<< "1027839564,3"
    assert_success
    assert_output "270"
}

@test "can find the largest product of 5 with numbers in order" {
    run gawk -f largest-series-product.awk <<< "0123456789,5"
    assert_success
    assert_output "15120"
}

@test "can get the largest product of a big number" {
    run gawk -f largest-series-product.awk <<< "73167176531330624919225119674426574742355349194934,6"
    assert_success
    assert_output "23520"
}

@test "reports zero if the only digits are zero" {
    run gawk -f largest-series-product.awk <<< "0000,2"
    assert_success
    assert_output "0"
}

@test "reports zero if all spans include zero" {
    run gawk -f largest-series-product.awk <<< "99099,3"
    assert_success
    assert_output "0"
}

# error cases

@test "rejects span longer than string length" {
    run gawk -f largest-series-product.awk <<< "123,4"
    assert_failure
    assert_output --partial "span must not exceed string length"
}

@test "rejects empty string and nonzero span" {
    run gawk -f largest-series-product.awk <<< ",1"
    assert_failure
    assert_output --partial "span must not exceed string length"
}

@test "rejects invalid character in digits" {
    run gawk -f largest-series-product.awk <<< "1234a5,2"
    assert_failure
    assert_output --partial "input must only contain digits"
}

@test "rejects negative span" {
    run gawk -f largest-series-product.awk <<< "12345,-1"
    assert_failure
    assert_output --partial "span must not be negative"
}
