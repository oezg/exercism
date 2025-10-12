BEGIN { FS = "" }

{
    for (i = NF; i > 0; i--) reverse = reverse $i

    print reverse
}
