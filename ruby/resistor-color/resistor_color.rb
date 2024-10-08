ResistorColor = %w[black brown red orange yellow green blue violet grey white]

def ResistorColor.color_code(color)
  index(color)
end

ResistorColor::COLORS = ResistorColor