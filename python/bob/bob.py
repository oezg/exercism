def response(hey_bob: str) -> str:
    """
    return what Bob will reply to someone when they say something to him or ask him a question.
    """

    if len(bob := hey_bob.strip()) == 0:
        return "Fine. Be that way!"
    
    return (
        "Whatever.",
        "Sure.",
        "Whoa, chill out!",
        "Calm down, I know what I'm doing!"
    )[is_yell(bob) + is_question(bob)]


def is_yell(text: str) -> bool:
    return 2 if text.isupper() else 0


def is_question(text: str) -> bool:
    return 1 if text.endswith("?") else 0
