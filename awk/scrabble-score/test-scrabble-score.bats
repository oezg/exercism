#!/usr/bin/env bats
load bats-extra

@test 'lowercase letter' {
    run gawk -f scrabble-score.awk <<< 'a'

    assert_success
    assert_output 'A,1'
}

@test 'uppercase letter' {
    run gawk -f scrabble-score.awk <<< 'A'

    assert_success
    assert_output 'A,1'
}

@test 'valuable letter' {
    run gawk -f scrabble-score.awk <<< 'f'

    assert_success
    assert_output 'F,4'
}

@test 'short word' {
    run gawk -f scrabble-score.awk <<< 'at'

    assert_success
    assert_output 'AT,2'
}

@test 'short, valuable word' {
    run gawk -f scrabble-score.awk <<< 'zoo'

    assert_success
    assert_output 'ZOO,12'
}

@test 'medium word' {
    run gawk -f scrabble-score.awk <<< 'street'

    assert_success
    assert_output 'STREET,6'
}

@test 'medium, valuable word' {
    run gawk -f scrabble-score.awk <<< 'quirky'

    assert_success
    assert_output 'QUIRKY,22'
}

@test 'long, mixed-case word' {
    run gawk -f scrabble-score.awk <<< 'OxyphenButazone'

    assert_success
    assert_output 'OXYPHENBUTAZONE,41'
}

@test 'english-like word' {
    run gawk -f scrabble-score.awk <<< 'pinata'

    assert_success
    assert_output 'PINATA,8'
}

@test 'empty input' {
    run gawk -f scrabble-score.awk <<< ''

    assert_success
    assert_output ',0'
}

@test 'entire alphabet available' {
    run gawk -f scrabble-score.awk <<< 'abcdefghijklmnopqrstuvwxyz'

    assert_success
    assert_output 'ABCDEFGHIJKLMNOPQRSTUVWXYZ,87'
}

@test 'bonus: blank tile counts as zero' {
    run gawk -f scrabble-score.awk <<< 'abcdefghijklmnop rstuvwxyz'

    assert_success
    assert_output 'ABCDEFGHIJKLMNOP RSTUVWXYZ,77'
}
