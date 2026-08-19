"""Make the customers feel special by printing a message with their name on it"""


def line_up(name, number):
    """Given a name and a number, your task is to produce a sentence using that name and that number as an ordinal numeral."""
    match number % 10:
        case 1 if number % 100 != 11:
            suffix = "st"
        case 2 if number % 100 != 12:
            suffix = "nd"
        case 3 if number % 100 != 13:
            suffix = "rd"
        case _:
            suffix = "th"
    return f"{name}, you are the {number}{suffix} customer we serve today. Thank you!"
