import string


def rows(letter: str) -> list[str]:
    idx = string.ascii_uppercase.index(letter)
    letters = list(string.ascii_uppercase)[: idx + 1]
    return [
        "".join(
            horizontal if horizontal == vertical else " "
            for horizontal in letters[::-1] + letters[1:]
        )
        for vertical in letters[:-1] + letters[::-1]
    ]
