{
    split($0, a, " |-")
    result = ""

    for (i = 1; i <= length(a); i++) {
        match(a[i], /[a-zA-Z]/, array)
        letter = array[0]
        result = result toupper(letter)
    }

    print result
}
