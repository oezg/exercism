def rank:
    [
        ["I", "V", "X"],
        ["X", "L", "C"],
        ["C", "D", "M"],
        ["M"]
    ][.position // 0]
    | {
        I: .[0],
        V: .[1],
        X: .[2]
    };

def toroman(I; V; X):
    [
        "",
        "\(I)",
        "\(I)\(I)",
        "\(I)\(I)\(I)",
        "\(I)\(V)",
        "\(V)",
        "\(V)\(I)",
        "\(V)\(I)\(I)",
        "\(V)\(I)\(I)\(I)",
        "\(I)\(X)"
    ][.number % 10];

[while(.number > 0; .number |= (. / 10 | floor) | .position += 1)
| toroman(rank.I; rank.V; rank.X)]
| reverse
| add