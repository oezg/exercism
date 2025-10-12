BEGIN {
    drops[3] = "Pling"
    drops[5] = "Plang"
    drops[7] = "Plong"

    for (rain in drops)
    if (num % rain == 0) result = result drops[rain]

    print result ? result : num
}
