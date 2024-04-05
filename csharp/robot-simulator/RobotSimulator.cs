using System.Linq;
using System;

public class RobotSimulator
{
    public void Move(string instructions)
    {
        foreach (char instruction in instructions)
            switch (instruction)
            {
                case 'A': (X, Y) = (X + Direction.X(), Y + Direction.Y()); break;
                case 'R': Direction = Direction.Right(); break;
                case 'L': Direction = Direction.Left(); break;
                default: throw new ArgumentOutOfRangeException(nameof(instructions), "invalid");
            }
    }

    public RobotSimulator(Direction direction, int x, int y) => (Direction, X, Y) = (direction, x, y);

    public Direction Direction { get; set; }

    public int X { get; set; }

    public int Y { get; set; }
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