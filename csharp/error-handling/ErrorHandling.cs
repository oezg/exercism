using System;

public static class ErrorHandling
{
    public static void HandleErrorByThrowingException()
    {
        throw new Exception();
    }

    public static int? HandleErrorByReturningNullableType(string input)
    {
        var result = Int32.TryParse(input, out var value);
        if (result == false) return null;
        return value;
    }

    public static bool HandleErrorWithOutParam(string input, out int result)
    {
        var x = HandleErrorByReturningNullableType(input);
        if (x == null)
        {
            result = 0;
            return false;
        }
        else
        {
            result = (int)x;
            return true;
        }
    }

    public static void DisposableResourcesAreDisposedWhenExceptionIsThrown(IDisposable disposableObject)
    {
        disposableObject.Dispose();
        throw new Exception();
    }
}
