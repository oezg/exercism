class NotMovieClubMemberError < RuntimeError
end

class Moviegoer

  SENIOR        = 60
  JUNIOR        = 18
  DISCOUNT_PRICE = 10
  NORMAL_PRICE  = 15

  private_constant :SENIOR,
                   :JUNIOR,
                   :DISCOUNT_PRICE,
                   :NORMAL_PRICE


  private

  attr_accessor :age,
              :member

  def initialize(age, member: false)
    self.age = age
    self.member = member
  end

  public

  def ticket_price
    age < SENIOR ? NORMAL_PRICE : DISCOUNT_PRICE
  end

  def watch_scary_movie?
    age >= JUNIOR
  end

  def claim_free_popcorn!
    raise NotMovieClubMemberError unless member
    '🍿'
  end

end
