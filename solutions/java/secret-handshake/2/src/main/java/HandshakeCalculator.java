import java.util.List;
import java.util.function.IntPredicate;
import java.util.stream.IntStream;

class HandshakeCalculator {

  List<Signal> calculateHandshake(int number) {
    var signals = Signal.values();
    IntPredicate isSet = j -> (number >> j & 1) == 1;
    var result =
        IntStream.range(0, signals.length).filter(isSet).mapToObj(i -> signals[i]).toList();
    return isSet.test(signals.length) ? result.reversed() : result;
  }
}
