def response(hey_bob: str) -> str:
    """
    return what Bob will reply to someone when they say something to him or ask him a question.
    """

    if is_yell(hey_bob) and is_question(hey_bob):
        return "Calm down, I know what I'm doing!"
    if is_yell(hey_bob):
        return "Whoa, chill out!"
    if is_question(hey_bob):
        return "Sure."
    if is_silence(hey_bob):
        return "Fine. Be that way!"
    return "Whatever."


def is_yell(text: str) -> bool:
    return any(letter.isalpha() for letter in text) and all(letter.isupper() for letter in text if letter.isalpha())


def is_question(text: str) -> bool:
    return text.rstrip().endswith("?")


def is_silence(text: str) -> bool:
    return not text.strip()
