class BirdCount

  LAST_WEEK = [0, 2, 5, 3, 7, 8, 4]

  DEFINITION_OF_BUSY = ->(birds) { birds >= 5 }

  PENULTIMATE = -2

  private_constant :LAST_WEEK,
                   :DEFINITION_OF_BUSY,
                   :PENULTIMATE

  def self.last_week
    LAST_WEEK
  end

  private

  attr_accessor :birds_per_day

  def initialize(birds_per_day)
    self.birds_per_day = birds_per_day
  end

  public

  def yesterday
    birds_per_day.fetch PENULTIMATE
  end

  def total
    birds_per_day.sum
  end

  def busy_days
    birds_per_day.select(&DEFINITION_OF_BUSY).count
  end

  def day_without_birds?
    birds_per_day.any? { |day| day.zero? }
  end

end
