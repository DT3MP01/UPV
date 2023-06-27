/***************************************************
// netClient2.js
// 3.6 NodeJS. Módulo net. Ejemplo 2
// transparencia 36 del tema 2. ejemplo modificado.
***************************************************/

const net = require('net')  
let cont = 0

let connectListener = function() {
  console.log('client connected')
  client.write(cont + ' world!')
}

let dataListener = function(data) {
  console.log(data.toString())
  if (cont > 1000) client.end()
  else client.write(++cont + ' world!')
}

// The server is in our same machine.
let client = net.connect({port: 9000}, connectListener)  
client.on('data', dataListener)
client.on('end', () => { console.log('client disconnected') })
client.on('error', () => { console.log('some connection error') })