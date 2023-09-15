def is_armstrong_number(number: int) -> bool:
    """
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.
    """
    digits = split_digits(num=number)
    power = len(digits)
    return number == sum(digit ** power for digit in digits)


def split_digits(num: int) -> list[int]:
    out = []
    while num > 0:
        out.append(num % 10)
        num //= 10
    return out
