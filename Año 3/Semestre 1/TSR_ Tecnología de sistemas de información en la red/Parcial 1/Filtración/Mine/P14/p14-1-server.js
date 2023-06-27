// netServer.js

require('net').createServer(function (c) {
    c.on('data', function () {
        c.write('Hello');
        // c.pipe(c);
    })
}).listen(9000)