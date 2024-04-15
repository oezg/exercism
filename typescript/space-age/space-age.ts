const YEAR_SECONDS = 31557600;
const ORBITS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132,
};

export function age(planet: keyof typeof ORBITS, seconds: number): number {
    return roundTo(seconds / YEAR_SECONDS / ORBITS[planet], 2);
}

function roundTo(value: number, precision: number): number {
    const exponent = Math.pow(10, precision)
    return Math.round(exponent * value) / exponent;
}
