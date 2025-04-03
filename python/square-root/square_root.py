def square_root(number: int) -> int:
    """
    Finds the integer square root of positive integers using Heron's method.

    :param number: the number of which the square root is searched.
    :returns: the nearest integer to the square root of the given number.
    """
    result = 1
    while abs(result * result - number) >= 1:
        result = (result + number // result) // 2
    return result
