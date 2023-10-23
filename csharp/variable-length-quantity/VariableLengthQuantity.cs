using System;
using System.Collections.Generic;
using System.Linq;


/// <summary>
/// Implementation of variable length quantity encoding and decoding.
/// In short, the goal of this encoding is to encode integer values in a way that would save bytes. 
/// Only the first 7 bits of each byte are significant (right-justified; sort of like an ASCII byte). 
/// So, if you have a 32-bit value, you have to unpack it into a series of 7-bit bytes. Of course, 
/// you will have a variable number of bytes depending upon your integer. To indicate which is the 
/// last byte of the series, you leave bit #7 clear. In all of the preceding bytes, you set bit #7.
/// </summary>
public static class VariableLengthQuantity
{
    /// <summary>
    /// Encode takes an array of unsigned integers and returns those integers 
    /// encoded with variable length encoding within an unsigned integer array.
    /// </summary>
    /// <param name="numbers"></param>
    /// <returns></returns>
    public static uint[] Encode(uint[] numbers) 
        => numbers.SelectMany(number => s_encodeNumber(number)).ToArray();

    /// <summary>
    /// Decode takes an array of unsigned integers that represent "bytes" encoded
    /// with variable length encoding and returns the decoded integers in an array.
    /// </summary>
    /// <param name="bytes"></param>
    /// <returns></returns>
    /// <exception cref="InvalidOperationException"></exception>
    public static uint[] Decode(uint[] bytes)
    {
        var result = new List<uint>();

        var index = 0;

        for (var i = 0; i < bytes.Length; i++)
        {
            if (bytes[i] < 128)
            {
                result.Add(s_decodeBytes(bytes[index..(i+1)]));
                index = i+1;
            }
        }

        if (index < bytes.Length)
        {
            throw new InvalidOperationException($"index {index} bytes length {bytes.Length}");
        }

        return result.ToArray();
    }

    /// <summary>
    /// s_decodeBytes takes an array of unsigned integers representing a chunk of "bytes" 
    /// encoded with variable length encoding and returns the decoded integer.
    /// </summary>
    /// <param name="codeBytes"></param>
    /// <returns></returns>
    private static uint s_decodeBytes(uint[] codeBytes)
        => codeBytes
        .Select((codeByte, i) => (codeByte & 127) * (1u << (codeBytes.Length - i - 1) * 7))
        .Aggregate((acc, curr) => acc + curr);


    /// <summary>
    /// s_encodeNumber takes a number to encode and encodes it recursively and returns the list
    /// of chunks of encoded 7-bit units.
    /// </summary>
    /// <param name="number"></param>
    /// <param name="code"></param>
    /// <returns></returns>
    private static IEnumerable<uint> s_encodeNumber(uint number, LinkedList<uint> code = null)
    {
        code ??= new LinkedList<uint>();

        if (number == 0)
        {
            return code.DefaultIfEmpty();
        }

        var digit = number & 127;

        // Only the last byte does not have its 7th bit set.
        // All other bytes have their 7th bit set to signalize 
        // that the encoded number is not finished.
        digit = code.Any() ? digit | 128 : digit;

        code.AddFirst(digit);

        return s_encodeNumber(number >> 7, code);
    }
}