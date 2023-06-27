const zmq = require('zeromq')

if (process.argv.length != 4) {
	console.log("Two arguments needed: node broker.js portFrontend portBackend")
	process.exit()
}

let cli = []
let req = []
let workers = []

let sc = zmq.socket('router') // frontend
let sw = zmq.socket('router') // backend

let frontendPort = process.argv[2]
let backendPort = process.argv[3]

let nClients = 0;
let total = 0;
let totalW = {}

sc.bind('tcp://*:' + frontendPort)
sw.bind('tcp://*:' + backendPort)

sc.on('message', (c, sep, m) => { // Cuando frontendPort recibe un mensaje
	if (workers.length == 0) {
		cli.push(c); // Añade el identificador propuesto por el router a cli
		req.push(m) // Añade el mensaje al array req
		console.log(req.toString())
		console.log(cli.toString())
	} else {
		let w = workers.shift()
		sw.send([w, '', c, '', m]) // Si se ha llamado a workers y se ejecuta client, se envía a backendPort y elimina el primer elemento de workers
		total++;
		totalW[w]++
		console.log(workers.toString() + ' 1 ')
	}
})

sw.on('message', (w, sep, c, sep2, r) => { // Cuando backendPort recibe un mensaje
	if (c == '') { // Si el cliente no tiene identificador (nombre)
		workers.push(w); // añade a workers el identificador del worker
		console.log(workers.toString() + ' 2 ')
		totalW[w] = 0;
		return
	}

	if (cli.length > 0) {
		let c = cli.shift()
		let r = req.shift()
		sw.send([w, '', c, '', r]) // Envía a backendPort
		total++;
		totalW[w]++;
		console.log('Envío: ' + 'sw.send' + ([w, '', c, '', r]).toString())
	} else {
		workers.push(w)
		console.log(workers.toString() + ' 3 ')
	}

	sc.send([c, '', r + ' ' + ++nClients]) // Envía a frontend
})

setInterval(() => {
    console.log("Total peticiones: " + total)
    for (let w in totalW) {
        console.log("Total del worker " + w + " : " + totalW[w])
    }
}, 5000)