BEGIN {
    OFS = ""
    FPAT = "[[:digit:]]"
}

/[[:alpha:]]/ { fail_with("letters not permitted") }

/[^[:digit:] .+()-]/ { fail_with("punctuations not permitted") }

NF < 10 { fail_with("must not be fewer than 10 digits") }

NF > 11 { fail_with("must not be greater than 11 digits") }

NF == 11 { $1 == 1 ? sub("1", "") : fail_with("11 digits must start with 1") }

$1 == 0 { fail_with("area code cannot start with zero") }

$1 == 1 { fail_with("area code cannot start with one") }

$4 == 0 { fail_with("exchange code cannot start with zero") }

$4 == 1 { fail_with("exchange code cannot start with one") }

{ $1 = $1 }

1

function fail_with(message) {
    print message > "/dev/stderr"
    exit 1
}
