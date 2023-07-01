using System;

public static class SimpleCalculator
{
    public static string Calculate(int operand1, int operand2, string operation)
    {
        int result;
        switch (operation)
        {
            case "+":
                result = SimpleOperation.Addition(operand1, operand2);
                break;
            case "/":
                try
                {
                    result = SimpleOperation.Division(operand1, operand2);
                }
                catch (DivideByZeroException e)
                {
                    return "Division by zero is not allowed.";
                }
                break;
            case "*":
                result = SimpleOperation.Multiplication(operand1, operand2);
                break;
            case null:
                throw new ArgumentNullException();
            case "":
                throw new ArgumentException();
            default:
                throw new ArgumentOutOfRangeException();
        }
        return $"{operand1} {operation} {operand2} = {result}";
    }
}
