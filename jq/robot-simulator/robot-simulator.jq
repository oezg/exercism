def directions: ["north", "east", "south", "west", "north"];
def follow(find; next): directions | find | directions[next];

reduce ((.instructions // "C") / "")[] as $instruction
(
    .robot;
    {
        C: (.),  # C for Creation
        L: (.direction |= . as $dir | follow(rindex($dir); . - 1)),
        R: (.direction |= . as $dir | follow(index($dir); . + 1)),
        A: (
            {
                north: (.position.y += 1),
                east: (.position.x += 1),
                south: (.position.y -= 1),
                west: (.position.x -= 1)
            }[.direction]
        )
    }[$instruction]
)