UNEQUAL, SUPERLIST, SUBLIST, EQUAL = 0, 1, 2, 3


def sublist(a: list, b: list) -> int:
    """
    Given any two lists A and B, determine whether
    * A is equal to B,
    * A is a sublist of B,
    * A is a superlist of B,
    * otherwise they are unequal.
    """
    return int(f"{contains(a, b)}{contains(b, a)}", 2)


def contains(a: list, b: list) -> int:
    """
    List A is a sublist of B if B contains a contiguous sub-sequence of values equal to A
    """
    return int(any(b[i : i + len(a)] == a for i in range(len(b) - len(a) + 1)))
