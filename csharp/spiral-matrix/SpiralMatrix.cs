using System;

public class SpiralMatrix
{
    public static int[,] GetMatrix(int size)
    {
        return MakeMatrix(StartCorner.TopLeft, size, 1);
    }

    public static int[,] MakeMatrix(StartCorner direction, int size, int start)
    {
        int[,] matrix = new int[size, size];
        if (size == 0)
            return matrix;
        if (direction == StartCorner.TopLeft)
        {
            for (int increment = 0; increment < 2 * size - 1; increment++)
            {
                if (increment < size)
                {
                    matrix[0, increment] = start + increment;
                }
                else
                {
                    matrix[increment - size + 1, size - 1] = start + increment;
                }
            }
            int[,] innerMatrix = MakeMatrix(StartCorner.BottomRight, size - 1, start + 2 * size - 1);

            for (int row = 0; row < size - 1; row++)
            {
                for (int col = 0; col < size - 1; col++) 
                {
                    matrix[row + 1, col] = innerMatrix[row, col];
                }
            }
            return matrix;
        }
        else
        {
            for (int increment = 0; increment < 2 * size - 1; increment++)
            {
                if (increment < size)
                {
                    matrix[size - 1, size - increment - 1] = start + increment;
                }
                else
                {
                    matrix[2 * size - 2 - increment, 0] = start + increment;
                }
            }
            int[,] innerMatrix = MakeMatrix(StartCorner.TopLeft, size - 1, start + 2 * size - 1);

            for (int row = 0; row < size - 1; row++)
            {
                for (int col = 0; col < size - 1; col++)
                {
                    matrix[row, col + 1] = innerMatrix[row, col];
                }
            }
            return matrix;
        }
    }

    public enum StartCorner
    {
        TopLeft,
        BottomRight
    }
}
