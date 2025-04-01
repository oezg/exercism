def sum_of_multiples(limit: int, multiples: list[int]) -> int:
    """
    Returns the sum of numbers less than the limit divisible by one of the multiples
    """
    return sum(
        {
            number
            for multiple in multiples
            if multiple > 0
            for number in range(0, limit, multiple)
        }
    )
