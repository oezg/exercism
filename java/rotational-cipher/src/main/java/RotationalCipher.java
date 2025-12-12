class RotationalCipher {
  final int shiftKey;

  RotationalCipher(int shiftKey) {
    this.shiftKey = shiftKey;
  }

  String rotate(String data) {
    StringBuilder sb = new StringBuilder(data.length());
    data.chars()
        .map(
            cp ->
                switch (Character.getType(cp)) {
                  case Character.UPPERCASE_LETTER -> shift(cp, 'A');
                  case Character.LOWERCASE_LETTER -> shift(cp, 'a');
                  default -> cp;
                })
        .forEach(sb::appendCodePoint);

    return sb.toString();
  }

  private int shift(int letter, char start) {
    return start + (letter - start + shiftKey) % 26;
  }
}
