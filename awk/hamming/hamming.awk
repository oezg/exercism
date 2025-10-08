NR == 1 { n = split($0, charsA, "") }

NR == 2 {
    if (n != split($0, charsB, "")) fail("strands must be of equal length")
}

END {
    for (i = 1; i <= n; i++) distance += charsA[i] != charsB[i]

    print +distance
}

function fail(message) {
    print message > "/dev/stderr"
    exit 1
}
