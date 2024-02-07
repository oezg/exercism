public class ElonsToyCar {
    private int distanceDriven;
    private int batteryPercentage = 100;

    public static ElonsToyCar buy() {
        return new ElonsToyCar();
    }

    public String distanceDisplay() {
        return "Driven " + distanceDriven + " meters";
    }

    public String batteryDisplay() {
        if (batteryPercentage == 0) {
            return "Battery empty";
        }
        return "Battery at " + batteryPercentage + "%";
    }

    public void drive() {
        if (batteryPercentage == 0) {
            return;
        }
        distanceDriven += 20;
        batteryPercentage--;
    }
}
