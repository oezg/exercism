BEGIN {
    if (start < 1 || end < start || end > 12) {
        print "invalid argument" > "/dev/stderr"
        exit 1
    }

    rhymes[1] = "house that Jack built."
    rhymes[2] = "malt that lay in"
    rhymes[3] = "rat that ate"
    rhymes[4] = "cat that killed"
    rhymes[5] = "dog that worried"
    rhymes[6] = "cow with the crumpled horn that tossed"
    rhymes[7] = "maiden all forlorn that milked"
    rhymes[8] = "man all tattered and torn that kissed"
    rhymes[9] = "priest all shaven and shorn that married"
    rhymes[10] = "rooster that crowed in the morn that woke"
    rhymes[11] = "farmer sowing his corn that kept"
    rhymes[12] = "horse and the hound and the horn that belonged to"

    while (start <= end) print line(start++, "This is")
}

function line(idx,   result) {
    while (idx) result = result " the " rhymes[idx--]

    return result
}
