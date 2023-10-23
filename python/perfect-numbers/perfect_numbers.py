"""
perfect_numbers provide a utility function to determine if a number is perfect,
abundant, or deficient based on Nicomachus' (60 - 120 CE) classification scheme
for positive integers.

The Greek mathematician Nicomachus devised a classification scheme for positive
integers, identifying each as belonging uniquely to the categories of perfect,
abundant, or deficient based on their aliquot sum. The aliquot sum is defined
as the sum of the factors of a number not including the number itself.
"""


from typing import Iterator


def classify(number: int) -> str:
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    validate_positive(number=number)

    def nicomachus(aliquot: int) -> str:

        if aliquot > number:
            return 'abundant'

        if aliquot < number:
            return 'deficient'

        return 'perfect'

    return nicomachus(aliquot_sum(number=number))


def aliquot_sum(number: int) -> int:
    """
    returns the sum of the factors of a number not including the number itself.
    """

    return sum(factors(number))


def factors(number: int) -> Iterator[int]:
    """
    returns a generator of integers that divide evenly into the number
    """

    for i in range(1, number // 2 + 1):
        if number % i == 0:
            yield i


def validate_positive(number: int) -> None:
    """
    raises value error with the expected message if number is not positive integer
    """

    if number < 1 or not isinstance(number, int):
        raise ValueError("Classification is only possible for positive integers.")
