def recite(start_verse, end_verse: int) -> list[str]:
    return [
        f"This is {verse(i)} that Jack built."
        for i in range(start_verse - 1, end_verse)
    ]


house = [
    "malt that lay in",
    "rat that ate",
    "cat that killed",
    "dog that worried",
    "cow with the crumpled horn that tossed",
    "maiden all forlorn that milked",
    "man all tattered and torn that kissed",
    "priest all shaven and shorn that married",
    "rooster that crowed in the morn that woke",
    "farmer sowing his corn that kept",
    "horse and the hound and the horn that belonged to",
]


def verse(i):
    if i == 0:
        return "the house"
    return f"the {house[i-1]} {verse(i-1)}"
