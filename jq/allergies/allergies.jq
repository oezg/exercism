include "rank";

def allergen(score):
    if . == [] or score == 0 then
        empty
    else
        first.value as $value
        | if score >= $value then
            (.[1:] | allergen(score - $value)), first.name
        else
            .[1:] | allergen(score)
        end
    end;

(.input.score % sum_allergen_values) as $score
| .input.item as $item
| [[rank] | allergen($score)]
| if $item then index($item) != null end