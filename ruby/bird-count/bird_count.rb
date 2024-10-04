class BirdCount

  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  private

  attr_accessor :birds_per_day

  def initialize(birds_per_day)
    self.birds_per_day = birds_per_day
  end

  public

  def yesterday
    self.birds_per_day[-2]
  end

  def total
    self.birds_per_day.sum
  end

  def busy_days
    self.birds_per_day.select { |day| day >= 5 }.count
  end

  def day_without_birds?
    self.birds_per_day.any? { |day| day == 0 }
  end

end
