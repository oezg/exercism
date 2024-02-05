public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        return 221 * speed * successRate(speed);
    }

    public int workingItemsPerMinute(int speed) {
        return (int)productionRatePerHour(speed) / 60;
    }

    private double successRate(int speed) {
        if (speed < 5) {
            return 1.00;
        } else if (speed < 9) {
            return 0.90;
        } else if (speed == 9) {
            return 0.80;
        } else {
            return 0.77;
        }
    }
}
