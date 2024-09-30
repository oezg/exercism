module Port
  IDENTIFIER = :PALE
  PORT = ...4
  CARGO = ...3

  def self.get_identifier(city)
    city[PORT].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    ["OIL", "GAS"].include?(ship_identifier[CARGO]) ? :A : :B
  end
end
