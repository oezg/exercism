public class ExperimentalRemoteControlCar implements RemoteControlCar {

    private int distance;
    private static final int SPEED = 20;

    public void drive() {
        distance += SPEED;
    }

    public int getDistanceTravelled() {
        return distance;
    }
}
