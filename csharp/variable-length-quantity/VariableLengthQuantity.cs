using System;
using System.Collections.Generic;

public static class VariableLengthQuantity
{
    
    public static uint[] Encode(uint[] numbers)
    {
        var result = new List<uint>();

        foreach (uint number in numbers) 
        {
            result.AddRange(EncodeNumber(number));
        }
        
        return result.ToArray();
    }

    public static uint[] Decode(uint[] bytes)
    {
        var result = new List<uint>();

        var number = new List<uint>();

        foreach (var codedByte in bytes)
        {
            number.Add(codedByte);
            if (codedByte < 128)
            {
                result.Add(DecodeNumber(number));
                number.Clear();
            }
        }

        if (number.Count > 0)
        {
            throw new InvalidOperationException();
        }

        return result.ToArray();
    }

    public static uint DecodeNumber(List<uint> codedBytes)
    {
        uint code = 0;

        var degree = codedBytes.Count - 1;

        foreach (uint number in codedBytes)
        {
            if (number < 128)
            {
                return code + number;
            }
            
            var remainder = number & 127;
            code += remainder * (uint)(Math.Pow(128, degree));
            degree--;
            
        }

        return code;
    }

    public static List<uint> EncodeNumber(uint number)
    {
        if (number == 0)
        {
            return new List<uint> { 0 };
        }

        var division = number;

        var code = new List<uint>();

        var continued = false;

        while (division > 0)
        {
            var num = division & 127;


            division = division >> 7;

            if (continued)
            {
                num += 128;
            }

            continued = true;

            code.Add(num);
        }

        code.Reverse();

        return code;
    }
}