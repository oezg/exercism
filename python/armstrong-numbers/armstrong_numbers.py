from collections import deque


def is_armstrong_number(number: int) -> bool:
    """
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.
    """
    digits = split_digits(num=number)
    return number == sum(digit ** len(digits) for digit in digits)


def split_digits(num: int) -> deque[int]:
    out = deque()
    while num > 0:
        out.appendleft(num % 10)
        num //= 10
    return out
