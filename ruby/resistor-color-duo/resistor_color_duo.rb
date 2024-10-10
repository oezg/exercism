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

  class << self

    def value(colors)
      color1, color2 = colors.map { |color| color_code(color) }
      10 * color1 + color2
    end

    private

    def color_code(color)
      BANDS.fetch(color.to_sym)
    end

  end

end
