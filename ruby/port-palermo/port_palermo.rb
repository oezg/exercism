module Port

  IDENTIFIER = :PALE
  PORT = ...4
  CARGO = ...3
  TERMINALS = {
    OIL: :A,
    GAS: :A,
  }
  TERMINALS.default = :B

  def self.get_identifier(city)
    city[PORT].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    TERMINALS[ship_identifier[CARGO].to_sym]
  end

end
