def update_array:
    .array += [{b1: .one.state, b2: .two.state}];

def not_visited_already($b1; $b2):
    .array | any(.b1 == $b1 and .b2 == $b2) | not;

def initialize:
    .moves = 1
    | .one = {state: 0, maximum: .bucketOne}
    | .two = {state: 0, maximum: .bucketTwo}
    | if .startBucket == "one" then .array = [{b1: 0, b2: .bucketTwo}] else .array = [{b1: .bucketOne, b2: 0}] end
    | update_array
    | .[.startBucket].state = .[.startBucket].maximum;

def fill(name): .[name].state = .[name].maximum;
def leer(name): .[name].state = 0;
def pour(from; to): until(.[from].state == 0 or .[to].state == .[to].maximum; .[from].state -= 1 | .[to].state += 1);


def mana($b1; $b2):
    .one.state as $akapi
    | .two.state as $rolpa
    # | .moves += 1
    | update_array
    | if .one.state == .goal then
        {moves: .moves, goalBucket: "one", otherBucket: .two.state}
    elif .two.state == .goal then
        {moves: .moves, goalBucket: "two", otherBucket: .one.state}
    else
        if not_visited_already(0; .two.state) then
            leer("one") | mana($akapi; $rolpa)
        elif not_visited_already(.one.state; 0) then
            leer("two") | mana($akapi; $rolpa)
        elif not_visited_already(.one.maximum; .two.state) then
            fill("one") | mana($akapi; $rolpa)
        elif not_visited_already(.one.state; .two.maximum) then
            fill("two") | mana($akapi; $rolpa)
        else
            pour("one"; "two") as $one_to_two
            | pour("two"; "one") as $two_to_one
            | if not_visited_already($one_to_two.one.state; $one_to_two.two.state) then
                pour("one"; "two") | mana($akapi; $rolpa)
            elif not_visited_already($two_to_one.one.state; $two_to_one.two.state) then
                pour("two"; "one") | mana($akapi; $rolpa)
            else
                .moves -= 1 | .one.state = $b1 | .two.state = $b2 | mana($akapi; $rolpa)
            end
        end
        | .moves += 1
    end;

initialize
| if .[.startBucket].state == .goal then
    {moves: 1, goalBucket: .startBucket, otherBucket: 0}
else
    mana(.one.state; .two.state)
end | debug