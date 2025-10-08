BEGIN {
    if (start < 1 || end < start || end > 12) {
        print "invalid argument" > "/dev/stderr"
        exit 1
    }

    a[1] = "house that Jack built."
    a[2] = "malt that lay in"
    a[3] = "rat that ate"
    a[4] = "cat that killed"
    a[5] = "dog that worried"
    a[6] = "cow with the crumpled horn that tossed"
    a[7] = "maiden all forlorn that milked"
    a[8] = "man all tattered and torn that kissed"
    a[9] = "priest all shaven and shorn that married"
    a[10] = "rooster that crowed in the morn that woke"
    a[11] = "farmer sowing his corn that kept"
    a[12] = "horse and the hound and the horn that belonged to"

    for (i = start; i <= end; i++) {
        line = "This is"

        for (j = i; j > 0; j--) line = line " the " a[j]

        print line
    }
}
