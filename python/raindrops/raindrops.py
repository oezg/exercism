"""
raindrops provide utility to convert a number to a string that
contains raindrop sounds corresponding to certain potential factors.
"""

import functools


FACTORS: dict[int, str] = {3: 'i', 5: 'a', 7: 'o'}


def convert(number: int) -> str:
    """
    if a given number:
    has 3 as a factor, add 'Pling' to the result.
    has 5 as a factor, add 'Plang' to the result.
    has 7 as a factor, add 'Plong' to the result.
    does not have any of 3, 5, or 7 as a factor,
    the result should be the digits of the number.
    """

    return "".join(
        f"Pl{vowel}ng"
        for factor, vowel
        in FACTORS.items()
        if is_factor(number, factor)
    ) or str(number)


def convert1(number: int) -> str:
    """
    if a given number:
    has 3 as a factor, add 'Pling' to the result.
    has 5 as a factor, add 'Plang' to the result.
    has 7 as a factor, add 'Plong' to the result.
    does not have any of 3, 5, or 7 as a factor,
    the result should be the digits of the number.
    """

    out = functools.reduce(
            lambda acc, v: f"{acc}Pl{FACTORS[v]}ng",
            filter(lambda v: is_factor(number, v), FACTORS),
            '')

    return out if out else str(number)


def is_factor(n, m: int) -> bool:
    """
    returns true if a number divides evenly into the other.
    """
    return n % m == 0
