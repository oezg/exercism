#!/usr/bin/env bats
# generated on 2024-06-14T20:09:36Z
load bats-extra
load bats-jq

@test 'finds the largest product if span equals length' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "29",
          "span": 2
        }
END_INPUT

    assert_success
    expected=18
    assert_equal "$output" "$expected"
}

@test 'can find the largest product of 2 with numbers in order' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "0123456789",
          "span": 2
        }
END_INPUT

    assert_success
    expected=72
    assert_equal "$output" "$expected"
}

@test 'can find the largest product of 2' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "576802143",
          "span": 2
        }
END_INPUT

    assert_success
    expected=48
    assert_equal "$output" "$expected"
}

@test 'can find the largest product of 3 with numbers in order' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "0123456789",
          "span": 3
        }
END_INPUT

    assert_success
    expected=504
    assert_equal "$output" "$expected"
}

@test 'can find the largest product of 3' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "1027839564",
          "span": 3
        }
END_INPUT

    assert_success
    expected=270
    assert_equal "$output" "$expected"
}

@test 'can find the largest product of 5 with numbers in order' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "0123456789",
          "span": 5
        }
END_INPUT

    assert_success
    expected=15120
    assert_equal "$output" "$expected"
}

@test 'can get the largest product of a big number' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "73167176531330624919225119674426574742355349194934",
          "span": 6
        }
END_INPUT

    assert_success
    expected=23520
    assert_equal "$output" "$expected"
}

@test 'reports zero if the only digits are zero' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "0000",
          "span": 2
        }
END_INPUT

    assert_success
    expected=0
    assert_equal "$output" "$expected"
}

@test 'reports zero if all spans include zero' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "99099",
          "span": 3
        }
END_INPUT

    assert_success
    expected=0
    assert_equal "$output" "$expected"
}

@test 'rejects span longer than string length' {

    run jq -c -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "123",
          "span": 4
        }
END_INPUT

    assert_failure
    expected='span must not exceed string length'
    assert_equal "$output" "$expected"
}

@test 'reports 1 for empty string and empty product (0 span)' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "",
          "span": 0
        }
END_INPUT

    assert_success
    expected=1
    assert_equal "$output" "$expected"
}

@test 'reports 1 for nonempty string and empty product (0 span)' {

    run jq -r -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "123",
          "span": 0
        }
END_INPUT

    assert_success
    expected=1
    assert_equal "$output" "$expected"
}

@test 'rejects empty string and nonzero span' {

    run jq -c -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "",
          "span": 1
        }
END_INPUT

    assert_failure
    expected='span must not exceed string length'
    assert_equal "$output" "$expected"
}

@test 'rejects invalid character in digits' {

    run jq -c -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "1234a5",
          "span": 2
        }
END_INPUT

    assert_failure
    expected='digits input must only contain digits'
    assert_equal "$output" "$expected"
}

@test 'rejects negative span' {

    run jq -c -f largest-series-product.jq << 'END_INPUT'
        {
          "digits": "12345",
          "span": -1
        }
END_INPUT

    assert_failure
    expected='span must not be negative'
    assert_equal "$output" "$expected"
}
