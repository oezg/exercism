import itertools


def combinations(target, size, exclude):
    include = (digit for digit in range(1, 10) if digit not in exclude)
    return [
        list(combination)
        for combination in itertools.combinations(include, size)
        if sum(combination) == target
    ]
