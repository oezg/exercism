"""
isogram provides a utility to determine is a word or phrase is an isogram
"""


def is_isogram(string: str) -> bool:
    """
    An isogram (also known as a "non-pattern word") is a word or phrase
    without a repeating letter, however spaces and hyphens are allowed
    to appear multiple times.
    """

    letters = list(filter(lambda letter: letter.isalpha(), string.lower()))
    return len(letters) == len(set(letters))
