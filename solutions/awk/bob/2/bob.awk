BEGIN { RS = "^$" }

{
    if (!/[a-z]/ && /[A-Z]/ && /\?$/) print "Calm down, I know what I'm doing!"
    else if (!/[a-z]/ && /[A-Z]/) print "Whoa, chill out!"
    else if (/\?[[:space:]]*$/) print "Sure."
    else if (/^[[:space:]]*$/) print "Fine. Be that way!"
    else print "Whatever."
}

# !/[a-z]/ && /[A-Z]/ && /\?$/ {
#     print "Calm down, I know what I'm doing!"
#     next
# }

# !/[a-z]/ && /[A-Z]/ {
#     print "Whoa, chill out!"
#     next
# }

# /\?[[:space:]]*$/ {
#     print "Sure."
#     next
# }

# /^[[:space:]]*$/ {
#     print "Fine. Be that way!"
#     next
# }

# { print "Whatever." }

# END {
#     if (NR == 0) print "Fine. Be that way!"
# }
