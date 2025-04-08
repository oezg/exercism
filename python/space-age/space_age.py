from collections.abc import Callable

PLANETS: dict[str, float] = {
    "earth": 1.0,
    "mercury": 0.2408467,
    "venus": 0.61519726,
    "mars": 1.8808158,
    "jupiter": 11.862615,
    "saturn": 29.447498,
    "uranus": 84.016846,
    "neptune": 164.79132,
}


class SpaceAge:
    def __init__(self, seconds: int) -> None:
        self.earth_years = seconds / 31_557_600


def on_planet(orbit: float) -> Callable[[SpaceAge], float]:
    return lambda self: round(self.earth_years / orbit, 2)


for planet, orbit in PLANETS.items():
    setattr(SpaceAge, f"on_{planet}", on_planet(orbit))
