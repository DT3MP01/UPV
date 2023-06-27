/***************************************************
// var1.js
// 2.3.1 JS. Variables (tipo dinámico)
// transparencia 10 del tema 2. ejemplo ampliado.
***************************************************/

// x representa una cadena (string): 
let x = "texto" 
console.log(x)

// x ahora es un objeto:
x = {color:'rojo', marca:'seat', año:2018} 
console.log(x)
console.log(x.color)
console.log(x.año)
console.log(x.modelo)
console.log("..........")

// ahora un vector (array):
x = [1, 2, 3, "prueba", 6] 
console.log(x)
console.log(x[0])
console.log(x[3])
console.log(x[5])
console.log("..........")

// ahora una función:
x = function() {return "Ejemplo"} 
console.log(x)

// ¿qué tipo de valor mantiene y?
let y = x()
console.log(y)
console.log("..........")
