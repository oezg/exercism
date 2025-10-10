BEGIN { n = split("abcdefghijklmnopqrstuvwxyz", alpha, "") }

{
    flag = 0
    $0 = tolower($0)

    for (i = 1; i <= n && !flag; i++)
    if (!index($0, alpha[i])) flag = 1

    print flag ? "false" : "true"
}
