export function cookingStatus(remainingTime) {
    if (remainingTime === undefined)
        return 'You forgot to set the timer.'
    if (remainingTime === 0)
        return 'Lasagna is done.'
    return 'Not done, please wait.'
}

export function preparationTime(layersArray, minutesPerLayer=2) {
    let number = Number(minutesPerLayer)
    return layersArray.length * number
}

export function quantities(layersArray) {
    let amounts = { noodles: 0, sauce: 0 }
    for (let layer of layersArray) {
        if (layer == 'noodles') {
            amounts.noodles += 50;
        } else if (layer == 'sauce') {
            amounts.sauce += 0.2;
        }
    }
    return amounts
}

export function addSecretIngredient(friendsList, myList) {
    myList.push(friendsList[friendsList.length - 1])
}

export function scaleRecipe(recipe, portions) {
    let newRecipe = {}
    for (let ingredient in recipe) {
        newRecipe[ingredient] = recipe[ingredient] / 2 * portions
    }
    return newRecipe
}