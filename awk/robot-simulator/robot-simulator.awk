# These variables are initialized on the command line (using '-v'):
# - x
# - y
# - dir
BEGIN {
    if (!x) x = 0

    if (!y) y = 0

    if (!dir) dir = "north"
    if ("north east south west" !~ dir) {
        invalid_direction = 1
    }
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
    print "invalid instruction" > "/dev/stderr"
    exit 1
}

        print "invalid direction" > "/dev/stderr"
        exit 1
END {
    if(invalid_direction) print "invalid direction" > "/dev/stderr"; exit 1
    print x, y, dir 
}
