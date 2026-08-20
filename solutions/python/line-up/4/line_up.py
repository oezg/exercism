"""Make the customers feel special by printing a message with their name on it"""


def line_up(name: str, number: int) -> str:
    """Given a name and a number, return a message containung the name and the ordinal position."""
    return template()(name, ordinal(number))
#    return f"{name}, you are the {number}{suffix} customer we serve today. Thank you!"

def ordinal(number: int) -> str:
    return f"{number}{suffix(number)}"

def template():
    temp = "{a}, you are the {b} customer we serve today. Thank you!"
    def wrap(name, position):
        return temp.format(a=name, b=position)
    return wrap

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
