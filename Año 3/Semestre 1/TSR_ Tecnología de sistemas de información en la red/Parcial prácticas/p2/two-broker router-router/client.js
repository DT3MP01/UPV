const zmq = require('zeromq')

if (process.argv.length != 5) {
    console.log("Three arguments needed: node client.js router1Port nickClient txtPeticion")
    process.exit()
}

let frontendPort = process.argv[2]
let clientNick = process.argv[3]
let txtPeticion = process.argv[4]

let req = zmq.socket('req');
req.connect('tcp://localhost:' + frontendPort)
req.identity = clientNick;

req.on('message', (msg) => { // Cuando frontend recibe un mensaje
    {
        console.log('\n' + clientNick + ' resp: ' + msg)
        process.exit();
    }
})

req.send(txtPeticion) // Req añade automáticamente el delimitador, por lo que realmente enviará (['', 'txtPeticion']) a frontendPort

// El router, al recibirlo, le añade su identidad, por lo que él recibirá ([identity, '', 'txtPeticion'])

// En este caso, como client no tiene identidad, el router se la asignará automáticamente