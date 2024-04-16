class Darts {
    final int innerCircle = 1;
    final int middleCircle = 5;
    final int outerCircle = 10;

    int score(double xOfDart, double yOfDart) {
        double radius = Math.sqrt(xOfDart * xOfDart + yOfDart * yOfDart);

        if (radius <= innerCircle) {
            return 10;
        }
        if (radius <= middleCircle) {
            return 5;
        }
        if (radius <= outerCircle) {
            return 1;
        }
        return 0;
    }
}
