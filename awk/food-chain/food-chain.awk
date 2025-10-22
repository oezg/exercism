BEGIN {

    split("fly spider bird cat dog goat cow horse", a)
    first_line = "I know an old lady who swallowed a %s.\n"

    last_line = "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    for (i=start; i <= end; i++)
        printf("%s%s", verse(i), i < end ? "\n" : "")
}

function verse(i) {
    init = sprintf(first_line, a[i])
    if (i == 1) {
        return init "\n" last_line
    }
    if (i == length(a)) {
        return init "\n" "She's dead, of course!\n"
    }
    for (j=2; j<=i; j++)



}

function second_line(animal) {
    switch (animal) {
        case "spider": return "It wriggled and jiggled and tickled inside her."
        case "bird": return "How absurd to swallow a bird!"
        case "cat": return "Imagine that, to swallow a cat!"
        case "dog": return "What a hog, to swallow a dog!"
        case "goat": return "Just opened her throat and swallowed a goat!"
        case "cow": return "I don't know how she swallowed a cow!"
    }
}