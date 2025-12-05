BEGIN {
    split("eggs peanuts shellfish strawberries tomatoes chocolate pollen cats", words)

    for (idx in words) Allergens[words[idx]] = lshift(1, idx - 1)

    OFS = FS = ","
}

$2 == "allergic_to" { $0 = and($1, Allergens[$3]) ? "true" : "false" }

$2 == "list" {
    number = $1
    NF = 0

    PROCINFO["sorted_in"] = "@val_num_asc"

    for (allergen in Allergens)
    if (and(number, Allergens[allergen])) $++NF = allergen
}

1
