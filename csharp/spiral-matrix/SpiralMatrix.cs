using System;

public class SpiralMatrix
{
    public static int[,] GetMatrix(int size)
    {
        return MakeMatrix(Direction.TopLeft, size, 1);
    }

    public static int[,] MakeMatrix(Direction direction, int n, int start)
    {
        int[,] matrix = new int[n, n];
        if (n == 0)
            return matrix;
        if (direction == Direction.TopLeft)
        {
            for (int i = 0; i < 2 * n - 1; i++)
            {
                if (i < n)
                {
                    matrix[0, i] = start + i;
                }
                else
                {
                    matrix[i - n + 1, n - 1] = start + i;
                }
            }
            int[,] innerMatrix = MakeMatrix(Direction.BottomRight, n - 1, start + 2 * n - 1);

            for (int i = 0; i < n - 1; i++)
            {
                for (int j = 0; j < n - 1; j++) 
                {
                    matrix[i + 1, j] = innerMatrix[i, j];
                }
            }
            return matrix;
        }
        else
        {
            for (int i = 0; i < 2 * n - 1; i++)
            {
                if (i < n)
                {
                    matrix[n - 1, n - i - 1] = start + i;
                }
                else
                {
                    matrix[2 * n - 2 - i, 0] = start + i;
                }
            }
            int[,] innerMatrix = MakeMatrix(Direction.TopLeft, n - 1, start + 2 * n - 1);

            for (int i = 0; i < n - 1; i++)
            {
                for (int j = 0; j < n - 1; j++)
                {
                    matrix[i, j + 1] = innerMatrix[i, j];
                }
            }
            return matrix;
        }
    }

    public enum Direction
    {
        TopLeft,
        BottomRight
    }
}
