BEGIN {
    if (start < 1 || end < start || end > 12) {
        print "invalid argument" > "/dev/stderr"
        exit 1
    }

    text = "malt-lay in-rat-ate-cat-killed-dog-worried-cow with the crumpled horn-"\
        "tossed-maiden all forlorn-milked-man all tattered and torn-kissed-"\
        "priest all shaven and shorn-married-rooster that crowed in the morn-woke-"\
        "farmer sowing his corn-kept-horse and the hound and the horn-belonged to"

    split(text, a, "-")

    for (i = start; i <= end; i++) {
        for (j = 2 * i - 2; j > 0; j -= 2) s = s " the " a[j - 1] " that " a[j]

        printf("This is%s the house that Jack built.\n", s)
        s = ""
    }
}
