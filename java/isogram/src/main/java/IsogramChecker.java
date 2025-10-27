class IsogramChecker {

  boolean isIsogram(String phrase) {
    var sieve = new boolean[26];
    for (char character : phrase.toLowerCase().toCharArray()) {
      if (character == ' ' || character == '-') continue;
      var index = character - 'a';
      if (sieve[index]) return false;
      sieve[index] = true;
    }
    return true;
  }
}
