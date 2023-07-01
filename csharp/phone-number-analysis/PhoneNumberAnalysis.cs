using System;

public static class PhoneNumber
{
    private const string AreaCodeNewYork = "212";
    private const string FakePrefixCode = "555";
    private const int LengthLocalNumber = 4;
    private const int StartIndexFake = 4;

    public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
        => (phoneNumber.StartsWith(AreaCodeNewYork),
            phoneNumber[StartIndexFake..(StartIndexFake+FakePrefixCode.Length)].Equals(FakePrefixCode),
            phoneNumber[^LengthLocalNumber..]);

    public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo) 
        => phoneNumberInfo.IsFake;
}
