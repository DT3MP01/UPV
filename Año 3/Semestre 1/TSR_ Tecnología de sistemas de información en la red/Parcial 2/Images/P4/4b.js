const ac = require('zeromq').socket('dealer')
const ca = require('zeromq').socket('dealer')

ac.bind("tcp://127.0.0.1:10000", err => {
    if (err) {
        throw err;
    }
})

ca.bind("tcp://127.0.0.1:10001", err => {
    if (err) {
        throw err;
    }
})

ac.on('message', msg => ca.send(msg + '').toUpperCase())
ca.on('message', msg => ac.send(msg + '').toLowerCase())