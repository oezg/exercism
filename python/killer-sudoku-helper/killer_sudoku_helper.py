import itertools


def combinations(target, size, exclude):
    return [
        list(combination)
        for combination in itertools.combinations(range(1, 10), size)
        if sum(combination) == target
        and all(excluded not in combination for excluded in exclude)
    ]
