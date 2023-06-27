const zmq = require('zeromq')
let sub = zmq.socket('sub')
sub.connect('tcp://127.0.0.1:9999')
sub.subscribe('uno') // socket only receives messages which have 'uno' as a prefix
sub.on('message', (m) => { console.log('1', m + '') }) // console.log('1', m.toString())
