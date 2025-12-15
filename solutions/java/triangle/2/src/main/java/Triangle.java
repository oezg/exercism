record Triangle(double a, double b, double c) {
  Triangle {
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
