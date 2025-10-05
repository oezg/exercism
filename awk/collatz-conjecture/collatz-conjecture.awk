typeof($1) == "strnum" && $1 > 0 { print collatz($1) }

typeof($1) == "strnum" && $1 < 1 {
    print "Error: Only positive numbers are allowed" > "/dev/stderr"
    exit 1
}

function collatz(n) {
    return n == 1 ? 0 : 1 + collatz(n % 2 ? 3 * n + 1 : n / 2)
}
