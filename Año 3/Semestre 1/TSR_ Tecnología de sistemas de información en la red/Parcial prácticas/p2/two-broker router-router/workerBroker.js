const zmq = require('zeromq')

if (process.argv.length != 4) {
	console.log("Two arguments needed: node broker.js dealerPort router2Port")
	process.exit()
}

let workers = []

let sd = zmq.socket('dealer') // dealerPort
let sr = zmq.socket('router') // backend

let dealerPort = process.argv[2]
let backendPort = process.argv[3]

sd.connect('tcp://localhost:' + dealerPort) // El otro dealer hace el bind
sr.bind('tcp://*:' + backendPort) // Routers siempre hace bind

console.log('brokerW started')

sd.on('message', (c, sep, m) => { // Cuando frontendPort recibe un mensaje
	if (workers.length > 0) {
		let w = workers.shift()
		sr.send([w, '', c, '', m]) // Si se ha llamado a workers y se ejecuta client, se envía a backendPort y elimina el primer elemento de workers
		console.log(workers.toString() + ' 1 ')
	}
})

sr.on('message', (w, sep, c, sep2, r) => { // Cuando backendPort recibe un mensaje
	if (c == '') { // Si el cliente no tiene identificador (nombre)
		workers.push(w); // añade a workers el identificador del worker
		console.log(workers.toString() + ' 2 ')
		return
	} else {
		workers.push(w)
		sd.send([c, '', r]) // Envía a clientBroker
		console.log(workers.toString() + ' 3 ')
	}
})