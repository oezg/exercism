NF {
    n = $1
    NF = 0

    while (!(and(n, 1))) {
        n = rshift(n, 1)
        $++NF = 2
    }

    factor = 3

    while (n > 1) {
        if (n % factor) factor += 2
        else {
            $++NF = factor

            n /= factor
        }
    }
}

1
