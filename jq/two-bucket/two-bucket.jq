def update_array:
    .array += [{b1: .one.state, b2: .two.state}];

def not_visited_already($b1; $b2):
    .array | any(.b1 == $b1 and .b2 == $b2) | not;

def initialize:
    .moves = 0
    | .one = {state: 0, maximum: .bucketOne}
    | .two = {state: 0, maximum: .bucketTwo}
    | update_array
    | .array += if .startBucket == "one" then [{b1: 0, b2: .bucketTwo}] else [{b1: .bucketOne, b2: 0}] end
    | .[.startBucket].state = .[.startBucket].maximum;

def fill(name): .[name].state = .[name].maximum;
def leer(name): .[name].state = 0;
def pour(from; to): until(.[from].state == 0 or .[to].state == .[to].maximum; .[from].state -= 1 | .[to].state += 1);


def mana($b1; $b2):
    .one.state as $currentOne
    | .two.state as $currentTwo
    | .moves += 1
    | update_array
    | if .one.state == .goal then
        {moves: .moves, goalBucket: "one", otherBucket: .two.state}
    elif .two.state == .goal then
        {moves: .moves, goalBucket: "two", otherBucket: .one.state}
    else
        if not_visited_already(0; .two.state) then
            leer("one") | mana($currentOne; $currentTwo)
        elif not_visited_already(.one.state; 0) then
            leer("two") | mana($currentOne; $currentTwo)
        elif not_visited_already(.one.maximum; .two.state) then
            fill("one") | mana($currentOne; $currentTwo)
        elif not_visited_already(.one.state; .two.maximum) then
            fill("two") | mana($currentOne; $currentTwo)
        else
            pour("one"; "two") as $one_to_two
            | pour("two"; "one") as $two_to_one
            | if not_visited_already($one_to_two.one.state; $one_to_two.two.state) then
                pour("one"; "two") | mana($currentOne; $currentTwo)
            elif not_visited_already($two_to_one.one.state; $two_to_one.two.state) then
                pour("two"; "one") | mana($currentOne; $currentTwo)
            elif $currentOne == .array[-3].b1 and $currentTwo == .array[-3].b2 then
                "impossible" | halt_error
            else
                .moves -= 2 | .one.state = $b1 | .two.state = $b2 | mana($currentOne; $currentTwo)
            end
        end
    end;

if .goal > .bucketOne and .goal > .bucketTwo then "impossible" | halt_error end
| initialize
| if .[.startBucket].state == .goal then
    {moves: 1, goalBucket: .startBucket, otherBucket: 0}
else
    mana(.one.state; .two.state)
end