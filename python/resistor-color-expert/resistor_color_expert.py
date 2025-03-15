COLOR = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
]

TOLERANCE = {
    "grey": 0.05,
    "violet": 0.1,
    "blue": 0.25,
    "green": 0.5,
    "brown": 1,
    "red": 2,
    "gold": 5,
    "silver": 10,
}

PREFIX = [(1e9, "giga"), (1e6, "mega"), (1e3, "kilo"), (0, "")]


def resistor_label(colors: list[str]) -> str:
    *codes, last = colors
    if not codes:
        return f"{COLOR.index(last)} ohms"

    *values, exponent = [COLOR.index(color) for color in codes]
    result, factor = 0, 1
    for value in reversed(values):
        result += value * factor
        factor *= 10

    return f"{resistance(result * 10**exponent)}ohms ±{TOLERANCE[last]}%"


def resistance(value: int) -> tuple[float, str]:
    for factor, qualifier in PREFIX:
        if value >= factor:
            return f"{value / max(factor, 1):n} {qualifier}"
