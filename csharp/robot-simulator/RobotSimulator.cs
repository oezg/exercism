using System;

public enum Direction
{
    North,
    East,
    South,
    West
}

public class RobotSimulator
{
    #region constructors
    public RobotSimulator(Direction direction, int x, int y)
    {
        Direction = direction;
        X = x;
        Y = y;
    }
    #endregion

    #region properties
    public Direction Direction { get; set; }

    public int X { get; set; }

    public int Y { get; set; }
    #endregion

    #region methods
    public void Move(string instructions)
    {
        foreach (char instruction in instructions)
        {
            switch (instruction)
            {
                case 'A':
                    switch (Direction)
                    {
                        case Direction.North:
                            Y += 1;
                            break;
                        case Direction.East:
                            X += 1;
                            break;
                        case Direction.West:
                            X -= 1;
                            break;
                        case Direction.South:
                            Y -= 1; 
                            break;
                    }
                    break;
                case 'R':
                    switch (Direction)
                    {
                        case Direction.North:
                            Direction = Direction.East;
                            break;
                        case Direction.East:
                            Direction = Direction.South;
                            break;
                        case Direction.West:
                            Direction = Direction.North;
                            break;
                        case Direction.South:
                            Direction = Direction.West;
                            break;
                    }
                    break;
                case 'L':
                    switch (Direction)
                    {
                        case Direction.North:
                            Direction = Direction.West;
                            break;
                        case Direction.East:
                            Direction = Direction.North;
                            break;
                        case Direction.West:
                            Direction = Direction.South;
                            break;
                        case Direction.South:
                            Direction = Direction.East;
                            break;
                    }
                    break;
                default:
                    throw new ArgumentOutOfRangeException(instruction + " is not one of 'A', 'L' or 'R'!");
            }
        }
    }
    #endregion
}