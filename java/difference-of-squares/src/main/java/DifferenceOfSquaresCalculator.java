class DifferenceOfSquaresCalculator {

  static int computeSquareOfSumTo(int input) {
    int sum = input * (input + 1) / 2;
    return sum * sum;
  }

  static int computeSumOfSquaresTo(int input) {
    return input * (input + 1) * (input * 2 + 1) / 6;
  }

  static int computeDifferenceOfSquares(int input) {
    return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
  }
}
