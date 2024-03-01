function Size(width=80, height=60) {
    this.width = width
    this.height = height
}

Size.prototype.resize = function (newWidth, newHeight) {
    this.width = newWidth
    this.height = newHeight
}

function Position(x=0, y=0) {
    this.x = x
    this.y = y
}

Position.prototype.move = function (newX, newY) {
    this.x = newX
    this.y = newY
}