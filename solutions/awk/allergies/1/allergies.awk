BEGIN {
    FS = ","
    allergens["eggs"] = 1
    allergens["peanuts"] = 2
    allergens["shellfish"] = 4
    allergens["strawberries"] = 8
    allergens["tomatoes"] = 16
    allergens["chocolate"] = 32
    allergens["pollen"] = 64
    allergens["cats"] = 128
}

$2 == "allergic_to" { print isAllergic($1, $3) ? "true" : "false" }

$2 == "list" {
    PROCINFO["sorted_in"] = "@val_num_asc"

    for (allergen in allergens)
    if (isAllergic($1, allergen))
        allergies = allergies ? allergies "," allergen : allergen

    print allergies
}

function isAllergic(pathology, allergen) {
    score = allergens[allergen]
    return score == and(score, pathology)
}
