import string
import itertools

def rows(letter: str) -> list[str]:
    pos = string.ascii_uppercase.index(letter)+1
    format_row = lambda letter, index: " " * (pos - index + 1) + letter + " " * index
    t= [
        mirror(l) for l in (format_row(x, i)
        for i, x in enumerate(string.ascii_uppercase[:pos]))
    ]
    return mirror(t)


def mirror(iterable):
    return iterable + iterable[:-1][::-1]