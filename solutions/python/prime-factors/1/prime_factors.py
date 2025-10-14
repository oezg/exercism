import itertools


def factors(value: int) -> list[int]:
    if value == 1:
        return []
    for i in itertools.count(2):
        if value % i == 0:
            return [i] + factors(value // i)
