import java.util.List;
import java.util.function.IntPredicate;
import java.util.stream.Stream;

class HandshakeCalculator {

  List<Signal> calculateHandshake(int number) {
    IntPredicate isSet = n -> (number >> n & 1) == 1;
    List<Signal> result = Stream.of(Signal.values()).filter(s -> isSet.test(s.ordinal())).toList();
    return isSet.test(4) ? result.reversed() : result;
  }
}
