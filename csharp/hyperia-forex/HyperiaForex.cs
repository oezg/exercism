using System;

public struct CurrencyAmount
{
    private decimal amount;
    private string currency;

    public CurrencyAmount(decimal amount, string currency)
    {
        this.amount = amount;
        this.currency = currency;
    }

    private static bool AssertSameCurrency(CurrencyAmount lhs, CurrencyAmount rhs)
        => lhs.currency == rhs.currency ? true : throw new ArgumentException("Currencies must be the same.");

    public static bool operator ==(CurrencyAmount lhs, CurrencyAmount rhs)
        => AssertSameCurrency(lhs, rhs) && lhs.amount == rhs.amount;

    public static bool operator !=(CurrencyAmount lhs, CurrencyAmount rhs)
        => !(lhs == rhs);

    public static bool operator <(CurrencyAmount lhs, CurrencyAmount rhs)
        => AssertSameCurrency(lhs, rhs) && lhs.amount < rhs.amount;

    public static bool operator >(CurrencyAmount lhs, CurrencyAmount rhs)
        => !(lhs == rhs || lhs < rhs);

    public static CurrencyAmount operator +(CurrencyAmount lhs, CurrencyAmount rhs)
        => AssertSameCurrency(lhs, rhs) ? new CurrencyAmount(lhs.amount + rhs.amount, rhs.currency) : default;

    public static CurrencyAmount operator -(CurrencyAmount lhs, CurrencyAmount rhs)
        => lhs + new CurrencyAmount(-rhs.amount, rhs.currency);

    public static CurrencyAmount operator *(decimal factor, CurrencyAmount ca)
        => new(factor * ca.amount, ca.currency);

    public static CurrencyAmount operator *(CurrencyAmount ca, decimal factor)
        => factor * ca;

    public static CurrencyAmount operator /(CurrencyAmount ca, decimal divisor)
        => new(ca.amount / divisor, ca.currency);

    public static explicit operator double(CurrencyAmount ca)
        => (double)ca.amount;

    public static implicit operator decimal(CurrencyAmount ca)
        => ca.amount;
}
