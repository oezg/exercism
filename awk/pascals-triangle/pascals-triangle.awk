{
    for (n = 0; n < $1; n++) {
        line = ""

        for (k = 0; k <= n; k++) line = line (k > 0 ? " " : "") choose(n, k)

        print line
    }
}

function choose(n, k, result) {
    if (n < k || k < 0) return 0

    result = 1

    for (i = 1; i <= k; i++) result *= (n - i + 1) / i

    return result
}
