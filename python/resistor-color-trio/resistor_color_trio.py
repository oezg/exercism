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

class Prefix(enum.Enum):
    GIGA = 1_000_000_000
    MEGA = 1_000_000
    KILO = 1_000
    UNIT = 1


def label(colors: list[str]) -> int:
    first_band, second_band, third_band, *_ = colors
    resistance = resistance_value(first_band, second_band, third_band)
    for prefix in Prefix:
        if resistance >= prefix.value:
            return f'{resistance // prefix.value} {prefix.name.replace("UNIT", "").lower()}ohms'
    return '0 ohms'


def resistance_value(first_band, second_band, third_band: str) -> int:
    return (10 * color_code(first_band) + color_code(second_band)) * 10 ** color_code(third_band)


def color_code(color: str) -> int:
    return ResistorColor[color.upper()].value
