BEGIN {
    a[10] = "Ten"
    a[9] = "Nine"
    a[8] = "Eight"
    a[7] = "Seven"
    a[6] = "Six"
    a[5] = "Five"
    a[4] = "Four"
    a[3] = "Three"
    a[2] = "Two"
    a[1] = "One"
    a[0] = "no"
    line1 = "%s green bottle%s hanging on the wall,\n"
    line3 = "And if one green bottle should accidentally fall,\n"
    line4 = "There'll be %s green bottle%s hanging on the wall.\n"

    while (i < takeDown) out = out (i ? "\n" : "") verse(startBottles - i++)

    print out
}

function verse(n) {
    line = sprintf(line1, a[n], n == 1 ? "" : "s")
    last_line = sprintf(line4, tolower(a[n - 1]), n == 2 ? "" : "s")
    return line line line3 last_line
}
