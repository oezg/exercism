def steps(number: int) -> int:
    """
    Given a number, return the number of steps required to reach 1.
    """

    if number < 1:
        raise ValueError("Only positive integers are allowed")
    count = 0
    while number > 1:
        count += 1
        if number % 2 == 0:
            number //= 2
        else:
            number = number * 3 + 1
    return count
