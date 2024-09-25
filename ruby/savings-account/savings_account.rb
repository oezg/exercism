module SavingsAccount

  BALANCE_RANGES = {
        ...   0 => 3.213,
       0...1000 => 0.5,
    1000...5000 => 1.621,
    5000...     => 2.475
  }

  private_constant :BALANCE_RANGES

  module HashPatch
    refine Hash do
      def in_range(scalar)
        self.select { _1.cover?(scalar) }.first[1]
      end
    end
  end

  using HashPatch

  def interest_rate(balance)
    BALANCE_RANGES.in_range(balance)
  end

  module FloatPatch
    refine Float do
      def percent
        self / 100
      end
    end
  end

  using FloatPatch

  def annual_balance_update(balance)
    balance * (1 + interest_rate(balance).percent)
  end

  def years_before_desired_balance(current_balance, desired_balance)
    counter = 0
    while current_balance < desired_balance
      counter += 1
      current_balance = annual_balance_update(current_balance)
    end
    counter
  end

end

SavingsAccount.extend SavingsAccount
