BEGIN {
    split("fly spider bird cat dog goat cow horse", Animal)
    first_line = "I know an old lady who swallowed a %s.\n"
    middle_line = "She swallowed the %s to catch the %s.\n"
    last_line = "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    tickled = " wriggled and jiggled and tickled inside her"
    Lines["spider"] = "It" tickled ".\n"
    Lines["bird"] = "How absurd to swallow a bird!\n"
    Lines["cat"] = "Imagine that, to swallow a cat!\n"
    Lines["dog"] = "What a hog, to swallow a dog!\n"
    Lines["goat"] = "Just opened her throat and swallowed a goat!\n"
    Lines["cow"] = "I don't know how she swallowed a cow!\n"

    for (i = start; i <= end; i++) print verse(i)
}

function verse(i) {
    animal = Animal[i]
    return sprintf(first_line, animal) Lines[animal] middle(i) final(animal)
}

function middle(i) {
    if (Lines[Animal[i]]) return refrain(Animal[i], Animal[i - 1]) middle(i - 1)
}

function refrain(swallowed, to_catch) {
    return sprintf(middle_line, swallowed, tickle(to_catch))
}

function tickle(to_catch) {
    return to_catch == "spider" ? to_catch " that" tickled : to_catch
}

function final(animal) {
    return animal == "horse" ? "She's dead, of course!\n" : last_line
}
