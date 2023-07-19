using System;
using System.Collections.Generic;

public static class Strain
{
    public static IEnumerable<T> Keep<T>(this IEnumerable<T> collection, Predicate<T> predicate)
    {
        foreach (var item in collection)
        {
            if (predicate(item))
            {
                yield return item;
            }
        }
    }

    public static IEnumerable<T> Discard<T>(this IEnumerable<T> collection, Predicate<T> predicate)
        => collection.Keep(item => !predicate(item));
}