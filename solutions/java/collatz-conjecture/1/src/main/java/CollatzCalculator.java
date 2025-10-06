class CollatzCalculator {

  int computeStepCount(int start) {
    if (start > 0) return collatz(start);
    throw new IllegalArgumentException("Only positive integers are allowed");
  }

  int collatz(int n) {
    return n > 1 ? 1 + collatz(n % 2 == 0 ? n / 2 : 3 * n + 1) : 0;
  }
}
