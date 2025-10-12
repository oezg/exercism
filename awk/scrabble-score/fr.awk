BEGIN { FS = "\t" }

{
    split($1, arr, ", ")

    for (char in arr) {
        print "case \"" arr[char] "\":"
        print "\treturn " $2
    }
}
