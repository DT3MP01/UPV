function add(x, y, z) {
    return x + y + z
}

console.log(add(1, 2, 3)) // 6
console.log(add(2, 7)) // NaN
console.log(add(null)) // NaN
console.log(add(1, 2, 3, 4, 5)) // 6

function add2(x = 0, y = 0, z = 0) {
    return x + y + z
}

console.log()
console.log(add2(1, 2, 3)) // 6
console.log(add2(2, 7)) // 9
console.log(add2(null)) // 0
console.log(add2(1, 2, 3, 4, 5)) // 6