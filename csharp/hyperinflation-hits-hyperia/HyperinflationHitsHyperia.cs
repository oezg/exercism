using System;
using System.Globalization;

public static class CentralBank
{
    public static string DisplayDenomination(long @base, long multiplier)
    {
        try
        {
            checked
            {
                return (@base * multiplier).ToString();
            }
        }
        catch (OverflowException e)
        {
            return "*** Too Big ***";
        }
    }

    public static string DisplayGDP(float @base, float multiplier)
        => float.IsInfinity(@base * @base) 
            ? "*** Too Big ***" 
            : (@base * multiplier).ToString(new CultureInfo("en-US"));

    public static string DisplayChiefEconomistSalary(decimal salaryBase, decimal multiplier)
    {
        try
        {
            checked
            {
                return (salaryBase * multiplier).ToString(CultureInfo.InvariantCulture);
            }
        }
        catch (OverflowException e)
        {
            return "*** Much Too Big ***";
        }
    }
}
