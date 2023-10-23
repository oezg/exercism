using System;
using System.Collections.Generic;
using System.Linq;

public static class VariableLengthQuantity
{
    public static uint[] Encode(uint[] numbers) 
        => numbers.SelectMany(number => _encodeNumber(number)).ToArray();


    public static uint[] Decode(uint[] bytes)
    {
        var result = new List<uint>();

        var index = 0;

        for (var i = 0; i < bytes.Length; i++)
        {
            if (bytes[i] < 128)
            {
                result.Add(_decodeBytes(bytes[index..(i+1)]));
                index = i+1;
            }
        }

        if (index < bytes.Length)
        {
            throw new InvalidOperationException($"index {index} bytes length {bytes.Length}");
        }

        return result.ToArray();
    }

    private static uint _decodeBytes(uint[] codeBytes)
        => codeBytes
        .Select((codeByte, i) => (codeByte & 127) * (1u << (codeBytes.Length - i - 1) * 7))
        .Aggregate((acc, curr) => acc + curr);


    private static IEnumerable<uint> _encodeNumber(uint number, LinkedList<uint> code = null)
    {
        code ??= new LinkedList<uint>();

        if (number == 0)
        {
            return code.DefaultIfEmpty();
        }

        var digit = number & 127;

        code.AddFirst(code.Any() ? digit | 128 : digit);

        return _encodeNumber(number >> 7, code);
    }
}