from collections.abc import Iterable
from functools import reduce


def flatten(iterable: Iterable) -> list:
    """
    Given an arbitrarily-deep nested list-like structure,
    return a single flattened list with all values except None.
    """
    return [
        item
        for sublist in (
            ([] if x is None else flatten(x) if isinstance(x, Iterable) else [x])
            for x in iterable
        )
        for item in sublist
    ]
