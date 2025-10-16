BEGIN {
    RS = "^$"
    question = "\\?[[:space:]]*$"
    silence = "^[[:space:]]*$"
    no_lower = "^[^a-z]+$"
    an_upper = "[A-Z]"
}

{
    say_when("Calm down, I know what I'm doing!", no_lower, an_upper, question)
    say_when("Whoa, chill out!", no_lower, an_upper)
    say_when("Sure.", question)
    say_when("Fine. Be that way!", silence)
    print "Whatever."
}

END {
    if (NR == 0) print "Fine. Be that way!"
}

function say_when(say, re1, re2, re3) {
    if ($0 ~ re1 && $0 ~ re2 && $0 ~ re3) {
        print say
        next
    }
}
