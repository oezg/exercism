import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class TestTrack {

    public static void race(RemoteControlCar car) {
        car.drive();
    }

    public static List<ProductionRemoteControlCar> getRankedCars(List<ProductionRemoteControlCar> cars) {
        var carsCopy = new ArrayList<>(cars);
        Collections.sort(carsCopy, Collections.reverseOrder());
        return carsCopy;
    }
}
