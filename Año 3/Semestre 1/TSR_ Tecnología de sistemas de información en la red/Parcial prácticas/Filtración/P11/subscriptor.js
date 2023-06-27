const sub = require('zeromq').socket('sub')

if (process.argv.length != 4) { // Esto lo he añadido yo
    console.log('One argument needed: node subscriptor1 toConnect toSubscribe')
    process.exit()
}

sub.connect('tcp://127.0.0.1:' + process.argv[2])
sub.subscribe(process.argv[3]) // sub solo puede recibir mensajes que empiecen por process.argv[3]

sub.on('message', m => console.log("msg: " + m))