using System.Linq;
using System;

public record struct RobotSimulator(Direction Direction, int X, int Y)
{
    public void Move(string instructions) =>
        (Direction, X, Y) = instructions.Aggregate((direction: Direction, x: X, y: Y),
            (robot, instruction) => instruction switch
            {
                'L' => (robot.direction.Left(), robot.x, robot.y),
                'R' => (robot.direction.Right(), robot.x, robot.y),
                'A' => (robot.direction, robot.x + robot.direction.X(), robot.y + robot.direction.Y()),
                _ => throw new ArgumentException(nameof(instructions), "can only contain A, L or R")
            });
}

public enum Direction
{
    North,
    East,
    South,
    West
}

public static class DirectionExtensions
{
    public static int X(this Direction direction) => toTuple(direction).X;
    public static int Y(this Direction direction) => toTuple(direction).Y;
    public static Direction Right(this Direction direction) => fromTuple(right(toTuple(direction)));
    public static Direction Left(this Direction direction) => fromTuple(left(toTuple(direction)));
    static (int X, int Y) toTuple(Direction direction) =>
        direction switch
        {
            Direction.North => (0, 1),
            Direction.East => (1, 0),
            Direction.South => (0, -1),
            Direction.West => (-1, 0),
            _ => throw new ArgumentOutOfRangeException(nameof(direction), "invalid")
        };

    static Direction fromTuple((int x, int y) direction) =>
        direction switch
        {
            (0, 1) => Direction.North,
            (1, 0) => Direction.East,
            (0, -1) => Direction.South,
            (-1, 0) => Direction.West,
            _ => throw new ArgumentOutOfRangeException(nameof(direction), "invalid")
        };

    static (int x, int y) right((int X, int Y) direction) => (direction.Y, -direction.X);

    static (int x, int y) left((int X, int Y) direction) => (-direction.Y, direction.X);
}