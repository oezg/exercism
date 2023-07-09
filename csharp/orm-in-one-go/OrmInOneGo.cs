using System;

public class Orm
{
    private Database database;

    public Orm(Database database)
    {
        this.database = database;
    }

    public void Write(string data)
    {
        using var db = database;
        db.BeginTransaction();
        db.Write(data);
        db.EndTransaction();
    }

    public bool WriteSafely(string data)
    {
        bool result = true;
        using var db = database;
        try
        {
            db.BeginTransaction();
            db.Write(data);
            db.EndTransaction();
        }
        catch (InvalidOperationException e)
        {
            result = false;
        }

        return result;
    }
}
