BEGIN {
    OFS = FS = ","
    Allergens["eggs"] = lshift(1, 0)
    Allergens["peanuts"] = lshift(1, 1)
    Allergens["shellfish"] = lshift(1, 2)
    Allergens["strawberries"] = lshift(1, 3)
    Allergens["tomatoes"] = lshift(1, 4)
    Allergens["chocolate"] = lshift(1, 5)
    Allergens["pollen"] = lshift(1, 6)
    Allergens["cats"] = lshift(1, 7)
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
