update twofer
set
    response = 'One for ' || iif (input = '', 'you', input) || ', one for me.'