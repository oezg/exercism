class IsbnVerifier {

  boolean isValid(String stringToVerify) {
    int factor = 10;
    int checkSum = 0;

    for (char digit : stringToVerify.toCharArray()) {
      if ('0' <= digit && digit <= '9') checkSum += factor * (digit - '0');
      else if (digit == 'X' && factor == 1) checkSum += 10;
      else if (digit == '-') continue;
      else return false;
      factor -= 1;
    }

    return factor == 0 && checkSum % 11 == 0;
  }
}
