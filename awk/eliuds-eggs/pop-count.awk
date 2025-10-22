{
    do pop_count += and($1, 1)
    while ($1 = rshift($1, 1))

    print pop_count
}
