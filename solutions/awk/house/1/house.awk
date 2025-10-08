BEGIN {
    if (start < 1 || end < start || end > 12) {
        print "invalid argument" > "/dev/stderr"
        exit 1
    }

    a[1] = "the house that Jack built."
    a[2] = "the malt that lay in"
    a[3] = "the rat that ate"
    a[4] = "the cat that killed"
    a[5] = "the dog that worried"
    a[6] = "the cow with the crumpled horn that tossed"
    a[7] = "the maiden all forlorn that milked"
    a[8] = "the man all tattered and torn that kissed"
    a[9] = "the priest all shaven and shorn that married"
    a[10] = "the rooster that crowed in the morn that woke"
    a[11] = "the farmer sowing his corn that kept"
    a[12] = "the horse and the hound and the horn that belonged to"

    for (i = start; i <= end; i++) {
        $1 = "This is"

        for (j = i; j > 0; j--) $(i - j + 2) = a[j]

        print
    }
}
