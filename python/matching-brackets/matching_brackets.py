CLOSING_BRACKETS = {")": "(", "]": "[", "}": "{"}


def is_paired(input_string: str) -> bool:
    """
    Verify that any and all pairs are matched and nested correctly.
    Any other characters should be ignored.
    """
    return brack([letter for letter in input_string if letter in "(){}[]"], [])


def brack(brackets: list[str], stack: list[str]) -> bool:
    for bracket in brackets:
        try:
            if CLOSING_BRACKETS[bracket] != stack.pop():
                return False
        except KeyError:
            stack.append(bracket)
        except IndexError:
            return False
    return stack == []
