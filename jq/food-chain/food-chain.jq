def when(condition; message):
    if condition then message else "" end;

def animal:
    ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"][.];

def first_line:
    "I know an old lady who swallowed a \(animal).\n";

def second_line:
    [
        "It wriggled and jiggled and tickled inside her.",
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"   
    ][. - 1] + "\n";

def wriggled:
    when(animal == "bird"; " that wriggled and jiggled and tickled inside her");

def nth_line_from_end:
    "She swallowed the \(animal) to catch the \((. - 1) | animal)\(wriggled).\n";

def final_line:
    "I don't know why she swallowed the fly. Perhaps she'll die.\n";

def verse:
    [
        first_line, 
        when(animal != "fly"; second_line), 
        when(animal != "horse"; (range(.; 0; -1) | nth_line_from_end), final_line)
    ] | add;

[range(.startVerse - 1; .endVerse) | verse] | join("\n")