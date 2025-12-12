class Proverb {
  static final String templateLine = "For want of a %s the %s was lost.\n";
  static final String templateLast = "And all for the want of a %s.";
  final String[] words;
  final StringBuilder sb = new StringBuilder();

  Proverb(String[] words) {
    this.words = words;
  }

  String recite() {
    for (int i = 0; i < words.length; i++) {
      if (i == words.length - 1) {
        sb.append(templateLast.formatted(words[0]));
      } else {
        sb.append(templateLine.formatted(words[i], words[i + 1]));
      }
    }
    return sb.toString();
  }
}
