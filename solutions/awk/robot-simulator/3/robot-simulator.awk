BEGIN {
    x = +x
    y = +y
    dir = dir ? dir : "north"

    if (dir !~ /(north|east|south|west)/) error = "direction"

    simulate["north"]["L"] = "west"
    simulate["north"]["R"] = "east"
    simulate["north"]["A"] = "up"
    simulate["east"]["L"] = "north"
    simulate["east"]["R"] = "south"
    simulate["east"]["A"] = "right"
    simulate["south"]["L"] = "east"
    simulate["south"]["R"] = "west"
    simulate["south"]["A"] = "down"
    simulate["west"]["L"] = "south"
    simulate["west"]["R"] = "north"
    simulate["west"]["A"] = "left"
}

!/^[LRA]$/ { error = "instruction" }

{
    switch (direction = simulate[dir][$1]) {
        case "right": x++; break;
        case "left": x--; break;
        case "up": y++; break;
        case "down": y--; break;
        default: dir = direction
    }
}

END { 
    if (error) {
        print "invalid",  error
        exit 1
    } else 
        print x, y, dir 
}
