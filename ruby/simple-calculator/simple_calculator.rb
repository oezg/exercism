module CalculatorExceptions
  class UnsupportedOperation < StandardError
  end
end

class SimpleCalculator

  include CalculatorExceptions

  OPERATIONS = {
    '+' => ->(operand1, operand2) { operand1 + operand2 },
    '*' => ->(operand1, operand2) { operand1 * operand2 },
    '/' => ->(numerator, denominator) { numerator / denominator }
  }

  def self.calculate(first_operand, second_operand, operation)
    new(first_operand, second_operand, operation).to_s
  end

  def to_s
    '%<left>i %<operation>s %<right>i = %<result>.0f' % {
      left: operand1,
      operation: operator,
      right: operand2,
      result: operation[operand1, operand2]
    }
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
  end

  private

  attr_accessor :operand1, :operand2, :operator, :operation

  def initialize(operand1, operand2, operation)
    raise UnsupportedOperation unless OPERATIONS.include? operation
    raise ArgumentError unless [operand1, operand2].all?(Numeric)

    self.operand1 = operand1
    self.operand2 = operand2
    self.operator = operation
    self.operation = OPERATIONS[operation]
  end

end
