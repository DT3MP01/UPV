function list() {
    return Array.from(arguments)
}

let list1 = list(1, 2, 3) // [1, 2, 3]
console.log(list1)