"""
pangram provides utility to figure out if a sentence is a pangram.
"""

from string import ascii_lowercase


def is_pangram(sentence: str) -> bool:
    """
    A pangram is a sentence using every letter of the alphabet at least once.
    It is case insensitive.
    A pangram contains each of the 26 letters in the English alphabet.
    """

    return set(sentence.lower()).issuperset(ascii_lowercase)
