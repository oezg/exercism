{
    name = $0 ? $0 : "you"
    printf("One for %s, one for me.\n", name)
    printed_anything = 1
}

END {
    if (!printed_anything) print "One for you, one for me."
}
