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


def resistor_label(colors: list[str]) -> str:
    *codes, last = colors
    if not codes:
        return f"{COLOR.index(last)} ohms"

    *values, exponent = [COLOR.index(color) for color in codes]
    value = values[-1] + values[-2] * 10 + access(values, -3, 0) * 100
    return f"{resistance(value * 10**exponent)}ohms ±{TOLERANCE[last]}%"


def resistance(value: int) -> tuple[float, str]:
    label, prefix = value, ""
    for v, p in [(1e9, "giga"), (1e6, "mega"), (1e3, "kilo")]:
        if value >= v:
            label, prefix = value / v, p
            break
    return f"{label:n} {prefix}"


def access(list: list[int], index: int, default: int = 0) -> int:
    try:
        return list[index]
    except IndexError:
        return default
