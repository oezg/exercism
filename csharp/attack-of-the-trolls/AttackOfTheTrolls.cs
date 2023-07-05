using System;

enum AccountType
{
    Other = 0,
    Guest = 1,
    User = 3,
    Moderator = 7,
}

[Flags]
enum Permission
{
    None = 0,
    Read = 1,
    Write = 1 << 1,
    Delete = 1 << 2,
    All = 7,
}

static class Permissions
{
    public static Permission Default(AccountType accountType)
    {
        if (!Enum.IsDefined(typeof(AccountType), accountType))
        {
            accountType = AccountType.Other;
        }
        return (Permission)accountType;

    }

    public static Permission Grant(Permission current, Permission grant) 
        => current | grant;

    public static Permission Revoke(Permission current, Permission revoke) 
        => (current ^ revoke) & current;

    public static bool Check(Permission current, Permission check) 
        => Revoke(check, current) == Permission.None;
}
