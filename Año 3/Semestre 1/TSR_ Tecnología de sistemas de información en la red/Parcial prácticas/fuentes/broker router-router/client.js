const zmq = require('zeromq')

let req = zmq.socket('req');

req.connect('tcp://localhost:9998')

req.on('message', (msg) => {
	console.log('resp: ' + msg)
	process.exit(0);
})

req.send('Hola') // Req añade automáticamente el delimitador, por lo que realmente enviará (['', 'Hola']) al puerto 9998

// El router, al recibirlo, le añade su identidad, por lo que él recibirá ([identity, '', 'Hola'])

// En este caso, como client no tiene identidad, el router se la asignará automáticamente