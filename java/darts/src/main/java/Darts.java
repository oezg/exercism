class Darts {
    int score(double xOfDart, double yOfDart) {
        double radius = Math.sqrt(xOfDart * xOfDart + yOfDart * yOfDart);
        int result = 0;
        if (radius <= 1) {
            result = 10;
        } else if (radius <= 5) {
            result = 5;
        } else if (radius <= 10) {
            result = 1;
        }
        return result;
    }
}
