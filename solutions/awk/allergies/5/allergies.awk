BEGIN {
    split(\
        "eggs peanuts shellfish strawberries tomatoes chocolate pollen cats",
        Allergens\
    )

    OFS = FS = ","
}

$2 == "allergic_to" { $0 = and($1, Allergens[$3]) ? "true" : "false" }

$2 == "list" {
    number = $1
    NF = 0

    # PROCINFO["sorted_in"] = "@val_num_asc"
    for (idx in Allergens)
    if (and(number, lshift(1, idx - 1))) $++NF = Allergens[idx]
}

1
