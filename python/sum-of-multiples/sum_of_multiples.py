from collections.abc import Iterable


def sum_of_multiples(limit: int, multiples: Iterable[int]) -> int:
    """
    Returns the sum of numbers less than the limit divisible by one of the multiples.

    :param limit: the exclusive upper bound
    :param multiples: iterable of numbers whose multiples it sums
    :returns: the sum of the unique multiples
    """
    return sum(
        {
            number
            for multiple in multiples
            if multiple > 0
            for number in range(0, limit, multiple)
        }
    )
