include "digits";

(.property == "allergicTo") as $allergicTo
| .input.item as $item
| [
    (.input.score | [digits(2)] | reverse),
    "eggs peanuts shellfish strawberries tomatoes chocolate pollen cats" / " "
]
| transpose
| map(select(first == 1 and last != null) | last)
| if $allergicTo then index($item) != null end