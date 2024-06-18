class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    final nummerOfDigits = number.length;
    return BigInt.parse(number) ==
        number
            .split("")
            .map(BigInt.parse)
            .fold(BigInt.zero, (acc, cur) => acc + cur.pow(nummerOfDigits));
  }
}
