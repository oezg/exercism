/**
 * Determine the prize of the pizza given the pizza and optional extras
 *
 * @param {Pizza} pizza name of the pizza to be made
 * @param {Extra[]} extras list of extras
 *
 * @returns {number} the price of the pizza
 */
export function pizzaPrice(pizza, ...extras) {
  if (extras.length === 0) {
    return price(pizza);
  }
  return price(extras[0]) + pizzaPrice(pizza, ...extras.slice(1))
}


function price(item) {
  switch (item) {
    case 'Margherita': return 7;
    case 'Caprese': return 9;
    case 'Formaggio': return 10;
    case 'ExtraSauce': return 1;
    case 'ExtraToppings': return 2;
  }
}

/**
 * Calculate the price of the total order, given individual orders
 *
 * @param {PizzaOrder[]} pizzaOrders a list of pizza orders
 * @returns {number} the price of the total order
 */
export function orderPrice(pizzaOrders) {
  return pizzaOrders.reduce((acc, cur) => acc + pizzaPrice(cur.pizza, ...cur.extras), 0);
}
