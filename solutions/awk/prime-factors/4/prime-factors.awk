NF {
    n = $1
    NF = 0

    while (!(and(n, 1))) {
        n = rshift(n, 1)
        $++NF = 2
    }

    factor = 3

    bound = sqrt(n)

    while (n > 1) {
        if (factor > bound) factor = n

        if (n % factor) factor += 2
        else {
            $++NF = factor

            n /= factor
        }
    }
}

1
