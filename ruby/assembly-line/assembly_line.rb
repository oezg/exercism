class AssemblyLine

  UNITS_PER_HOUR = 221

  EFFICIENCY = {
    1..4 => 1.0,
    5..8 => 0.9,
    9..9 => 0.8,
    10..10 => 0.77
  }

  private_constant  :UNITS_PER_HOUR,
                    :EFFICIENCY

  private

  attr_writer :production_rate_per_hour,
              :working_items_per_minute

  def initialize(speed)
    success_rate = rate(speed)
    self.production_rate_per_hour = UNITS_PER_HOUR * speed * success_rate
    self.working_items_per_minute = (production_rate_per_hour / 60).to_i
  end

  def rate(speed)
    EFFICIENCY.filter_map do |speed_range, success_rate|
      success_rate if speed_range.cover?(speed)
    end.first
  end

  public

  attr_reader :production_rate_per_hour,
              :working_items_per_minute

end
