using System;

public static class QueenAttack
{
    public static bool CanAttack((int Row, int Column) white, (int Row, int Column) black) =>
        Math.Abs(white.Row - black.Row) == Math.Abs(white.Column - black.Column)
        || white.Row == black.Row
        || white.Column == black.Column;

    public static (int Row, int Column) Create(int row, int column) =>
        (row, column) switch
        {
            var (r, _) when r < 0 || r > 7 =>
                throw new ArgumentOutOfRangeException(nameof(row), "must be between 0 and 7"),
            var (_, c) when c < 0 || c > 7 =>
                throw new ArgumentOutOfRangeException(nameof(column), "must be between 0 and 7"),
            _ => (row, column)
        };
}