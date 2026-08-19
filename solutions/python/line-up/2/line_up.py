def line_up(name, number):
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
