import java.util.ArrayList;
import java.util.List;
import java.util.function.IntUnaryOperator;

class ArmstrongNumbers {

  private List<Integer> digits(List<Integer> acc, int number) {
    if (number == 0) {
      return acc;
    }
    var x = number % 10;
    acc.add(x);
    return digits(acc, number / 10);
  }

  private int armstrong(int number) {
    var lst = digits(new ArrayList<Integer>(), number);
    IntUnaryOperator power = n -> (int) Math.pow(n, lst.size());
    return lst.stream().mapToInt(Integer::intValue).map(power).sum();
  }

  boolean isArmstrongNumber(int numberToCheck) {
    return numberToCheck == armstrong(numberToCheck);
  }
}
