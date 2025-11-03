BEGIN { RS = "^$" }

{
    if (question() && yelling()) print "Calm down, I know what I'm doing!"
    else if (question()) print "Sure."
    else if (yelling()) print "Whoa, chill out!"
    else if (silence()) print "Fine. Be that way!"
    else print "Whatever."
}

END {
    if (!NR) print "Fine. Be that way!"
}

function question() { return /\?[[:space:]]*$/ }

function yelling() { return /[[:upper:]]/ && !/[[:lower:]]/ }

function silence() { return /^[[:space:]]*$/ }
