class Matrix {
  private int[][] matrix;
  private int[][] columns;

  Matrix(String matrixAsString) {
    String[] rows = matrixAsString.lines().toArray(String[]::new);

    for (int row = 0; row < rows.length; row++) {
      String[] cells = rows[row].split("\s+");
      if (row == 0) {
        matrix = new int[rows.length][cells.length];
        columns = new int[cells.length][matrix.length];
      }

      if (columns.length != cells.length) throw new IllegalArgumentException("Jagged matrix");

      for (int col = 0; col < cells.length; col++)
        try {
          matrix[row][col] = columns[col][row] = Integer.parseInt(cells[col]);
        } catch (NumberFormatException e) {
          throw new IllegalArgumentException("Invalid number: " + cells[col]);
        }
    }
  }

  int[] getRow(int rowNumber) {
    return matrix[rowNumber - 1];
  }

  int[] getColumn(int columnNumber) {
    return columns[columnNumber - 1];
  }
}
