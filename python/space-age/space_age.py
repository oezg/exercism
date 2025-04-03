from functools import partial


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
        to_year = lambda orbit: round(seconds / SpaceAge.SECONDS / orbit, 2)

        for planet, orbit in SpaceAge.PLANETS.items():
            setattr(self, f"on_{planet}", partial(to_year, orbit))
