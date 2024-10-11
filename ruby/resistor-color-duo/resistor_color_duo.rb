class ResistorColorDuo

  BANDS = {
    black: 0,
    brown:1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  private_constant :BANDS

  def self.value(colors)
    new(colors).to_i
  end

  def to_i
    resistor_value
  end

  private

  attr_accessor :resistor_value

  def initialize(colors)
    color1, color2 = colors.map(&:intern).map(&BANDS)
    self.resistor_value = 10 * color1 + color2
  end

end
