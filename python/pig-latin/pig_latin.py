import re


def translate(text: str) -> str:
    """
    Translate text from English to Pig Latin.

    :param text: english
    :return: pig latin
    """
    return " ".join(map(pig_latin, text.split()))


def pig_latin(text: str) -> str:
    return rotate(text) + "ay"


def rotate(text: str) -> str:
    if text.startswith(("xr", "yt")):
        return text
    if text.startswith("y"):
        return rotate(text[1:] + "y")
    try:
        initial_consonants, rest = split_vowel(text)
    except ValueError:
        raise ValueError(f"No vowel found in '{text}'")
    if rest.startswith("u") and initial_consonants.endswith("q"):
        return rest[1:] + initial_consonants + "u"
    return rest + initial_consonants


def split_vowel(text: str) -> list[str]:
    return re.split(r"(?=[aeiouy])", text, maxsplit=1)
