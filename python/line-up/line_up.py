"""Make the customers feel special by printing a message with their name on it"""


def line_up(name: str, number: int) -> str:
    """Given a name and a number, return a message containing the name and the ordinal position."""
    return f"{name}, you are the {ordinal(number)} customer we serve today. Thank you!"


def ordinal(number: int) -> str:
    return str(number) + suffix(number)


def suffix(number: int) -> str:
    """Return the ordinal suffix in English"""
    match number % 10:
        case 1 if number % 100 != 11:
            return "st"
        case 2 if number % 100 != 12:
            return "nd"
        case 3 if number % 100 != 13:
            return "rd"
        case _:
            return "th"
