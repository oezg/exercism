import java.text.BreakIterator;

class MicroBlog {

  private static final int POST_LENGTH = 5;

  public String truncate(String input) {
    BreakIterator charIterator = BreakIterator.getCharacterInstance();
    charIterator.setText(input);
    int boundary = charIterator.next(POST_LENGTH);
    return boundary == BreakIterator.DONE ? input : input.substring(0, boundary);
  }
}
