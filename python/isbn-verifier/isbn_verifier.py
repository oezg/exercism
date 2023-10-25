"""
The ISBN-10 verification process is used to validate book identification numbers. 
These normally contain dashes and look like: 3-598-21508-8

The ISBN-10 format is 9 digits (0 to 9) plus one check character (either a digit or an X only). 
In the case the check character is an X, this represents the value '10'. These may be 
communicated with or without hyphens, and can be checked for their validity by the following 
formula:

(d₁ * 10 + d₂ * 9 + d₃ * 8 + d₄ * 7 + d₅ * 6 + d₆ * 5 + d₇ * 4 + d₈ * 3 + d₉ * 2 + d₁₀ * 1) mod 11 == 0
If the result is 0, then it is a valid ISBN-10, otherwise it is invalid.

"""

import re
from typing import Callable, Iterator


CHECK_MOD = 11
VERIFICATION_PROCESS = 10
ISBN_FORMAT = '^\d-?\d{3}-?\d{5}-?[\dX]$'


def is_valid(isbn: str) -> bool:
    """Given a string the program should check if the provided string is a valid ISBN-10. 
    Putting this into place requires some thinking about preprocessing/parsing of the 
    string prior to calculating the check digit for the ISBN.
    
    The program should be able to verify ISBN-10 both with and without separating dashes.

    Caveats
    Converting from strings to numbers can be tricky in certain languages. Now, it's even
    trickier since the check digit of an ISBN-10 may be 'X' (representing '10'). 
    For instance 3-598-21507-X is a valid ISBN-10.
    
    :param isbn: str
    :return: bool
    """

    if not is_valid_format(ISBN_FORMAT)(isbn):
        return False
    
    try:
        return is_factor(CHECK_MOD)(check_sum(VERIFICATION_PROCESS)(digits_from(isbn)))
    except ValueError:
        return False


def is_valid_format(format: str) -> Callable[[str], bool]:
    """Produce parametrized function to check if given string matches a format.

    :param format: str the format to check against
    :return: function takes string to verify and match against the format
    """

    return lambda isbn: re.match(ISBN_FORMAT, isbn)



def digits_from(isbn: str) -> Iterator[int]:
    """Extract digits from a string and append 10 if ends with X

    :param isbn: str to extract digits from
    :return: iterator of digits with 10 at the end if isbn ends with X
    """

    for char in isbn:
        if char.isdigit():
            yield int(char)
    if isbn.endswith('X'):
        yield VERIFICATION_PROCESS


def is_factor(factor: int) -> Callable[[int], bool]:
    """Produce function to check if the factor evenly divides into a number.

    :param factor: int
    :return: function takes number and returns true if fator divides it evenly
    """

    return lambda number: number % factor == 0


def check_sum(verification: int) -> Callable[[Iterator[int]], int]:
    """Given a sequence of numbers calculate the sum of each element multiplied 
    with the descending range of numbers from the verification number down to 1.

    :param verification: int length of the sqeunce to be verified
    :return: function takes sequnece of digits and returns sum of vector multiplication
    :raises: ValueError if length of digits is not equal to verification 
    """

    return lambda digits: vector_multiply(digits, range(verification, 0, -1))


def vector_multiply(n: Iterator[int], m: Iterator[int]) -> int:
    """Given two sequence of numbers calculate the sum of the products of tuples
    
    :param n: Iterator[int] sequence of digits
    :param m: Iterator[int] sequence of factors
    :return: int sum of the products of each tuple
    :raises: ValueError if the sequences do not have the same length
    """

    return sum(x * y for x, y in zip(n, m, strict=True))