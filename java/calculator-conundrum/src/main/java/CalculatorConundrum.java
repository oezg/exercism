class CalculatorConundrum {
    public String calculate(int operand1, int operand2, String operation) {
        return String.format("%d %s %d = %d", operand1, operation, operand2, switch (operation) {
            case null -> throw new IllegalArgumentException("Operation cannot be null");
            case "" -> throw new IllegalArgumentException("Operation cannot be empty");
            case "+" -> operand1 + operand2;
            case "*" -> operand1 * operand2;
            case "/" -> {
                if (operand2 == 0)
                    throw new IllegalOperationException("Division by zero is not allowed", new ArithmeticException());
                yield operand1 / operand2;
            }
            default -> throw new IllegalOperationException(String.format("Operation '%s' does not exist", operation));
        });
    }
}
