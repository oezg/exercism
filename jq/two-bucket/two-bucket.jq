def initialize:
    .moves = 1
    | .goalBucket = null
    | .otherBucket = null
    | .one = 0
    | .two = 0
    | if .startBucket == "one" then .one = .bucketOne else .two = .bucketTwo end;

def finalize: pick(.moves, .goalBucket, .otherBucket);

def is_finished: .one == .goal or .two == .goal;

def is_deadend: .startBucket == "one" and .one == 0 and .two == .bucketTwo or .two == 0 and .one == .bucketOne;

def empty_one: .moves += 1 | .one = 0;

def empty_two: .moves += 1 | .two = 0;

def fill_one: .moves += 1 | .one = .bucketOne;

def fill_two: .moves += 1 | .two = .bucketTwo;

def pour_one_to_two:
    .moves += 1
    | (.bucketTwo - .two) as $gap
    | if .one > $gap then
        .two += $gap
        | .one -= $gap
    else
        .two += .one
        | .one = 0
    end;

def pour_two_to_one:
    .moves += 1
    | (.bucketOne - .one) as $gap
    | if .two > $gap then
        .one += $gap
        | .two -= $gap
    else
        .one += .two
        | .two = 0
    end;


{
    "bucketOne": 3,
    "bucketTwo": 5,
    "goal": 1,
    "startBucket": "one"
}
| initialize
| finalize