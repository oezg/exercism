TwoFer = 'One for %<name>s, one for me.'

def TwoFer.two_fer(name = 'you')
  self % {name:}
end