class EggCounter {
  int count(final int argument) {
    var temp = argument;
    var counter = 0;
    while (temp > 0) {
      counter += temp & 1;
      temp >>>= 1;
    }
    return counter;
  }
}
