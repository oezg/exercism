class MicroBlog {

  private static final int MAX_POST_UNICODE_POINTS = 5;

  public String truncate(String input) {
    return fromCodePoints(takeCodePoints(input, MAX_POST_UNICODE_POINTS));
  }

  private int[] takeCodePoints(String input, int count) {
    return input.codePoints().limit(count).toArray();
  }

  private String fromCodePoints(int[] codePoints) {
    return new String(codePoints, 0, Integer.min(codePoints.length, MAX_POST_UNICODE_POINTS));
  }
}
