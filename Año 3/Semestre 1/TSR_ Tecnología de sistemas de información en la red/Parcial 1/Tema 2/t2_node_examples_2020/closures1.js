/***************************************************
// closures1.js
// 2.4.3 JS.  Clausuras
// transparencia 15 del tema 2. ejemplo ampliado.
***************************************************/

function creaFunc() {
   let nombre = "Mozilla"
   return () => { console.log(nombre) }
}
console.log(creaFunc)
console.log("creaFunc = " + creaFunc)
console.log("..........")

let miFunc = creaFunc()
console.log(miFunc)
console.log("miFunc = " + miFunc)
console.log("..........")

miFunc()
let nombre = "Chrome"
miFunc()
console.log(nombre)