# Task 1: replace `null` with the "name" element of the shopping list.
.name,

# Task 2: replace `null` with the count of the required ingredients.
(.ingredients | length),

# Task 3: replace `null` with the amount of sugar.
(.ingredients[] | select(.item == "sugar") | .amount.quantity),

# Task 4: replace `null` with the mapping of ingredient names with their substitutions
(.ingredients + .["optional ingredients"] 
| map(select(.substitute) | {(.item): .substitute}) 
| add)
