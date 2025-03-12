import enum


class ResistorColor(enum.Enum):
    BLACK = 0
    BROWN = 1
    RED = 2
    ORANGE = 3
    YELLOW = 4
    GREEN = 5
    BLUE = 6
    VIOLET = 7
    GREY = 8
    WHITE = 9


class Tolerance(enum.Enum):
    GREY = 0.05
    VIOLET = 0.1
    BLUE = 0.25
    GREEN = 0.5
    BROWN = 1
    RED = 2
    GOLD = 5
    SILVER = 10

    def __str__(self) -> str:
        return f"±{self.value}%"


class Prefix(enum.Enum):
    GIGA = 1_000_000_000
    MEGA = 1_000_000
    KILO = 1_000
    UNIT = 1

    def __str__(self) -> str:
        return "" if self == Prefix.UNIT else self.name.lower()


def resistor_label(colors: list[str]) -> str:
    if len(colors) > 1:
        *values, exponent, tolerance = colors
        resistor_value = resistance_val(colors=values) * multiplier(exponent)
        tolerance = Tolerance[tolerance.upper()]
        resistor_label = f"{label(resistor_value)} {tolerance}"
    else:
        resistor_label = label(color_code(colors[0]))
    return resistor_label


def resistance_val(colors: list[str]) -> int:
    maximum_exponent = len(colors) - 1
    return sum(
        value * 10 ** (maximum_exponent - index)
        for index, value in enumerate(color_code(color) for color in colors)
    )


def multiplier(color: str) -> int:
    return 10 ** color_code(color=color)


def color_code(color: str) -> int:
    return ResistorColor[color.upper()].value


def label(resistance: int) -> str:
    return next(
        (
            f"{(resistance / prefix.value):n} {prefix}ohms"
            for prefix in Prefix
            if resistance >= prefix.value
        ),
        "0 ohms",
    )
