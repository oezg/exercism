module Chess

  RANKS = 1..8

  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.cover? rank and FILES.cover? file
  end

  def self.nick_name(first_name, last_name)
    (first_name[...2] + last_name[-2..]).upcase
  end

  def self.move_message(first_name, last_name, square)
    nick = nick_name(first_name, last_name)
    if valid_square?(square[1].to_i, square[0])
      "#{nick} moved to #{square}"
    else
      "#{nick} attempted to move to #{square}, but that is not a valid square"
    end
  end

end
