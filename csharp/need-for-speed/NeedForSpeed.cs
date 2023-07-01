using System;

class RemoteControlCar
{
    private readonly int _speed;
    private readonly int _drain;
    private int _distanceDriven;
    private int _battery;
 
    public RemoteControlCar(int speed, int drain)
    {
        _speed = speed;
        _drain = drain;
        _distanceDriven = 0;
        _battery = 100;
    }

    public bool BatteryDrained() => _battery < _drain;

    public int DistanceDriven() => _distanceDriven;

    public void Drive()
    {
        if (_battery < _drain)
        {
            return;
        }
        _distanceDriven += _speed;
        _battery -= _drain;
    }

    public static RemoteControlCar Nitro() => new RemoteControlCar(50, 4);

    public int Reichweite() => _battery / _drain * _speed;
}

class RaceTrack
{
    private readonly int _distance;

    public RaceTrack(int distance)
    {
        _distance = distance;
    }

    public bool TryFinishTrack(RemoteControlCar car) => _distance <= car.Reichweite();
}
