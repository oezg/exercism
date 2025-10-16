function ar(a, b, c) {
    if ($0 ~ a && $0 ~ b && $0 ~ c) print "Hello"
    else print "NOPE"
}

{ ar("3", "4") }
