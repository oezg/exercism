using System;

static class GameMaster
{
    public static string Describe(Character character)
        => $"You're a level {character.Level} {character.Class} with {character.HitPoints} hit points.";

    public static string Describe(Destination destination)
        => $"You've arrived at {destination.Name}, which has {destination.Inhabitants} inhabitants.";

    public static string Describe(TravelMethod travelMethod)
        => travelMethod.Equals(TravelMethod.Horseback)
            ? "You're traveling to your destination on horseback."
            : "You're traveling to your destination by walking.";

    public static string Describe(Character character, Destination destination, TravelMethod travelMethod = TravelMethod.Walking)
        => $"{Describe(character)} {Describe(travelMethod)} {Describe(destination)}";

    //public static string Describe(Character character, Destination destination)
    //    => Describe(character, destination, TravelMethod.Walking);
}

class Character
{
    public string Class { get; set; }
    public int Level { get; set; }
    public int HitPoints { get; set; }
}

class Destination
{
    public string Name { get; set; }
    public int Inhabitants { get; set; }
}

enum TravelMethod
{
    Walking,
    Horseback
}
