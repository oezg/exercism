def toroman:
    ["I", "X", "C", "M"][.position] as $I
    | ["V", "L", "D"][.position] as $V
    | ["X", "C", "M"][.position] as $X
    | [
        "",
        "\($I)",
        "\($I)\($I)",
        "\($I)\($I)\($I)",
        "\($I)\($V)",
        "\($V)",
        "\($V)\($I)",
        "\($V)\($I)\($I)",
        "\($V)\($I)\($I)\($I)",
        "\($I)\($X)"
    ][.number];

.position = 0
| reduce (
    while(.number > 0; .number /= (10 | floor) | .position += 1) | .number %= 10
) as $entry (""; ($entry | toroman) + .)