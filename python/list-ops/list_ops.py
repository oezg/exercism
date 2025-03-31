def append(list1, list2):
    return concat([list1, list2])


def concat(lists):
    return [item for sublist in lists for item in sublist]


def filter(predicate, list):
    return [item for item in list if predicate(item)]


def length(list):
    if list == []:
        return 0
    return 1 + length(list[1:])


def map(function, list):
    return [function(item) for item in list]


def foldl(function, list, initial):
    result = initial
    for item in list:
        result = function(result, item)
    return result


def foldr(function, list, initial):
    return foldl(function, reverse(list), initial)


def reverse(list):
    if list == []:
        return []
    return append(reverse(list[1:]), [list[0]])
