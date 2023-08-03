using System.Collections.Generic;
using System.Collections.ObjectModel;

public class Authenticator
{
    #region fields
    #endregion

    #region constructors
    public Authenticator(Identity admin) => Admin = admin;
    #endregion

    #region properties
    public Identity Admin { get; }

    private IReadOnlyDictionary<string, Identity> _developers
        = new Dictionary<string, Identity>
        {
            ["Bertrand"] = new Identity(email: "bert@ex.ism", eyeColor: "blue"),
            ["Anders"] = new Identity(email: "anders@ex.ism", eyeColor: "brown"),
        };
    #endregion

    #region methods
    public IReadOnlyDictionary<string, Identity> GetDevelopers() => _developers;
    #endregion

    #region classes
    private class EyeColor
    {
        public const string Blue = "blue";
        public const string Green = "green";
        public const string Brown = "brown";
        public const string Hazel = "hazel";
        public const string Brey = "grey";
    }
    #endregion
}


public struct Identity
{
    public Identity(string email, string eyeColor)
    {
        Email = email;
        EyeColor = eyeColor;
    }

    public string Email { get; set; }

    public string EyeColor { get; set; }


}