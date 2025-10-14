import itertools


def factors(value: int, last: int = 2) -> list[int]:
    if value == 1:
        return []
    for i in itertools.count(last):
        if value % i == 0:
            return [i] + factors(value // i)
