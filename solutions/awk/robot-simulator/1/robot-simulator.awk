BEGIN {
    x = x ? x : 0
    y = y ? y : 0
    dir = dir ? dir : "north"

    cause = "north east south west" ~ dir ? "" : "invalid direction"
}

/R/ {
    switch(dir) {
        case "north": dir = "east"; break;
        case "east": dir = "south"; break;
        case "south": dir = "west"; break;
        case "west": dir = "north"; break;
    }
}
/L/ {
    switch(dir) {
        case "north": dir = "west"; break;
        case "east": dir = "north"; break;
        case "south": dir = "east"; break;
        case "west": dir = "south"; break;
    }
}

/A/ {
    switch(dir) {
        case "north": y++; break;
        case "east": x++; break;
        case "south": y--; break;
        case "west": x--; break;
    }
}

/[^LRA]/ {
    cause =  "invalid instruction" 
}

END {
    if(cause) {print cause > "/dev/stderr"; exit 1}
    print x, y, dir 
}
