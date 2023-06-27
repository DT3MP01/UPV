const a = require('zeromq').socket('dealer')

a.connect("tcp://127.0.0.1:10000")

a.on('message', msg => console.log(msg))

a.send("Hola")