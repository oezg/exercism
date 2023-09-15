using System;

public static class ErrorHandling
{
    public static void HandleErrorByThrowingException() => throw new Exception();

    public static int? HandleErrorByReturningNullableType(string input) => int.TryParse(input, out var value) ? value : null;

    public static bool HandleErrorWithOutParam(string input, out int result)
    {
        var x = HandleErrorByReturningNullableType(input);
        result = x ?? 0;
        return x != null;
    }

    public static void DisposableResourcesAreDisposedWhenExceptionIsThrown(IDisposable disposableObject)
    {
        disposableObject.Dispose();
        throw new Exception();
    }
}
