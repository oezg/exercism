record Proverb(String[] words) {
  static final String templateLine = "For want of a %s the %s was lost.\n";
  static final String templateLast = "And all for the want of a %s.";

  String recite() {
    final StringBuilder sb = new StringBuilder();

    for (int i = 0; i < words.length - 1; i++)
      sb.append(templateLine.formatted(words[i], words[i + 1]));

    if (words.length > 0) sb.append(templateLast.formatted(words[0]));

    return sb.toString();
  }
}
