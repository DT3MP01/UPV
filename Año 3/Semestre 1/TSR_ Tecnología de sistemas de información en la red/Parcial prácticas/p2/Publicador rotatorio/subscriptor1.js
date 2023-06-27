const zmq = require('zeromq')

if (process.argv.length != 3) {
    console.log('One argument needed: node subscriptor1 port')
    process.exit()
}

let sub = zmq.socket('sub')

sub.connect('tcp://127.0.0.1:' + process.argv[2])

sub.subscribe('') // sub can receive any message

sub.on('message', (m) => { console.log(m + '') }) // console.log(m.toString())
