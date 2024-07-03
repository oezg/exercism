module SpaceAge (Planet (..), ageOn) where

data Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

yearInSeconds :: Float
yearInSeconds = 31557600

orbitalPeriod :: Planet -> Float
orbitalPeriod Mercury = 0.2408467
orbitalPeriod Venus = 0.61519726
orbitalPeriod Earth = 1.0
orbitalPeriod Mars = 1.8808158
orbitalPeriod Jupiter = 11.862615
orbitalPeriod Saturn = 29.447498
orbitalPeriod Uranus = 84.016846
orbitalPeriod Neptune = 164.79132

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = seconds / yearInSeconds / orbitalPeriod Mercury
ageOn Venus seconds = seconds / yearInSeconds / orbitalPeriod Venus
ageOn Earth seconds = seconds / yearInSeconds / orbitalPeriod Earth
ageOn Mars seconds = seconds / yearInSeconds / orbitalPeriod Mars
ageOn Jupiter seconds = seconds / yearInSeconds / orbitalPeriod Jupiter
ageOn Saturn seconds = seconds / yearInSeconds / orbitalPeriod Saturn
ageOn Uranus seconds = seconds / yearInSeconds / orbitalPeriod Uranus
ageOn Neptune seconds = seconds / yearInSeconds / orbitalPeriod Neptune

