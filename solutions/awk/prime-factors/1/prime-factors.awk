{
    n = $1
    f = 2

    while (n > 1) {
        while (n % f == 0) {
            line = line (n < $1 ? " " : "") f

            n /= f
        }

        f == 2 ? f++ : f += 2
    }

    print line
}
