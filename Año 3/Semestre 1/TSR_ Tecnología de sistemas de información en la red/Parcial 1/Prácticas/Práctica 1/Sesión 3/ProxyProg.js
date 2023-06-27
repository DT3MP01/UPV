const net = require('net');

const LOCAL_PORT = 8000;
const LOCAL_IP = '127.0.0.1';

var LOCAL_PORT_PROG = 8001;
var LOCAL_IP_PROG = 'localhost';

const REMOTE_PORT = process.argv[3];
const REMOTE_IP = process.argv[2]; // www.upv.es

if (process.argv.length != 4) {
    console.log("Two arguments, dirección IP del servidor and dirección IP local, are needed")
    process.exit()
}

const server = net.createServer(function (socket) {
    const serviceSocket = new net.Socket();

    serviceSocket.connect(parseInt(REMOTE_PORT),
        REMOTE_IP, function () {
            socket.on('data', function (msg) {
                serviceSocket.write(msg);
            });

            serviceSocket.on('data', function (data) {
                socket.write(data);
            });
        });
}).listen(LOCAL_PORT, LOCAL_IP);

var server_prog = net.createServer(
    function (socket_prog) {

        socket_prog.on('data',
            function (msg) {
                var conf = JSON.parse(msg);
                REMOTE_PORT = conf.remote_port;
                REMOTE_IP = conf.remote_ip;
                console.log("New configuration received");
            }
        );
    }
).listen(LOCAL_PORT_PROG, LOCAL_IP_PROG);

console.log("TCP server accepting connection on port: " + LOCAL_PORT);
console.log("TCP server programmer accepting connection on port: " + LOCAL_PORT_PROG);