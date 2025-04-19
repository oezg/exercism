import typing


T = typing.TypeVar("T")

UNEQUAL, SUBLIST, SUPERLIST, EQUAL = range(4)


def sublist(list_one: list[T], list_two: list[T]) -> typing.Literal[0, 1, 2, 3]:
    """
    Determine whether the two lists are equal, the first is a sublist
    or a superlist of the second, or they are unequal.
    """
    if list_one == list_two:
        return EQUAL
    if contains(list_two, list_one):
        return SUPERLIST
    if contains(list_one, list_two):
        return SUBLIST
    return UNEQUAL


def contains(list_one: list[T], list_two: list[T]) -> bool:
    """
    List A is a sublist of B if B contains a contiguous sub-sequence of values equal to A.
    """
    list_one_len = len(list_one)
    for start in range(len(list_two) - list_one_len + 1):
        if list_two[start : start + list_one_len] == list_one:
            return True
    return False
