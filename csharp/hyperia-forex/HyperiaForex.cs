using System;

public struct CurrencyAmount
{
    private decimal _amount { get; }

    private string _currency { get; }

    public CurrencyAmount(decimal amount, string currency)
    {
        _amount = amount;
        _currency = currency;
    }

    private static bool s_assertSameCurrency(CurrencyAmount lhs, CurrencyAmount rhs)
        => lhs._currency == rhs._currency ? true : throw new ArgumentException("Currencies must be the same.");

    public static bool operator ==(CurrencyAmount lhs, CurrencyAmount rhs)
        => s_assertSameCurrency(lhs, rhs) && lhs._amount == rhs._amount;

    public static bool operator !=(CurrencyAmount lhs, CurrencyAmount rhs)
        => !(lhs == rhs);

    public static bool operator <(CurrencyAmount lhs, CurrencyAmount rhs)
        => s_assertSameCurrency(lhs, rhs) && lhs._amount < rhs._amount;

    public static bool operator >(CurrencyAmount lhs, CurrencyAmount rhs)
        => !(lhs == rhs || lhs < rhs);

    public static CurrencyAmount operator +(CurrencyAmount lhs, CurrencyAmount rhs)
        => s_assertSameCurrency(lhs, rhs) ? new CurrencyAmount(lhs._amount + rhs._amount, rhs._currency) : default;

    public static CurrencyAmount operator -(CurrencyAmount lhs, CurrencyAmount rhs)
        => lhs + new CurrencyAmount(-rhs._amount, rhs._currency);

    public static CurrencyAmount operator *(decimal factor, CurrencyAmount ca)
        => new(factor * ca._amount, ca._currency);

    public static CurrencyAmount operator *(CurrencyAmount ca, decimal factor)
        => factor * ca;

    public static CurrencyAmount operator /(CurrencyAmount ca, decimal divisor)
        => new(ca._amount / divisor, ca._currency);

    public static explicit operator double(CurrencyAmount ca)
        => (double)ca._amount;

    public static implicit operator decimal(CurrencyAmount ca)
        => ca._amount;
}
