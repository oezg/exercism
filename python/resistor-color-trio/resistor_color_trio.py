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


def label(colors: list[str]) -> int:
    first_band, second_band, third_band, *_ = colors
    resistance = value(first_band, second_band) * 10 ** color_code(color=third_band)
    prefixes = (('giga', 1_000_000_000), ('mega', 1_000_000), ('kilo', 1_000), ('', 1))
    for prefix, exponent in prefixes:
        if resistance >= exponent:
            return f'{resistance // exponent} {prefix}ohms'
    return '0 ohms'


def value(first_band, second_band: str) -> int:
    return 10 * color_code(color=first_band) + color_code(color=second_band)


def color_code(color: str) -> int:
    return ResistorColor[color.upper()].value
