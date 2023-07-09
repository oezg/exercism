using System;
using System.Globalization;

public static class HighSchoolSweethearts
{
    public static string DisplaySingleLine(string studentA, string studentB) 
        => $"{studentA,29} ♡ {studentB,-29}";

    public static string DisplayBanner(string studentA, string studentB)
    {
        string heart = @"     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     {0} +  {1}    **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *";
        return String.Format(heart, studentA, studentB);
    }


    public static string DisplayGermanExchangeStudents(string studentA
        , string studentB, DateTime start, float hours)
    {
        var germanCulture = CultureInfo.CreateSpecificCulture("de-DE");
        string relationship = "{0} and {1} have been dating since {2:d} - that's {3:N2} hours";
        return String.Format(germanCulture, relationship, studentA, studentB, start, hours);
    }
}
