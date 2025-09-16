import java.util.LinkedList;
import java.util.List;
import java.util.function.IntPredicate;

class HandshakeCalculator {

  List<Signal> calculateHandshake(int number) {
    List<Signal> result = new LinkedList<>();
    var signals = Signal.values();
    IntPredicate isSet = j -> (number >> j & 1) == 1;
    int i;
    for (i = 0; i < signals.length; i++) {
      if ((number >> i & 1) == 1) {
        result.addLast(signals[i]);
      }
    }
    return isSet.test(i) ? result.reversed() : result;
  }
}
