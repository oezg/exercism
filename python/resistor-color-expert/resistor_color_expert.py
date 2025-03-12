import enum
from functools import reduce


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
        match self:
            case Prefix.UNIT:
                return ""
            case _:
                return self.name.lower()


def resistor_label(colors: list[str]) -> str:
    try:
        *values, exponent, tolerance = colors
    except:
        return label(color_code(colors[0]))
    return f"{label(resistance_val(colors=values) * multiplier(exponent))} {Tolerance[tolerance.upper()]}"


def resistance_val(colors: list[str]) -> int:
    return sum(
        10 ** (len(colors) - i) * color_code(color) for i, color in enumerate(colors, 1)
    )


def multiplier(color: str) -> int:
    return 10 ** color_code(color=color)


def color_code(color: str) -> int:
    return ResistorColor[color.upper()].value


def label(resistance: int) -> str:
    for prefix in Prefix:
        if resistance >= prefix.value:
            return f"{(resistance / prefix.value):n} {prefix}ohms"
    return "0 ohms"
