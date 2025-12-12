class RotationalCipher {
  final int shiftKey;
  final StringBuilder sb = new StringBuilder();

  RotationalCipher(int shiftKey) {
    this.shiftKey = shiftKey;
  }

  String rotate(String data) {
    sb.setLength(0);
    sb.ensureCapacity(data.length());
    for (char letter : data.toCharArray())
      if (Character.isUpperCase(letter)) sb.append(shift(letter, 'A'));
      else if (Character.isLowerCase(letter)) sb.append(shift(letter, 'a'));
      else sb.append(letter);
    return sb.toString();
  }

  private char shift(char letter, char start) {
    return (char) (start + (letter - start + shiftKey) % 26);
  }
}
