import string


def rows(letter: str) -> list[str]:
    idx = string.ascii_uppercase.index(letter)
    letters = list(string.ascii_uppercase)[: idx + 1]
    vertical_letters = letters[:-1] + letters[::-1]
    horizontal_letters = letters[::-1] + letters[1:]
    return [
        "".join(
            horizontal if horizontal == vertical else " "
            for horizontal in horizontal_letters
        )
        for vertical in vertical_letters
    ]
