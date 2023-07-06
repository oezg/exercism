using System;

public class RemoteControlCar
{
    private int _batteryPercentage = 100;
    private int _distanceDrivenInMeters;
    private string[] _sponsors = Array.Empty<string>();
    private int _latestSerialNum;

    public void Drive()
    {
        if (_batteryPercentage > 0)
        {
            _batteryPercentage -= 10;
            _distanceDrivenInMeters += 2;
        }
    }

    public void SetSponsors(params string[] sponsors) => _sponsors = sponsors;

    public string DisplaySponsor(int sponsorNum) => _sponsors[sponsorNum];

    public bool GetTelemetryData(
        ref int serialNum,
        out int batteryPercentage,
        out int distanceDrivenInMeters)
    {
        if (serialNum < _latestSerialNum)
        {
            serialNum = _latestSerialNum;
            batteryPercentage = -1;
            distanceDrivenInMeters = -1;
            return false;
        }
        _latestSerialNum = serialNum;
        batteryPercentage = _batteryPercentage;
        distanceDrivenInMeters = _distanceDrivenInMeters;
        return true;
    }

    public bool IsDriven => _distanceDrivenInMeters > 0;
    
    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }
}

public class TelemetryClient
{
    private RemoteControlCar car;

    public TelemetryClient(RemoteControlCar car)
    {
        this.car = car;
    }

    public string GetBatteryUsagePerMeter(int serialNum)
    => !car.IsDriven 
        ? "no data" 
        : car.GetTelemetryData(ref serialNum, out int batteryPercentage, out int distanceDriven) 
            ? $"usage-per-meter={(100 - batteryPercentage) / distanceDriven}" 
            : "no data";
}
