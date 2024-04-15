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


def value(colors: list[str]) -> int:
    first_band, second_band, *_ = colors
    return 10 * color_code(color=first_band) + color_code(color=second_band)


def color_code(color: str) -> int:
    return ResistorColor[color.upper()].value
