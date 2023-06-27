const zmq = require('zeromq')

let s = zmq.socket('req')

req.connect('tcp://localhost:9999')

s.on('message', (c, sep, m) => {
    setTimeout(() => {
        s.send([c, '', 'resp'])
    }, 1000)
})

s.send(['', '', ''])