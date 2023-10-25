"""
isogram provides a utility to determine is a word or phrase is an isogram
"""


def is_isogram(string: str) -> bool:
    """
    An isogram (also known as a "non-pattern word") is a word or phrase
    without a repeating letter, however spaces and hyphens are allowed
    to appear multiple times.
    """

    return is_all_elements_unique(filter_letters_from(string))


def filter_letters_from(text: str) -> list[str]:
    """Remove the non-alphabetical characters from a string.
    Case insensitive. Result carries only lower case letters.
    
    :param text: str original string to filter the letters
    :return: iterator of letters
    """

    return [letter for letter in text.lower() if letter.isalpha()]


def is_all_elements_unique(sequence: list) -> bool:
    """I want a generic method that tells me if all elements in a 
    sequence are unique.

    :param sqeuence: list[T] 
    :return: bool if all elements occur once
    """

    return len(sequence) == len(set(sequence))


def is_isogram_1(string: str) -> bool:
    """
    An isogram (also known as a "non-pattern word") is a word or phrase
    without a repeating letter, however spaces and hyphens are allowed
    to appear multiple times.
    """

    letters = [letter for letter in string.lower() if letter.isalpha()]
    return len(letters) == len(set(letters))
