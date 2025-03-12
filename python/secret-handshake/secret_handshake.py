COMMANDS = ["reverse", "jump", "close your eyes", "double blink", "wink"]


def commands(binary_str: str) -> list[str]:
    commands = [
        command
        for binary, command in zip(
            binary_str,
            COMMANDS,
        )
        if int(binary)
    ]
    if commands and commands[0] == "reverse":
        result = commands[1:]
    else:
        result = commands[::-1]
    return result
