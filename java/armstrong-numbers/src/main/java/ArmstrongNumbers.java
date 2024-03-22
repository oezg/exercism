import java.util.Arrays;
import java.util.stream.IntStream;

class ArmstrongNumbers {

  IntStream digits(String number) {
    return Arrays.stream(number.split("")).mapToInt(Integer::parseInt);
  }

  int armstrong(String number) {
    return digits(number).map(n -> (int) Math.pow(n, number.length())).sum();
  }

  boolean isArmstrongNumber(int numberToCheck) {
    return numberToCheck == armstrong(Integer.toString(numberToCheck));
  }
}
