class IsbnVerifier {

  boolean isValid(String stringToVerify) {
    return isbn(stringToVerify.replace("-", "")) % 11 == 0;
  }

  static int isbn(String s) {
    int result = 0;
    var digits = s.toCharArray();
    if (digits.length != 10) {
      return -1;
    }
    for (int i = 0; i < digits.length; i++) {
      char c = digits[i];
      if (c == 'X') {
        result += 10;
      } else if (c < '0' || c > '9') {
        return -1;
      } else {
        result += (10 - i) * (c - '0');
      }
    }
    return result;
  }
}
