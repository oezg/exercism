class AssemblyLine
  CARS_PER_HOUR = 221
  attr_reader :production_rate_per_hour
  attr_reader :working_items_per_minute

  def initialize(speed)
    @production_rate_per_hour = 
      CARS_PER_HOUR * speed * if speed < 5
        1.0
      elsif speed < 9
        0.9
      elsif speed < 10
        0.8
      else
        0.77
      end

    @working_items_per_minute = (@production_rate_per_hour / 60).to_i
  end
end
