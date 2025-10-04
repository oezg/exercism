BEGIN {
    OFS = FS = ","
    allergens["eggs"] = 1
    allergens["peanuts"] = 2
    allergens["shellfish"] = 4
    allergens["strawberries"] = 8
    allergens["tomatoes"] = 16
    allergens["chocolate"] = 32
    allergens["pollen"] = 64
    allergens["cats"] = 128
    PROCINFO["sorted_in"] = "@val_num_asc"
}

$2 == "allergic_to" { print isAllergic($1, $3) ? "true" : "false" }

$2 == "list" {
    number = $1
    NF = 0

    for (allergen in allergens)
    if (isAllergic(number, allergen)) $++last = allergen

    print
}

function isAllergic(pathology, allergen) {
    score = allergens[allergen]
    return score == and(score, pathology)
}
