function add(x = 0, y = 0, ...others) {
    let sum = 0
    if (others.length > 0) {
        for (let i = 0; i < others.length; i++) {
            sum += others[i]
        }
    }
    return x + y + sum
}

console.log(add(5, 6, 7, 8, 9))

console.log(add({prop1: 12}, 2, 3))