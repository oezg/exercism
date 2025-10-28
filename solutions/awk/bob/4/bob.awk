BEGIN { RS = "^$" }

/[[:upper:]]/ && !/[[:lower:]]/ && /\?[[:space:]]*$/ {
    print "Calm down, I know what I'm doing!"
    next
}

/\?[[:space:]]*$/ {
    print "Sure."
    next
}

/[[:upper:]]/ && !/[[:lower:]]/ {
    print "Whoa, chill out!"
    next
}

/^[[:space:]]*$/ {
    print "Fine. Be that way!"
    next
}

{ print "Whatever." }

END {
    if (NR == 0) print "Fine. Be that way!"
}
