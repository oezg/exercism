# We will get more in-depth about jq functions in a later lesson.
# A function begins with "def", ends with ";", and consists of a 
# single pipeline just like a "main" jq program.
#
# For now, your job is to implement the logic of the tasks in the function
# bodies, so that they output the correct values.

def success_rate:
  if   . == 10  then  0.77
  elif . == 9   then  0.80
  elif . >= 5   then  0.90
  else                1.00
  end
;

# Task 1: calculate the production rate per hour
def production_rate_per_hour:
  . * success_rate * 221
;

# Task 2: calculate the number of working items produced per minute
def working_items_per_minute:
  production_rate_per_hour / 60 | floor
;


# Please don't change the line below: it is responsible for passing
# the input speed value (a number between 0 and 10 inclusive)
# to the two functions defined above.
#
.speed | (production_rate_per_hour, working_items_per_minute)
