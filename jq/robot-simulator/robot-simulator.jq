def directions: ["north", "east", "south", "west", "north"];
def follow(find; next): directions | find | directions[next];
def move(step): {x: (.position.x + step.x), y: (.position.y + step.y)};
def step: 
    {
        north: {x: 0, y: 1}, 
        east: {x: 1, y: 0}, 
        south: {x: 0, y: -1}, 
        west: {x: -1, y: 0}
    }[.direction];

def advance: move(step);

reduce ((.instructions // "C") / "")[] as $instruction
(
    .robot;
    {
        C: (.),  # C for Creation
        L: (.direction |= . as $dir | follow(rindex($dir); . - 1)),
        R: (.direction |= . as $dir | follow(index($dir); . + 1)),
        A: (.position = advance)
    }[$instruction]
)
