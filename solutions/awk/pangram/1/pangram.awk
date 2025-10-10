BEGIN { n = split("abcdefghijklmnopqrstuvwxyz", alpha, "") }

{
    $0 = tolower($0)

    for (i = 1; i <= n; i++)
    if (index($0, alpha[i]) == 0) {
        print "false"
        next
    }

    print "true"
}
