.heyBob 
| gsub("^\\s+|\\s+$"; "") 
| (length == 0) as $silence
| endswith("?") as $question
| ((test("[a-z]") | not) and test("[A-Z]")) as $yell
| if $yell and $question then
    "Calm down, I know what I'm doing!"
elif $yell then
    "Whoa, chill out!"
elif $question then
    "Sure."
elif $silence then
    "Fine. Be that way!"
else
    "Whatever."
end