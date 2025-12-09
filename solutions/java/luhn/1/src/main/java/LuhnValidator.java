class LuhnValidator {

  boolean isValid(String candidate) {
    var trimmed = candidate.replace(" ", "");
    var length = trimmed.length();
    if (length < 2) {
      return false;
    }

    var total = 0;

    for (int i = 1; i <= length; i++) {
      var character = trimmed.charAt(length - i);
      var value = Character.digit(character, 10);
      if (value < 0) {
        return false;
      }

      if (i % 2 == 0) {
        value *= 2;
        if (value > 9) {
          value -= 9;
        }
      }

      total += value;
    }

    return total % 10 == 0;
  }
}
