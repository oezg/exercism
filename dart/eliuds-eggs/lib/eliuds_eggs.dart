class EggCounter {
  int count(int argument) {
    var counter = 0;
    while (argument > 0) {
      counter += argument & 1;
      argument >>>= 1;
    }
    return counter;
  }
}
