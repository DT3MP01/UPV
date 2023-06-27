/***************************************************
// cbFiles4.js
// 2.5.3 JS. Ejemplo callbacks vs promesas
// transparencia 22 del tema 2. ejemplo modificado.
***************************************************/

const fsp = require('fs').promises 

const f1 = text => {
    const obj = JSON.parse(text)
    console.log(JSON.stringify(obj))
}

const f2 = error => { console.error(error) }

let filename = 'jsonFILEb.txt'
fsp.readFile(filename).then(f1).catch(f2)

console.log("root(2) =", Math.sqrt(2))