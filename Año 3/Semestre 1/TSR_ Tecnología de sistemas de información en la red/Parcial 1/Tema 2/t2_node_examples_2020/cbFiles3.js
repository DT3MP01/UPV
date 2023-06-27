/***************************************************
// cbFiles3.js
// 2.5.3 JS. Ejemplo callbacks vs promesas
// transparencia 22 del tema 2. ejemplo modificado.
***************************************************/

const fs = require('fs')

const f1 = text => {
   const obj = JSON.parse(text)
   console.log(JSON.stringify(obj))
}

const f2 = error => { console.error(error) }

let filename = 'jsonFILEb.txt'
fs.readFile(filename,
   function (error, text) {
      if (error) f2(error)
      else
         try { f1(text) }
         catch (e) { f2(e) }
   }
)

console.log("root(2) =", Math.sqrt(2))