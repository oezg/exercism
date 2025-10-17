def directions:
    ["north", "east", "south", "west", "north"];

def follow(find; next):
    directions | find | directions[next];

def turnleft:
    .direction |= . as $dir | follow(rindex($dir); . - 1);

def turnright:
    .direction |= . as $dir | follow(index($dir); . + 1);

def step:
    {
        north: {x: 0, y: 1},
        east: {x: 1, y: 0},
        south: {x: 0, y: -1},
        west: {x: -1, y: 0}
    }[.direction];

def advance:
    .position.x += step.x | .position.y += step.y;
