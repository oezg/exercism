using System;
using System.Collections.Generic;

public class FacialFeatures
{
    public string EyeColor { get; }
    public decimal PhiltrumWidth { get; }

    public FacialFeatures(string eyeColor, decimal philtrumWidth)
    {
        EyeColor = eyeColor;
        PhiltrumWidth = philtrumWidth;
    }
    
    public bool Equals(FacialFeatures obj) 
        => obj != null && (EyeColor == obj.EyeColor && PhiltrumWidth == obj.PhiltrumWidth);

    public override int GetHashCode() 
        => HashCode.Combine(EyeColor, PhiltrumWidth);
    
}

public class Identity
{
    public string Email { get; }
    public FacialFeatures FacialFeatures { get; }

    public Identity(string email, FacialFeatures facialFeatures)
    {
        Email = email;
        FacialFeatures = facialFeatures;
    }

    public override bool Equals(object obj)
    => obj is Identity other && Email == other.Email && FacialFeatures.Equals(other.FacialFeatures);

    public override int GetHashCode()
        => HashCode.Combine(Email, FacialFeatures);
}

public class Authenticator
{
    private readonly HashSet<Identity> _identitySet = new();
    private static readonly Identity Admin = new("admin@exerc.ism", new FacialFeatures("green", 0.9m));
    
    public static bool AreSameFace(FacialFeatures faceA, FacialFeatures faceB) => faceA.Equals(faceB);

    public bool IsAdmin(Identity identity) => Admin.Equals(identity);

    public bool Register(Identity identity)
        => !IsRegistered(identity) && _identitySet.Add(identity);

    public bool IsRegistered(Identity identity) => _identitySet.Contains(identity);

    public static bool AreSameObject(Identity identityA, Identity identityB) => identityA == identityB;
}
