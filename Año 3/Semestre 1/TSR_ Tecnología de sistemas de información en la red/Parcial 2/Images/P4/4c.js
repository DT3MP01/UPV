const c = require('zeromq').socker('dealer')

c.connect("tcp://127.0.0.1:10001")

c.on('message', msg => console.log(msg))

c.send("Hola")