def animal:
    ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"][.];

def first_line:
    "I know an old lady who swallowed a \(animal).\n";

def when(condition; message):
    if condition then message else "" end;

def second_line:
    [
        null,
        "It wriggled and jiggled and tickled inside her.",
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"   
    ][.] + "\n";

def final_line:
    "I don't know why she swallowed the fly. Perhaps she'll die.\n";

def wriggled:
    when(animal == "bird"; " that wriggled and jiggled and tickled inside her");

def nth_line_from_end:
    "She swallowed the \(animal) to catch the \((. - 1) | animal)\(wriggled).\n";

def verse:
    [
        first_line, 
        when(. > 0; second_line), 
        when(. < 7; (range(.; 0; -1) | nth_line_from_end), final_line)
    ] | add;

[range(.startVerse - 1; .endVerse) | verse] | join("\n")