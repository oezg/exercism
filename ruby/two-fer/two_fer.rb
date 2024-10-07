class TwoFer

  def self.two_fer(name = 'you')
    new(name).to_s
  end

  private

  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  public

  def to_s
    'One for %<name>s, one for me.' % {name:}
  end

end