using System;

public class Queen
{
    public Queen(int row, int column)
    {
        Row = row;
        Column = column;
    }

    public int Row { get; }
    public int Column { get; }
}

public static class QueenAttack
{
    public static bool CanAttack(Queen white, Queen black)
        => white != null && black != null 
        && (white.Row == black.Row || white.Column == black.Column 
        || Math.Abs(white.Row - black.Row) == Math.Abs(white.Column - black.Column));

    public static Queen Create(int row, int column) 
        => row < 0 || column < 0 || row > 7 || column > 7
            ? throw new ArgumentOutOfRangeException("row and column cannot be less than 0 or more than 7")
            : new Queen(row, column);
}