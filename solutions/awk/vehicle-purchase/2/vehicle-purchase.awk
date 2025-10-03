BEGIN { FS = "," }

$1 == "needs_license" && $2 ~ "car|truck" { print "true" }

$1 == "resell_price" { print $2 * calculatePercentage($3) }

function calculatePercentage(age) {
    return age < 3 ? 0.8 : age > 10 ? 0.5 : 0.7
}
