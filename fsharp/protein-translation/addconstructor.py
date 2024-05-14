with open("text4.txt", "r+", encoding="utf-8") as f:
    text = []
    for line in f.readlines():
        newline = line.replace(" |> Ok", " |> Codon |> Ok")
        text.append(newline)
    f.seek(0)
    f.writelines(text)
    f.truncate()
