/***************************************************
// func.js
// 2.4 JS. Funciones
// transparencia 12 del tema 2. ejemplo ampliado.
***************************************************/

const doble = function(x) { return 2 * x }
let x = doble(28)
console.log(x)

let triple = (x) => { return 3 * x }
console.log(triple(4))

// en las siguientes líneas,
// ¿qué sucede si se cambia "dobleB" por "doble"?
function dobleB(x) { return 2 * x }
console.log(dobleB(7))

const square = x => { return x * x }
console.log(square(6))

const power = (x, y) => { return x ** y }
console.log(power(2, 8))