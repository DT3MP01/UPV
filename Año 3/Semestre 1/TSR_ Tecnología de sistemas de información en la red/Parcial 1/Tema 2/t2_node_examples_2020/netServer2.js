/***************************************************
// netServer2.js
// 3.6 NodeJS. Módulo net. Ejemplo 2
// transparencia 36 del tema 2. ejemplo modificado.
***************************************************/

const net = require('net') 

let server = net.createServer(
  function(c) { 
    console.log('server connected')
    c.on('end', () => { console.log('server disconnected') })
    c.on('error', () => { console.log('some connection error') })
    c.on('data', data => { console.log('data from client: ' + data.toString()) })	    
    c.pipe(c)
}) 

server.listen(9000, () => { console.log('server bound') })