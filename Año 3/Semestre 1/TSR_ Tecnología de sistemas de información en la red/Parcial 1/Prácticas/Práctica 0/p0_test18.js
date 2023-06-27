function product(a, b) {
    return a * b
}

function add(a, b) {
    return a + b
}

function substract(a, b) {
    return a - b
}

let arithmeticOperations = [product, add, substract]

console.log(arithmeticOperations[1](2, 3)) // [1] -> se refiere a la posición de la función a utilizar (add)

// EQUIVALENTEMENTE

let arithmeticOperations2 = [
    function (a, b) { return a * b },
    function (a, b) { return a + b },
    function (a, b) { return a - b }
]

console.log(arithmeticOperations2[0](2, 3))

