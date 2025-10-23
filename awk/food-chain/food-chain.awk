BEGIN {
    split("fly spider bird cat dog goat cow horse", a)
    first_line = "I know an old lady who swallowed a %s.\n"
    middle_line = "She swallowed the %s to catch the %s%s.\n"
    last_line = "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    tickled = " wriggled and jiggled and tickled inside her"

    for (i = start; i <= end; i++) printf("%s%s", verse(i), i < end ? "\n" : "")
}

function verse(i) {
    return sprintf(first_line, a[i]) second_line(a[i]) middle(i) final(a[i])
}

function middle(i) {
    return 1 < i && i < 8 ? refrain(a[i], a[i - 1]) middle(i - 1) : ""
}

function refrain(swallowed, to_catch) {
    return sprintf(\
        middle_line,
        swallowed,
        to_catch,
        to_catch == "spider" ? " that" tickled : ""\
    )
}

function second_line(animal) {
    switch (animal) {
        case "spider":
            return "It" tickled ".\n"
        case "bird":
            return "How absurd to swallow a bird!\n"
        case "cat":
            return "Imagine that, to swallow a cat!\n"
        case "dog":
            return "What a hog, to swallow a dog!\n"
        case "goat":
            return "Just opened her throat and swallowed a goat!\n"
        case "cow":
            return "I don't know how she swallowed a cow!\n"
        default:
            return ""
    }
}

function final(animal) {
    return animal == "horse" ? "She's dead, of course!\n" : last_line
}
