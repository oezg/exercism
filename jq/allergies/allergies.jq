include "digits";

.input.item as $item
| [
    (.input.score | [digits(2)] | reverse), 
    "eggs peanuts shellfish strawberries tomatoes chocolate pollen cats" / " "
] 
| transpose 
| until(last | last != null; .[:-1]) 
| map(select(first == 1) | last)
| if $item then index($item) != null end