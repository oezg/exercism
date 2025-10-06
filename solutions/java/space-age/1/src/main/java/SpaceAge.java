class SpaceAge {
  enum Planet {
    Mercury(0.2408467),
    Venus(0.61519726),
    Earth(1.0),
    Mars(1.8808158),
    Jupiter(11.862615),
    Saturn(29.447498),
    Uranus(84.016846),
    Neptune(164.79132);
    private final double orbit;

    Planet(double orbit) {
      this.orbit = orbit;
    }

    public double getOrbit() {
      return orbit;
    }
  }

  private final double seconds;

  SpaceAge(double seconds) {
    this.seconds = seconds;
  }

  double getSeconds() {
    return seconds;
  }

  double onEarth() {
    return onPlanet(Planet.Earth);
  }

  double onMercury() {
    return onPlanet(Planet.Mercury);
  }

  double onVenus() {
    return onPlanet(Planet.Venus);
  }

  double onMars() {
    return onPlanet(Planet.Mars);
  }

  double onJupiter() {
    return onPlanet(Planet.Jupiter);
  }

  double onSaturn() {
    return onPlanet(Planet.Saturn);
  }

  double onUranus() {
    return onPlanet(Planet.Uranus);
  }

  double onNeptune() {
    return onPlanet(Planet.Neptune);
  }

  double onPlanet(Planet planet) {
    return getSeconds() / 31557600 / planet.getOrbit();
  }
}
