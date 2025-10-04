BEGIN {
    allergens["eggs"] = 1
    allergens["peanuts"] = 2
    allergens["shellfish"] = 4
    allergens["strawberries"] = 8
    allergens["tomatoes"] = 16
    allergens["chocolate"] = 32
    allergens["pollen"] = 64
    allergens["cats"] = 128
}

3 {
    PROCINFO["sorted_in"] = "@val_num_asc"

    for (allergen in allergens) { print allergen allergens[allergen] }
}
