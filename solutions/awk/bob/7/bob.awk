BEGIN { RS = "^$" }

{
    yelling = /[[:upper:]]/ && !/[[:lower:]]/
    question = /\?[[:space:]]*$/
    silence = /^[[:space:]]*$/
}

question && yelling { say("Calm down, I know what I'm doing!") }

question { say("Sure.") }

yelling { say("Whoa, chill out!") }

silence { say("Fine. Be that way!") }

{ say("Whatever.") }

END {
    if (!NR) print "Fine. Be that way!"
}

function say(message) {
    print message
    next
}
