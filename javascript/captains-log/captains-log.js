// @ts-check

const genRandomInt = (low, high) =>
  Math.floor(getRandomFloat(low, high - low));

const getRandomFloat = (start, height) =>
  start + Math.random() * height;

/**
 * Generates a random starship registry number.
 *
 * @returns {string} the generated registry number.
 */
export const randomShipRegistryNumber = () =>
  `NCC-${genRandomInt(1000, 10000)}`;

/**
 * Generates a random stardate.
 *
 * @returns {number} a stardate between 41000 (inclusive) and 42000 (exclusive).
 */
export const randomStardate = () =>
  getRandomFloat(41, 1) * 1000;

/**
 * Generates a random planet class.
 *
 * @returns {string} a one-letter planet class.
 */
export const randomPlanetClass = () => {
  const classes = "D, H, J, K, L, M, N, R, T, Y".split(", ");
  return classes[Math.floor(Math.random() * classes.length)]
}
