using System;
using System.Collections.Generic;

[Flags]
public enum Allergen
{
    Eggs = 1,
    Peanuts = Eggs << 1,
    Shellfish = Peanuts << 1,
    Strawberries = Shellfish << 1,
    Tomatoes = Strawberries << 1,
    Chocolate = Tomatoes << 1,
    Pollen = Chocolate << 1,
    Cats = Pollen << 1,
}

public class Allergies
{
    public Allergen Allergen { get; set; }

    public Allergies(int mask)
    {
        Allergen = (Allergen)mask;
    }

    public bool IsAllergicTo(Allergen allergen)
    {
        return Allergen.HasFlag(allergen);
    }

    public Allergen[] List()
    {
        List<Allergen> allergens = new List<Allergen>();
        foreach (Allergen allergen in Enum.GetValues<Allergen>())
        {
            if (Allergen.HasFlag(allergen))
            {
                allergens.Add(allergen);
            }
        }
        return allergens.ToArray();
    }
}