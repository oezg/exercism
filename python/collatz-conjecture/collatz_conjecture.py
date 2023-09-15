def steps(number: int) -> int:
    """
    Given a number, return the number of steps required to reach 1.
    """

    if number < 1:
        raise ValueError("Only positive integers are allowed")
    count = 0
    while number > 1:
        count += 1
        number = number * 3 + 1 if number % 2 else number // 2
    return count
