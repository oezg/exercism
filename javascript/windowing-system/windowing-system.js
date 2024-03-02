export function Size(width=80, height=60) {
    this.width = width;
    this.height = height;
}

Size.prototype.resize = function (newWidth, newHeight) {
    this.width = newWidth;
    this.height = newHeight;
}

export function Position(x=0, y=0) {
    this.x = x;
    this.y = y;
}

Position.prototype.move = function (newX, newY) {
    this.x = newX;
    this.y = newY;
}

export class ProgramWindow {
    constructor() {
        this.screenSize = new Size(800, 600);
        this.size = new Size();
        this.position = new Position();
    }

    resize(newSize) {
        let newWidth = Math.min(Math.max(1, newSize.width), this.screenSize.width - this.position.x);
        let newHeight = Math.min(Math.max(1, newSize.height), this.screenSize.height - this.position.y);
        this.size.resize(newWidth, newHeight);
    }

    move(newPosition) {
        let newX = Math.min(Math.max(0, newPosition.x), this.screenSize.width - this.size.width);
        let newY = Math.min(Math.max(0, newPosition.y), this.screenSize.height - this.size.height);
        this.position.move(newX, newY);
    }
}

export function changeWindow(programWindow) {
    programWindow.resize(new Size(400, 300));
    programWindow.move(new Position(100, 150));
    return programWindow;
}