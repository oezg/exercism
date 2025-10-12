BEGIN {
    drops = (num % 3 ? "" : "Pling") (num % 5 ? "" : "Plang")\
        (num % 7 ? "" : "Plong")

    print drops ? drops : num
}
