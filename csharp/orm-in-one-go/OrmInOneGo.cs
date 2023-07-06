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
        try
        {
            db.BeginTransaction();
            db.Write(data);
            db.EndTransaction();
        }
        catch (InvalidOperationException e)
        {
            db.Dispose();
            throw e;
        }
    }

    public bool WriteSafely(string data)
    {
        using var db = database;
        try
        {
            db.BeginTransaction();
            db.Write(data);
            db.EndTransaction();
            return true;
        }
        catch (InvalidOperationException e)
        {
            db.Dispose();
            return false;
        }
    }
}
