import java.util.Collections;
import java.util.List;

enum Signal {
  WINK,
  DOUBLE_BLINK,
  CLOSE_YOUR_EYES,
  JUMP,
  REVERSE;

  public boolean yes(int number) {
    return (number >> ordinal() & 1) == 1;
  }

  public static List<Signal> action(List<Signal> list, Signal signal) {
    if (signal == REVERSE) {
      Collections.reverse(list);
    } else {
      list.add(signal);
    }
    return list;
  }
}
