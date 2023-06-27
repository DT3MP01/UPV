/***************************************************
// closures2.js
// 2.4.3 JS.  Clausuras
// transparencia 15 del tema 2. ejemplo ampliado.
***************************************************/

function multiplicarPor(x) {
   return y => { return x * y }
}
console.log(multiplicarPor)
console.log("multiplicarPor = " + multiplicarPor)
console.log("..........")

let triplicar = multiplicarPor(3)
console.log(triplicar)

console.log("triplicar = " + triplicar)
console.log("..........")

y = triplicar(21) 
console.log("y = " + y)
console.log("..........")

for (let i = 1; i <= 10; i++) {
    process.stdout.write(triplicar(i) + " ")
} 
console.log("\n..........")

let z = 2
let duplicar = multiplicarPor(z)
z = 7
y = duplicar(21) 
console.log("y = " + y)
console.log("..........")