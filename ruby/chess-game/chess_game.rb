module Chess

  RANKS = 1..8

  FILES = 'A'..'H'

  MOVEMENT_MESSAGE = {
    true => '%<name>s moved to %<square>s',
    false => '%<name>s attempted to move to %<square>s, but that is not a valid square'
  }

  def valid_square?(rank, file)
    RANKS.cover? Integer(rank) and FILES.cover? file
  end

  def nick_name(first_name, last_name)
    (first_name[...2] + last_name[-2..]).upcase
  end

  def move_message(first_name, last_name, square)
    MOVEMENT_MESSAGE[valid?(square)] %
      {name: nick_name(first_name, last_name), square:}
  end

  private

  def valid?(square)
    valid_square?(*square.reverse.split(""))
  end

end

Chess.extend Chess
