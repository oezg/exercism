COLOR = {
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9,
}

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


def resistor_label(colors: list[str]) -> str:
    *codes, last = colors
    if not codes:
        return f"{COLOR[last]} ohms"

    *values, exponent = [COLOR[color] for color in codes]
    value = int("".join([str(code) for code in values]))
    return f"{resistance(value * 10**exponent)}ohms ±{TOLERANCE[last]}%"


def resistance(value: int) -> tuple[float, str]:
    if value >= 1e9:
        label, prefix = value / 1e9, "giga"
    elif value >= 1e6:
        label, prefix = value / 1e6, "mega"
    elif value >= 1e3:
        label, prefix = value / 1e3, "kilo"
    else:
        label, prefix = value, ""
    return f"{label:n} {prefix}"
