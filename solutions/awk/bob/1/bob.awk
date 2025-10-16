BEGIN { RS = "" }

!/[a-z]/ && /[A-Z]/ && /\?$/ {
    print "Calm down, I know what I'm doing!"
    next
}

!/[a-z]/ && /[A-Z]/ {
    print "Whoa, chill out!"
    next
}

/\?[[:space:]]*$/ {
    print "Sure."
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
