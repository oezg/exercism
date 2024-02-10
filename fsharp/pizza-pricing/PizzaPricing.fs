module PizzaPricing

type Pizza = 
    | Margherita
    | Caprese
    | Formaggio
    | ExtraSauce of Pizza
    | ExtraToppings of Pizza

let rec pizzaPrice = 
    function
    | Margherita -> 7
    | Caprese -> 9
    | Formaggio -> 10
    | ExtraSauce pizza-> 1 + pizzaPrice pizza
    | ExtraToppings pizza -> 2 + pizzaPrice pizza

let surcharge =
    function
    | 1 -> 3
    | 2 -> 2
    | _ -> 0

let orderPrice(pizzas: Pizza list): int = 
    List.sumBy pizzaPrice pizzas + surcharge pizzas.Length
    