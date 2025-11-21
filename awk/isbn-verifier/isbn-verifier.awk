BEGIN { FPAT = "[[:digit:]X]" }

{ print isValidISBN() ? "true" : "false" }

function isValidISBN() {
    if (/[^[:digit:]X-]/ || NF != 10) return 0

    for (i = 1; i <= 10; i++) {
        if ($i == "X") {
            if (i < 10) return 0

            n += 10
        }
        else n += $i * (11 - i)
    }

    return n % 11 == 0
}
