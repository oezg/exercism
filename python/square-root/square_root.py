def square_root(number: int) -> int:
    result = 1
    while abs(result * result - number) >= 1:
        result = round((result + number / result) / 2)
    return result
