BEGIN {
    x = +x
    y = +y
    dir = dir ? dir : "north"

    cause = dir ~ /(north|east|south|west)/ ? "" : invalid("direction")

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

!/[LRA]/ { invalid("instruction") }

{
    fn = simulate[dir][$1]
    @fn()
}

END { print cause ? cause : x " " y " " dir }

function invalid(error) {
    cause = "invalid " error
    exit 1
}

function right() { x++ }

function left() { x-- }

function up() { y++ }

function down() { y-- }

function west() { dir = "west" }

function east() { dir = "east" }

function north() { dir = "north" }

function south() { dir = "south" }
