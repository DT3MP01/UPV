function square(x) {
    return x * x
}

let a = square
let b = a(3)
let c = a

console.log(a)
console.log(b)
console.log(c)