class NeedForSpeed {
    private int _battery = 100;
    private int _distance = 0;
    private int _speed;
    private int _drain;

    NeedForSpeed(int speed, int batteryDrain) {
        _speed = speed;
        _drain = batteryDrain;
    }

    public boolean batteryDrained() {
        return _battery < _drain;
    }

    public int distanceDriven() {
        return _distance;
    }

    public void drive() {
        if (batteryDrained()) {
            return;
        }
        _battery -= _drain;
        _distance += _speed;
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {
    private int _distance;

    RaceTrack(int distance) {
        _distance = distance;
    }

    public boolean tryFinishTrack(NeedForSpeed car) {
        var start = car.distanceDriven();
        while (!car.batteryDrained()) {
            
            car.drive();

            if (car.distanceDriven() - start >= _distance) {
                return true;
            }

        }

        return false;
    }
}
