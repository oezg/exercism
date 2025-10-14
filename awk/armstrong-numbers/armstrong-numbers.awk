BEGIN {
    len = length(num)

    for (i = 1; i <= len; i++) sum += substr(num, i, 1) ^ len

    print num == sum ? "true" : "false"
}
