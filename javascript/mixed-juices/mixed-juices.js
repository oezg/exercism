

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  switch (name) {
    case "Pure Strawberry Joy":
      return 0.5
    case "Energizer":
      return 1.5
    case "Green Garden":
      return 1.5
    case "Tropical Island":
      return 3
    case "All or Nothing":
      return 5
    default:
      return 2.5;
  }
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  let limeCount = 0;
  let wedgesCut = 0;
  while (wedgesCut < wedgesNeeded && limeCount < limes.length) {
    switch (limes[limeCount++]) {
      case "small":
        wedgesCut += 6;
        break;
      case "medium":
        wedgesCut += 8;
        break;
      case "large":
        wedgesCut += 10;
        break;
      default:
        break;
    }
  }
  return limeCount;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  let ordersCopy = orders.slice();
  do {
    timeLeft -= timeToMixJuice(ordersCopy.shift())
  } while (timeLeft > 0 && ordersCopy.length > 0);
  
  return ordersCopy;
}
