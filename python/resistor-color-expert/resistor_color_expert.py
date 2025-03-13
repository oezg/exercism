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

PREFIX = {1e9: "giga", 1e6: "mega", 1e3: "kilo", 1: ""}


def resistor_label(colors: list[str]) -> str:
    *codes, last = colors
    if not codes:
        return f"{COLOR[last]} ohms"

    *values, exponent = [COLOR[color] for color in codes]
    value = int("".join([str(code) for code in values]))
    return "{:n} {}ohms ±{}%".format(*label(value * 10**exponent), TOLERANCE[last])


def label(value: int) -> tuple[float, str]:
    return next(
        (
            (value / factor, prefix)
            for factor, prefix in sorted(PREFIX.items(), reverse=True)
            if value >= factor
        ),
        (value, ""),
    )
