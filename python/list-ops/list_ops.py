from collections.abc import Callable
from typing import TypeVar

E = TypeVar("E")
A = TypeVar("A")
T = TypeVar("T")


def append(list1: list[E], list2: list[E]) -> list[E]:
    return concat([list1, list2])


def concat(lists: list[list[E]]) -> list[E]:
    return [item for sublist in lists for item in sublist]


def filter(predicate: Callable[[E], bool], list: list[E]) -> list[E]:
    return [item for item in list if predicate(item)]


def length(list: list[E]) -> int:
    return sum(1 for _ in list)


def map(function: Callable[[E], T], list: list[E]) -> list[T]:
    return [function(item) for item in list]


def foldl(function: Callable[[A, E], A], list: list[E], initial: A) -> A:
    result = initial
    for item in list:
        result = function(result, item)
    return result


def foldr(function: Callable[[A, E], A], list: list[E], initial: A) -> A:
    return foldl(function, reverse(list), initial)


def reverse(list: list[E]) -> list[E]:
    return foldl(lambda acc, item: append([item], acc), list, [])
