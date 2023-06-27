/***************************************************
// stream2.js
// 3.5 NodeJS. Módulo stream. Ejemplo
// transparencia 33 del tema 2. ejemplo nuevo.
***************************************************/

const fs = require('fs')
const prompt = "\n*** Write the filename: "
const init = '*** FILE CONTENT IS:\n'
const end = '\n*** END OF FILE'
process.stdin.resume()
process.stdin.setEncoding("utf8")
process.stdout.write(prompt)

process.stdin.on("data", function (str) {
  let filename = str.slice(0, str.length - 1)
  fs.readFile(filename, function (err, data) {
    if (err) console.error(err)
    else console.log(init + data.toString() + end)
    process.stdout.write(prompt)
  })
})

process.stdin.on("end", function () { console.log("Terminating...") })