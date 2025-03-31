from functools import partial


class SpaceAge:
    def __init__(self, seconds):
        [
            setattr(
                self,
                f"on_{planet}",
                partial(lambda orbit: round(seconds / 31_557_600 / orbit, 2), orbit),
            )
            for planet, orbit in (
                ("earth", 1.0),
                ("mercury", 0.2408467),
                ("venus", 0.61519726),
                ("mars", 1.8808158),
                ("jupiter", 11.862615),
                ("saturn", 29.447498),
                ("uranus", 84.016846),
                ("neptune", 164.79132),
            )
        ]
