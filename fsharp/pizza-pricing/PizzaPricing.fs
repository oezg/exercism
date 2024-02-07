module PizzaPricing

// TODO: please define the 'Pizza' discriminated union type
type Pizza = 
    | Margherita
    | Caprese
    | Formaggio
    | ExtraSauce of Pizza
    | ExtraToppings of Pizza

let rec pizzaPrice (pizza: Pizza): int =
    match pizza with
    | Margherita -> 7
    | Caprese -> 9
    | Formaggio -> 10
    | ExtraSauce pzz-> 1 + pizzaPrice pzz
    | ExtraToppings pzz -> 2 + pizzaPrice pzz

let orderPrice(pizzas: Pizza list): int = 
    match pizzas with
    | [_] -> 3 + List.sumBy pizzaPrice pizzas
    | [_; _] -> 2 + List.sumBy pizzaPrice pizzas
    | _ -> List.sumBy pizzaPrice pizzas

