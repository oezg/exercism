class String
  def crazy_shit(my_map)
    self % my_map
  end
end


TwoFer = 'One for %<name>s, one for me.'

def TwoFer.two_fer(name = 'you')
  crazy_shit({name:})
end