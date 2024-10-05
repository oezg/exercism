module CalculatorExceptions

  class UnsupportedOperationError < StandardError
    def initialize(message = 'Operator is not supported')
      super
    end
  end

  UnsupportedOperation = UnsupportedOperationError

  class OperandError < ArgumentError
    def initialize(message = 'All operands must be numeric')
      super
    end
  end

end

class SimpleCalculator

  include CalculatorExceptions

  OPERATIONS = {
    '+' => ->(operand1, operand2)     { operand1 + operand2 },
    '*' => ->(operand1, operand2)     { operand1 * operand2 },
    '/' => ->(numerator, denominator) { numerator / denominator }
  }

  def self.calculate(first_operand, second_operand, operation)
    new(first_operand, second_operand, operation).to_s
  end

  def to_s
    '%<operand1>i %<operation>s %<operand2>i = %<result>.0f' % {
      operand1:  operand1,
      operation: operator,
      operand2:  operand2,
      result:    operation[operand1, operand2]
    }
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
  end

  private

  attr_accessor :operand1,
                :operand2,
                :operator,
                :operation

  def initialize(operand1, operand2, operation)
    raise UnsupportedOperation unless OPERATIONS.include? operation
    raise OperandError         unless [operand1, operand2].all?(Numeric)

    self.operand1  = operand1
    self.operand2  = operand2
    self.operator  = operation
    self.operation = OPERATIONS[operation]
  end

end
