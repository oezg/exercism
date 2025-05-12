CLOSING_BRACKETS = {")": "(", "]": "[", "}": "{"}


def is_paired(input_string: str) -> bool:
    """
    Verify that any and all pairs are matched and nested correctly.
    Any other characters should be ignored.
    """
    return brack([letter for letter in input_string if letter in "(){}[]"], [])


def brack(brackets: list[str], stack: list[str]) -> bool:
    for bracket in brackets:
        if bracket in CLOSING_BRACKETS:
            if not stack:
                return False
            if CLOSING_BRACKETS[bracket] != stack[-1]:
                return False
            stack = stack[:-1]
        else:
            stack = stack + [bracket]
    return stack == []
