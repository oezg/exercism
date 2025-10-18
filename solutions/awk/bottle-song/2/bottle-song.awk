BEGIN {
    split("No One Two Three Four Five Six Seven Eight Nine Ten", a)
    line1 = "%s green bottle%s hanging on the wall,\n"
    line3 = "And if one green bottle should accidentally fall,\n"
    line4 = "There'll be %s green bottle%s hanging on the wall.\n"

    while (i < takeDown) out = out (i ? "\n" : "") verse(startBottles - i++)

    print out
}

function verse(n) {
    line = sprintf(line1, a[n + 1], n == 1 ? "" : "s")
    last_line = sprintf(line4, tolower(a[n]), n == 2 ? "" : "s")
    return line line line3 last_line
}
