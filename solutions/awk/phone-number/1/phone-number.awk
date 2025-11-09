BEGIN {
    ORS = ""
    FPAT = "[[:digit:]]"
}

/[[:alpha:]]/ { fail_with("letters not permitted") }

/[!"#$%&'*,:;<=>?@^_`{|}~]/ { fail_with("punctuations not permitted") }

NF < 10 { fail_with("must not be fewer than 10 digits") }

NF == 11 && $1 != 1 { fail_with("11 digits must start with 1") }

NF > 11 { fail_with("must not be greater than 11 digits") }

$(NF - 9) == 0 { fail_with("area code cannot start with zero") }

$(NF - 9) == 1 { fail_with("area code cannot start with one") }

$(NF - 6) == 0 { fail_with("exchange code cannot start with zero") }

$(NF - 6) == 1 { fail_with("exchange code cannot start with one") }

{
    for (i = NF - 9; i <= NF; i++) print $i
}

function fail_with(message) {
    print message
    exit 1
}
