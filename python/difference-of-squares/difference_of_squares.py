def square_of_sum(number: int) -> int:
    return sum_first(number) ** 2


def sum_of_squares(number: int) -> int:
    return sum_first(number) * (number * 2 + 1) // 3


def difference_of_squares(number: int) -> int:
    return square_of_sum(number) - sum_of_squares(number)


def sum_first(number: int) -> int:
    return number * (number + 1) // 2
