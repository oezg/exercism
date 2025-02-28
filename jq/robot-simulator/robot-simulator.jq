reduce ((.instructions // "") / "")[] as $instruction
(
    .robot;
    if $instruction == "L" then
        .direction |= 
            if . == "north" then
                "west"
            elif . == "east" then
                "north"
            elif . == "south" then
                "east"
            elif . == "west" then
                "south"
            end
    elif $instruction == "R" then
        .direction |= 
            if . == "north" then
                "east"
            elif . == "east" then
                "south"
            elif . == "south" then
                "west"
            elif . == "west" then
                "north"
            end
    elif $instruction == "A" then
        if .direction == "north" then
            .robot.position.y += 1
        elif .direction == "east" then
            .robot.position.x += 1
        elif .direction == "south" then
            .robot.position.y -= 1
        elif .direction == "west" then
            .robot.position.x -= 1
        end
    end
)