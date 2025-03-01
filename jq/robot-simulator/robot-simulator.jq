reduce (.instructions // "" | splits("")) as $instruction
(
    .robot;
    {
        L: (
            .direction |= {
                north: "west",
                east: "north",
                south: "east",
                west: "south"
            }[.]
        ),
        R: (
            .direction |= {
                north: "east",
                east: "south",
                south: "west",
                west: "north"
            }[.]
        ),
        A: (
            {
                north: (.position.y += 1),
                east: (.position.x += 1),
                south: (.position.y -= 1),
                west: (.position.x -= 1)
            }[.direction]
        )
    }[$instruction] // .
)