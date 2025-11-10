{
    factor = 2

    while ($1 > 1) {
        if ($1 % factor) factor == 2 ? factor++ : factor += 2
        else {
            factors = factors (factors ? " " : "") factor

            $1 /= factor
        }
    }

    print factors
}
