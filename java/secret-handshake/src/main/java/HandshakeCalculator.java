import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

class HandshakeCalculator {

  List<Signal> calculateHandshake(int number) {
    return Stream.of(Signal.values())
        .filter(s -> s.yes(number))
        .collect(ArrayList::new, Signal::action, List::addAll);
  }
}
