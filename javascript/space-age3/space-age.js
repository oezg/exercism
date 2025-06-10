export const age = (planet, seconds) => Number((seconds / EARTH_YEAR / ORBITS[planet]).toFixed(2));

const EARTH_YEAR = 31557600;  // SECONDS

// Earth years
const ORBITS = {
  mercury: 0.2408467,
  venus:  0.61519726,
  earth:  1.0,  // 365.25 Earth days
  mars:  1.8808158,
  jupiter: 11.862615,
  saturn:  29.447498,
  uranus:  84.016846,
  neptune: 164.79132,
}