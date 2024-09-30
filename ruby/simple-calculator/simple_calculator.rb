class SimpleCalculator

  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation

    raise ArgumentError unless first_operand.is_a? Numeric and second_operand.is_a? Numeric

    result = case operation
    when '+'
      first_operand + second_operand
    when '*'
      first_operand * second_operand
    when '/'
      first_operand / second_operand
    end

    "#{first_operand} #{operation} #{second_operand} = #{result}"

    rescue ZeroDivisionError
      "Division by zero is not allowed."
  end
end
