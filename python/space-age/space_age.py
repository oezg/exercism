from collections.abc import Callable


class SpaceAge:
    SECONDS: int = 31_557_600  # Earth year in seconds
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

    def __init__(self, seconds: int) -> None:
        self.earth_years = seconds / SpaceAge.SECONDS


def on_planet(orbit: float) -> Callable[[SpaceAge], int]:
    def clojure(self: SpaceAge) -> int:
        return round(self.earth_years / orbit, 2)

    return clojure


for planet, orbit in SpaceAge.PLANETS.items():
    setattr(SpaceAge, f"on_{planet}", on_planet(orbit))
