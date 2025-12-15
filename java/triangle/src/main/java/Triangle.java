class Triangle {
  private final double a;
  private final double b;
  private final double c;

  Triangle(double side1, double side2, double side3) throws TriangleException {
    a = side1;
    b = side2;
    c = side3;
    if (a + b <= c || a + c <= b || b + c <= a) throw new TriangleException();
  }

  boolean isEquilateral() {
    return a == b && b == c;
  }

  boolean isIsosceles() {
    return a == b || a == c || b == c;
  }

  boolean isScalene() {
    return !isIsosceles();
  }
}
