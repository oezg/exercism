import java.util.List;
import java.util.stream.Stream;

class HandshakeCalculator {

  List<Signal> calculateHandshake(int number) {
    var result =
        Stream.of(Signal.values()).filter(signal -> (number >> signal.ordinal() & 1) == 1).toList();
    return (number >> 4 & 1) == 1 ? result.reversed() : result;
  }
}
