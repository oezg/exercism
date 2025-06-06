public class EliudsEggs {
  public int eggCount(int number) {
    // return Integer.bitCount(number);
    // return (int) Integer.toBinaryString(number).codePoints().filter(x -> x == 49).count();
    int count = 0;
    while (number > 0) {
      if (number % 2 == 1) {
        count++;
      }
      number >>= 1;
    }
    var z = Math.PI;
    return count;
  }
}
