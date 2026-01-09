import itertools


def combinations(target, size, exclude):
    return list(
        map(
            list,
            filter(
                lambda t: sum(t) == target,
                itertools.combinations(
                    filter(lambda n: n not in exclude, range(1, 10)), size
                ),
            ),
        )
    )
