BEGIN {
    RS = "^$"
    has_upper = "[[:upper:]]"
    has_lower = "[[:lower:]]"
    question = "\\?[[:space:]]*$"
    silence = "^[[:space:]]*$"
}

$0 ~ question && $0 ~ has_upper && $0 !~ has_lower {
    print "Calm down, I know what I'm doing!"
    next
}

$0 ~ question {
    print "Sure."
    next
}

$0 ~ has_upper && $0 !~ has_lower {
    print "Whoa, chill out!"
    next
}

$0 ~ silence {
    print "Fine. Be that way!"
    next
}

{ print "Whatever." }

END {
    if (NR == 0) print "Fine. Be that way!"
}
