def commands(binary_str: str) -> list[str]:
    commands = [
        command
        for binary, command in zip(
            binary_str,
            ["reverse", "jump", "close your eyes", "double blink", "wink"],
        )
        if int(binary)
    ]
    if commands and commands[0] == "reverse":
        return commands[1:]
    return commands[::-1]
