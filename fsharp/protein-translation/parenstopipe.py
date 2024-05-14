import re

pattern = re.compile(r"Ok\(Coding (\w+)\)")

with open("text3.txt", "r+", encoding="utf-8") as f:
    text = []
    for line in f.readlines():
        newline = pattern.sub(r"\1 |> Coding |> Ok", line)
        text.append(newline)
    f.seek(0)
    f.writelines(text)
    f.truncate()
