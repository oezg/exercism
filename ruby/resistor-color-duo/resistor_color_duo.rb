ResistorColorDuo = %w[black brown red orange yellow green blue violet grey white]

def ResistorColorDuo.color_code(color)
  index(color)
end

def ResistorColorDuo.value(colors)
  first, second = *colors.map { |color| ResistorColorDuo.color_code(color) }
  10 * first + second
end
