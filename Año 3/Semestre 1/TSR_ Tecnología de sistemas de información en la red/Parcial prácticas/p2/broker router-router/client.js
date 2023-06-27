const zmq = require('zeromq')

if (process.argv.length != 5) {
    console.log("Three arguments needed: node client.js urlFrontend nickClient txtPeticion")
    process.exit()
}

let req = zmq.socket('req');

let n = 0

let frontendPort = process.argv[2]
let txtPeticion = process.argv[4]

req.connect('tcp://localhost:' + frontendPort)

req.on('message', (msg) => { // Cuando frontend recibe un mensaje
    {
        console.log('resp: ' + msg)
        process.exit(0);
    }
})

req.send(txtPeticion) // Req añade automáticamente el delimitador, por lo que realmente enviará (['', 'txtPeticion']) a frontendPort

// El router, al recibirlo, le añade su identidad, por lo que él recibirá ([identity, '', 'txtPeticion'])

// En este caso, como client no tiene identidad, el router se la asignará automáticamente