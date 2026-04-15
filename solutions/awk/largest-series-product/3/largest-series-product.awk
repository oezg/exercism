BEGIN { FS = "," }

length($1) < $2 { fail_with("span must not exceed string length") }

$2 < 0 { fail_with("span must not be negative") }

$1 ~ /[^[:digit:]]/ { fail_with("input must only contain digits")}

{
    split($1, digits, "")

    for (i = 1; i + $2 <= length(digits) + 1; i++) {
        product = 1

        for (j = i; j < i + $2; j++) product *= digits[j]

        if (product > largest) largest = product
    }

    print +largest
}

function fail_with(message) {
    print message > "/dev/stderr"
    exit 1
}
