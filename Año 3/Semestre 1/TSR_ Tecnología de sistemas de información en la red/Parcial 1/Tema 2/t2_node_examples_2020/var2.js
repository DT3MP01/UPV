/***************************************************
// var2.js
// 2.3.1 JS. Variables (tipo dinámico)
// transparencia 10 del tema 2. ejemplo ampliado.
***************************************************/

let x = '7' // x vale "7"
console.log("x = " + x + " ; typeof(x) = " + typeof(x))

x == 7      // true (por conversión implícita de tipos)
console.log("x == 7 : " + (x == 7))

x === 7     // false (comparación estricta)
console.log("x === 7 : " + (x === 7))

x + 23      // genera "723" (+ como concatenación de string)
let y = x + 23
console.log("y = " + y + " ; typeof(y) = " + typeof(y))

x + "2"     // genera "72"
var z = x + "2"
console.log("z = " + z + " ; typeof(z) = " + typeof(z))

x * 2       // genera 14 (previa conversión del valor de x a número)
let a = x * 2 
console.log("a = " + a + " ; typeof(a) = " + typeof(a))

let q = "qaq" 
let b = q * 2 // genera NaN (al no disponer de 2 operandos número)
console.log("b = " + b + " ; typeof(b) = " + typeof(b))