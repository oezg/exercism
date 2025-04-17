CLOSING_BRACKETS = {")": "(", "]": "[", "}": "{"}


def is_paired(input_string: str) -> bool:
    """
    Verify that any and all pairs are matched and nested correctly.
    Any other characters should be ignored.
    """
    return brack([letter for letter in input_string if letter in "(){}[]"], [])


def brack(brackets: list[str], stack: list[str]) -> bool:
    if brackets == []:
        return stack == []
    if brackets[0] in CLOSING_BRACKETS:
        return CLOSING_BRACKETS[brackets[0]] in stack[-1:] and brack(
            brackets[1:], stack[:-1]
        )
    return brack(brackets[1:], stack + brackets[0:1])
