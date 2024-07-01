import 'dart:math';

class DifferenceOfSquares {
  int squareOfSum(int i) => pow(i * (i + 1) / 2, 2).toInt();

  int sumOfSquares(int i) => i * (i + 1) * (2 * i + 1) ~/ 6;

  int differenceOfSquares(int i) => squareOfSum(i) - sumOfSquares(i);
}
