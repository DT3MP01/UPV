const zmq = require('zeromq')

if (process.argv.length != 4) {
	console.log("Two arguments needed: node broker.js router1Port dealerPort")
	process.exit()
}

let cli = []
let req = []

let sr = zmq.socket('router') // frontend
let sd = zmq.socket('dealer')

let frontendPort = process.argv[2]
let dealerPort = process.argv[3]

sr.bind('tcp://*:' + frontendPort) // Router siempre hace bind
sd.bind('tcp://*:' + dealerPort) // Un dealer tiene que hacer un bind

let petitionsAttended = 0;

console.log('brokerC started')

sr.on('message', (c, sep, m) => { // Cuando frontendPort recibe un mensaje
	cli.push(c); // Añade el identificador propuesto por el router a cli
	req.push(m) // Añade el mensaje al array req
	console.log(req.toString())
	console.log(cli.toString())
	sd.send([c, '', m]) // Si se ha llamado a workers y se ejecuta client, se envía a backendPort y elimina el primer elemento de workers
})

sd.on('message', (c, sep2, r) => { // Cuando backendPort recibe un mensaje
									// El dealer no modifica los argumentos
	cli.splice(cli.indexOf(c), 1)
	req.splice(req.indexOf(r), 1)

	if (cli.length > 0) {
		sd.send([cli.shift(), '', req.shift()]) // Envía a backendPort
	}
	petitionsAttended++;
	sr.send([c, '', r + ' ' + petitionsAttended]) // Envía a frontend
})

// let port = process.argv[2]