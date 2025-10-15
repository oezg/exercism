BEGIN { FS = "," }

{
    while (lower < NF) {
        middle = int((NF - lower + 1) / 2) + lower

        if ($middle == value) {
            print middle
            next
        }

        $middle < value ? lower = middle : NF = middle - 1
    }

    print -1
}
