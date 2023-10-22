"""
darts provide utility to score the earned points in a single toss of a Darts game.

If the dart lands outside the target, player earns no points (0 points).
If the dart lands in the outer circle of the target, player earns 1 point.
If the dart lands in the middle circle of the target, player earns 5 points.
If the dart lands in the inner circle of the target, player earns 10 points.

The outer circle has a radius of 10 units (this is equivalent to the total
radius for the entire target), the middle circle a radius of 5 units, and
the inner circle a radius of 1. Of course, they are all centered at the same
point — that is, the circles are concentric defined by the coordinates (0, 0).
"""

import math


def score(x: float, y: float) -> int:
    """
    returns the amount earned by a dart landing at the given point in the target
    (defined by its Cartesian coordinates x and y, where x and y are real.
    """

    return dart_score(radius(x, y))


def dart_score(r: float) -> int:
    """
    converts distance from origin to dart score
    """

    if r > 10:
        return 0

    if r > 5:
        return 1

    if r > 1:
        return 5

    return 10


def score1(x: float, y: float) -> int:
    """
    returns the amount earned by a dart landing at the given point in the target
    (defined by its Cartesian coordinates x and y, where x and y are real.
    """
    r = radius(x, y)
    match r:
        case r if r <= 1:
            return 10
        case r if r <= 5:
            return 5
        case r if r <= 10:
            return 1
        case _:
            return 0


def radius(x: float, y: float) -> float:
    """
    returns distance of a given point from the origin
    """
    return math.sqrt(x*x + y*y)
