const zmq = require('zeromq')

if (process.argv.length != 5) {
	console.log("Three arguments needed: node worker.js router2Port nickWorker txtRespuesta")
	process.exit()
}

let backendPort = process.argv[2]
let workerNick = process.argv[3]
let txtRespuesta = process.argv[4]

let req = zmq.socket('req')
req.identity = workerNick
req.connect('tcp://localhost:' + backendPort)

req.on('message', (c, sep, msg) => { // Cuando backendPort recibe un mensaje
	setTimeout(() => {
		req.send([c, '', txtRespuesta])
		console.log(workerNick + ': sending response')
	}, 1000)
})

req.send(['', '', '']) // Req añade automáticamente el delimitador, por lo que realmente enviará (['', '', '', '']) a backendPort

// El router, al recibirlo, le añade su identidad, por lo que recibirá ([req.identity, '', '', '', ''])