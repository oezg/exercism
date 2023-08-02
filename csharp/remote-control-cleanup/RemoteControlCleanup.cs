public class RemoteControlCar
{
    #region constructors
    public RemoteControlCar()
    {
        Telemetry = new RemoteControlCarTelemetry(this);
    }
    #endregion

    #region enums
    private enum SpeedUnits
    {
        MetersPerSecond,
        CentimetersPerSecond
    }
    #endregion

    #region properties
    public string CurrentSponsor { get; private set; }

    public ITelemetry Telemetry { get; }
    private Speed _currentSpeed { get; set; }
    #endregion

    #region methods
    public string GetSpeed() => _currentSpeed.ToString();

    private void SetSponsor(string sponsorName) => CurrentSponsor = sponsorName;

    private void SetSpeed(Speed speed) => _currentSpeed = speed;
    #endregion

    #region structs
    private struct Speed
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
    #endregion

    #region interfaces
    public interface ITelemetry
    {
        public void Calibrate();
        public bool SelfTest();
        public void ShowSponsor(string sponsor);
        public void SetSpeed(decimal x, string u);
    }
    #endregion

    #region classes
    private class RemoteControlCarTelemetry : ITelemetry
    {
        #region constructors
        public RemoteControlCarTelemetry(RemoteControlCar remoteControlCar) 
            => RemoteControlCar = remoteControlCar;
        #endregion

        #region properties
        public RemoteControlCar RemoteControlCar { get; }
        #endregion

        #region methods
        public void Calibrate() { }

        public bool SelfTest() => true;

        public void ShowSponsor(string sponsorName) => RemoteControlCar.SetSponsor(sponsorName);

        public void SetSpeed(decimal amount, string unitsString) 
            => RemoteControlCar.SetSpeed(
                new Speed(amount, 
                    unitsString == "cps" 
                    ? SpeedUnits.CentimetersPerSecond 
                    : SpeedUnits.MetersPerSecond));
        #endregion
    }
    #endregion

}
