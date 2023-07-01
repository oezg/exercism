using System;

class RemoteControlCar
{
    public int Distance = 0;

    public int Battery = 100;


    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return $"Driven {Distance} meters";
    }

    public string BatteryDisplay()
    {
        return Battery > 0 ?  $"Battery at {Battery}%" : "Battery empty";
    }

    public void Drive()
    {
        if (Battery > 0)
        {
            Distance += 20;
            Battery -= 1;
        }
    }
}
