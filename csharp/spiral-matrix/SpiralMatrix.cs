using System;
using System.Linq;

public class SpiralMatrix
{
    public static int[,] GetMatrix(int size)
    {
        return MakeMatrix(StartCorner.TopLeft, size, 1);
    }

    public static int[,] MakeMatrix(StartCorner corner, int size, int start)
    {
        int[,] matrix = new int[size, size];
        if (size == 0)
            return matrix;

        FillOuterLayer(corner, size, start, ref matrix);

        FillInnerMatrix(corner, size, start, ref matrix);

        return matrix;
    }

    public static void FillInnerMatrix(StartCorner corner, int size, int start, ref int[,] matrix)
    {
        int[,] innerMatrix = MakeMatrix(OtherCorner(corner), size - 1, start + 2 * size - 1);

        (int, int) offset = CornerOffset(corner);

        for (int row = 0; row < size - 1; row++)
        {
            for (int col = 0; col < size - 1; col++)
            {
                matrix[row + offset.Item1, col + offset.Item2] = innerMatrix[row, col];
            }
        }
    }

    public static void FillOuterLayer(StartCorner corner, int size, int start, ref int[,] matrix)
    {
        (int, int) index;

        foreach (int increment in Enumerable.Range(0, 2 * size - 1))
        {
            index = increment < size
                ? corner == StartCorner.TopLeft ? (0, increment) : (size - 1, size - 1 - increment)
                : corner == StartCorner.TopLeft ? (increment - (size - 1), size - 1) : ((size - 1) * 2 - increment, 0);
            matrix[index.Item1, index.Item2] = start + increment;
        }
    }

    public enum StartCorner
    {
        TopLeft,
        BottomRight
    }

    public static StartCorner OtherCorner(StartCorner corner)
        => corner == StartCorner.TopLeft ? StartCorner.BottomRight : StartCorner.TopLeft;

    public static (int, int) CornerOffset(StartCorner corner)
        => corner == StartCorner.TopLeft ? (1, 0) : (0, 1);
}