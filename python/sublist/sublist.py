from enum import Flag, auto
from typing import TypeVar


class TwoLists(Flag):
    UNEQUAL = 0
    SUBLIST = auto()
    SUPERLIST = auto()
    EQUAL = SUBLIST | SUPERLIST


T = TypeVar("T")

UNEQUAL, SUBLIST, SUPERLIST, EQUAL = TwoLists.__members__.values()


def sublist(list_one: list[T], list_two: list[T]) -> TwoLists:
    """
    Determine whether the two lists are equal, the first is a sublist
    or a superlist of the second, or they are unequal.
    """
    compare = lambda a, b, result: result if contains(a, b) else TwoLists.UNEQUAL
    return compare(list_one, list_two, TwoLists.SUBLIST) | compare(
        list_two, list_one, TwoLists.SUPERLIST
    )


def contains(list_one: list[T], list_two: list[T]) -> bool:
    """
    List A is a sublist of B if B contains a contiguous sub-sequence of values equal to A.
    """
    list_one_len = len(list_one)
    return any(
        list_two[start : start + list_one_len] == list_one
        for start in range(len(list_two) - list_one_len + 1)
    )
