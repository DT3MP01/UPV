const zmq = require('zeromq')

let s = zmq.socket('dealer')

req.connect('tcp://localhost:9999')

s.on('message', (sep, c, sep2, m) => {
    setTimeout(() => {
        s.send(['', c, '', 'resp'])
    }, 1000)
})

s.send(['', '', ''])