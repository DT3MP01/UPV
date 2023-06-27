/***************************************************
// netClient3.js
// 3.6 NodeJS. Módulo net. Ejemplo 3
// transparencia 37 del tema 2. ejemplo modificado.
***************************************************/

const net = require('net')  
let show = console.log

if (process.argv.length != 4) {
    show("Two arguments, function and number, are needed")
    process.exit()
}

let fun = process.argv[2]
let num = Math.abs(parseInt(process.argv[3]))

// The server is in our same machine.
let client = net.connect({port: 9000},
   function() {
      show('client connected')
      let request = {"fun":fun, "num":num}
      client.write(JSON.stringify(request))
}) 

client.on('data', data => { show(data.toString()); client.end() })
client.on('end', () => { show('client disconnected') })
client.on('error', () => { show('some connection error') })