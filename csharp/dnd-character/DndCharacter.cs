using System;
using System.Linq;

public class DndCharacter
{
    private static readonly Random s_random = new();
    public int Strength { get; }
    public int Dexterity { get; }
    public int Constitution { get; }
    public int Intelligence { get; }
    public int Wisdom { get; }
    public int Charisma { get; }
    public int Hitpoints { get; }

    public static int Modifier(int score)
        => (score - 10) >> 1;

    public static int Ability() 
        => Enumerable.Range(0, 4).Select(_ => s_random.Next(1, 7)).Order().TakeLast(3).Sum();

    public static DndCharacter Generate()
    {
        return new DndCharacter(
            strength: Ability(),
            dexterity: Ability(),
            constitution: Ability(),
            intelligence: Ability(),
            wisdom: Ability(),
            charisma: Ability()
            );

    }

    public DndCharacter(int strength, int dexterity, int constitution, int intelligence, int wisdom, int charisma)
    {
        Strength = strength;
        Dexterity = dexterity;
        Constitution = constitution;
        Intelligence = intelligence;
        Wisdom = wisdom;
        Charisma = charisma;
        Hitpoints = 10 + Modifier(Constitution);
    }
}
