module ResistorColor

  BANDS = {
    black:  0,
    brown:  1,
    red:    2,
    orange: 3,
    yellow: 4,
    green:  5,
    blue:   6,
    violet: 7,
    grey:   8,
    white:  9
  }

  COLORS = BANDS.keys.map(&:to_s)

  def color_code(color)
    BANDS.fetch(color.to_sym)
  end

end

ResistorColor.extend ResistorColor