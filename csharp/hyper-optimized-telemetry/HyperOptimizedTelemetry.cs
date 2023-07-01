using System;
using System.Linq;

public static class TelemetryBuffer
{
    private const int _signedLong = -8;
    private const int _unsignedInt = 4;
    private const int _signedInt = -4;
    private const int _unsignedShort = 2;
    private const int _signedShort = -2;

    public static byte[] ToBuffer(long reading)
    {
        byte[] buffer = new byte[9];
        int prefix = Prefix(reading);
        buffer[0] = (byte) prefix;
        byte[] data = BitConverter.GetBytes(reading);
        Array.Resize(ref data, Math.Abs(prefix));
        data.CopyTo(buffer, 1);
        return buffer;
    }

    static int Prefix(long number) => number switch
    {
        < Int32.MinValue => _signedLong,
        < short.MinValue => _signedInt,
        < ushort.MinValue => _signedShort,
        <= ushort.MaxValue => _unsignedShort,
        <= Int32.MaxValue => _signedInt,
        <= UInt32.MaxValue => _unsignedInt,
        _ => _signedLong
    };

    public static long FromBuffer(byte[] buffer) => buffer[0] switch
    {
        256 + _signedLong => BitConverter.ToInt64(buffer, 1),
        256 + _signedInt => BitConverter.ToInt32(buffer, 1),
        256 + _signedShort => BitConverter.ToInt16(buffer, 1),
        _unsignedShort => BitConverter.ToUInt16(buffer, 1),
        _unsignedInt => BitConverter.ToUInt32(buffer, 1),
        _ => 0,
    };
}

