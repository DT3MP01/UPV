const zmq = require('zeromq')

let cli = []
let req = []
let workers = []

let sc = zmq.socket('router') // frontend
let sw = zmq.socket('router') // backend

sc.bind('tcp://*:9998')
sw.bind('tcp://*:9999')

sc.on('message', (c, sep, m) => { // Cuando 9998 recibe un mensaje
	if (workers.length == 0) {
		cli.push(c); // Añade el identificador propuesto por el router a cli
		req.push(m) // Añade el mensaje al array req
		console.log(req.toString())
		console.log(cli.toString())
	} else {
		sw.send([workers.shift(), '', c, '', m]) // Si se ha llamado a workers y se ejecuta client, se envía a 9999 y elimina el primer elemento de workers
		console.log(workers.toString() + ' 1 ')
	}
})

sw.on('message', (w, sep, c, sep2, r) => { // Cuando 9999 recibe un mensaje
	if (c == '') {
		workers.push(w); // añade a workers el identificador del worker
		console.log(workers.toString() + ' 2 ')
		return
	}

	if (cli.length > 0) {
		sw.send([w, '', cli.shift(), '', req.shift()]) // Envía a 9999
		console.log('Envío: ' + sw.send([w, '', cli.shift(), '', req.shift()]))
	} else {
		workers.push(w)
		console.log(workers.toString() + ' 3 ')
	}

	sc.send([c, '', r])
})