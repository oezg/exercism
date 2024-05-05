with open("text.txt", "r+", encoding="utf-8") as f:
    text = []
    for line in f.readlines():
        newline = line.replace("| ", "| [").replace(",", ";").replace(" -> ", "] -> ")
        text.append(newline)
    f.seek(0)
    f.writelines(text)
    f.truncate()
