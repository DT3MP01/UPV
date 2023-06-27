const zmq = require('zeromq')

let sin = zmq.socket('pull')
let sout = zmq.socket('push')

sout.connect('tcp://127.0.0.1:9999')
sin.bind('tcp://*:9997')

sin.on('message', n => { sout.send(['2', n]) }) // Cuando recibe un mensaje en 9997, envía '1 y mensaje' a 9999 

