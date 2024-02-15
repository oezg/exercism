class NeedForSpeed {
    private int battery = 100;
    private int distance = 0;
    private int speed;
    private int drain;

    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.drain = batteryDrain;
    }

    public boolean batteryDrained() {
        return battery < drain;
    }

    public int distanceDriven() {
        return distance;
    }

    public void drive() {
        if (batteryDrained()) {
            return;
        }
        battery -= drain;
        distance += speed;
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {
    private int distance;

    RaceTrack(int distance) {
        this.distance = distance;
    }

    public boolean tryFinishTrack(NeedForSpeed car) {
        var start = car.distanceDriven();
        while (!car.batteryDrained()) {
            
            car.drive();

            if (car.distanceDriven() - start >= distance) {
                return true;
            }

        }

        return false;
    }
}
