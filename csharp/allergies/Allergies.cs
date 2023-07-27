using System;
using System.Collections.Generic;
using System.Linq;

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
    private Allergen _allergen { get; }

    public Allergies(int mask) => _allergen = (Allergen)mask;

    public bool IsAllergicTo(Allergen allergen) => _allergen.HasFlag(allergen);

    public Allergen[] List() => Enum.GetValues<Allergen>().Where(IsAllergicTo).ToArray();
        
}