public class RemoteControlCar
{

    public string CurrentSponsor { get; private set; }

    public TelemetryClass Telemetry { get; }

    private Speed currentSpeed;

    public RemoteControlCar()
    {
        Telemetry = new TelemetryClass(this);
    }

    public class TelemetryClass
    {
        public TelemetryClass(RemoteControlCar remoteControlCar)
        {
            RemoteControlCar = remoteControlCar;
        }

        public RemoteControlCar RemoteControlCar { get; }

        public void Calibrate()
        {

        }

        public bool SelfTest()
        {
            return true;
        }

        public void ShowSponsor(string sponsorName)
        {
            RemoteControlCar.SetSponsor(sponsorName);
        }

        public void SetSpeed(decimal amount, string unitsString)
        {
            SpeedUnits speedUnits = SpeedUnits.MetersPerSecond;
            if (unitsString == "cps")
            {
                speedUnits = SpeedUnits.CentimetersPerSecond;
            }

            RemoteControlCar.SetSpeed(new Speed(amount, speedUnits));
        }
    }

    public string GetSpeed()
    {
        return currentSpeed.ToString();
    }

    private void SetSponsor(string sponsorName)
    {
        CurrentSponsor = sponsorName;

    }

    private void SetSpeed(Speed speed)
    {
        currentSpeed = speed;
    }
}

enum SpeedUnits
{
    MetersPerSecond,
    CentimetersPerSecond
}

struct Speed
{
    public decimal Amount { get; }
    public SpeedUnits SpeedUnits { get; }

    public Speed(decimal amount, SpeedUnits speedUnits)
    {
        Amount = amount;
        SpeedUnits = speedUnits;
    }

    public override string ToString()
    {
        string unitsString = "meters per second";
        if (SpeedUnits == SpeedUnits.CentimetersPerSecond)
        {
            unitsString = "centimeters per second";
        }

        return Amount + " " + unitsString;
    }
}
