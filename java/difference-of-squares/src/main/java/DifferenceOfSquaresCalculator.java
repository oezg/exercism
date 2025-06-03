class DifferenceOfSquaresCalculator {

  int computeSquareOfSumTo(int input) {
    int sum = input * (input + 1) / 2;
    return sum * sum;
  }

  int computeSumOfSquaresTo(int input) {
    return input * (input + 1) * (input * 2 + 1) / 6;
  }

  int computeDifferenceOfSquares(int input) {
    return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
  }
}
