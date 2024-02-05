module InterestIsInteresting

let interestRate = function
    | balance when balance < 0m -> 3.213f
    | balance when balance < 1000m -> 0.5f
    | balance when balance < 5000m -> 1.621f
    | _ -> 2.475f

let interest (balance: decimal): decimal =
   balance * decimal (interestRate balance) / 100m

let annualBalanceUpdate(balance: decimal): decimal =
   balance + interest balance

let amountToDonate(balance: decimal) (taxFreePercentage: float): int =
   if balance < 0m then 0
   else balance * decimal taxFreePercentage / 50m |> int
