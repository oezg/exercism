using System;
using System.Linq;

public class SpiralMatrix
{
    public static int[,] GetMatrix(int size, int start = 1, StartCorner corner = StartCorner.TopLeft)
    {
        int[,] matrix = new int[size, size];
        if (size-- == 0)  // size-- simplefies the rest of the code becaue I mostly need size - 1
            return matrix;

        FillOuterLayer(corner, size, start, ref matrix);

        FillInnerMatrix(corner, size, start, ref matrix);

        return matrix;
    }

    public static void FillInnerMatrix(StartCorner corner, int size, int start, ref int[,] matrix)
    {
        int[,] innerMatrix = GetMatrix(size, start + size * 2 + 1, OtherCorner(corner));

        (int rowOffset, int colOffset) = CornerOffset(corner);

        for (int row = 0; row < size; row++)
            for (int col = 0; col < size; col++)
                matrix[row + rowOffset, col + colOffset] = innerMatrix[row, col];
    }

    public static void FillOuterLayer(StartCorner corner, int size, int start, ref int[,] matrix)
    {
        foreach (int increment in Enumerable.Range(0, size * 2 + 1)) 
        {
            (int row, int col) = corner == StartCorner.TopLeft
                ? increment <= size 
                    ? (0, increment) 
                    : (increment - size, size)
                : increment <= size 
                    ? (size, size - increment) 
                    : (size * 2 - increment, 0);
        
            matrix[row, col] = start + increment;
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