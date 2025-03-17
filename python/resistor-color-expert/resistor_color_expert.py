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

PREFIX = ("kilo", "mega", "giga")


def resistor_label(colors: list[str]) -> str:
    *codes, last = colors
    if not codes:
        return f"{COLOR.index(last)} ohms"

    tolerance = TOLERANCE[last]
    *values, exponent = [COLOR.index(color) for color in codes]
    result = 0
    for value in values:
        result = result * 10 + value
    result *= 10**exponent

    prefix = ""
    for label in PREFIX:
        if result < 1000:
            break
        result /= 1000
        prefix = label

    return f"{result:n} {prefix}ohms ±{tolerance}%"
