import java.nio.charset.StandardCharsets;

class LuhnValidator {

  boolean isValid(String candidate) {
    var total = 0;
    var bytes = candidate.getBytes(StandardCharsets.US_ASCII);
    var idx = 0;
    for (int i = bytes.length - 1; i >= 0; i--) {
      var digit =  bytes[i] - 48;
      if (digit == -16) continue;
      if (digit < 0 || digit > 9) return false;
      idx++;
      total += luhnValue(idx, digit);
    }
    return idx > 1 && total % 10 == 0;
  }
  int luhnValue(int index, int digit) {
    if (index % 2  == 0)  digit *= 2;
    if (digit > 9) digit -= 9;
    return digit;
  }
}
