const net = require('net');

if (process.argv.length != 4) {
    console.log("Two arguments, dirección IP del servidor and dirección IP local, are needed")
    process.exit()
}

var IPServer = process.argv[2];
var IPClient = process.argv[3];

const client = net.connect(8000, IPServer,
    function () { // connect listener
        console.log('client connected');
        client.write(IPClient);
    });

client.on('data',
    function (data) {
        console.log(data.toString());
        client.end(); // no more data written to the stream
    });

client.on('end',
    function () {
        console.log('client disconnected');
        process.exit();
    });