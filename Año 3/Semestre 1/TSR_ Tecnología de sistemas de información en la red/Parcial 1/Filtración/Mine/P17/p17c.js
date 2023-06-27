const net = require('net')
const prompt = "*** Write the filename: "

require('net').createServer(function (c) {
    /* COMPLETAR */
    c.on('data', function (file) {
        require('fs').readFile(file, function (err, data) {
            if (err) {
                c.write('Unable to read ' + file + ' file');
            } else {
                c.write(data);
            }
        })
    })
}).listen(9000)

process.stdin.resume();
process.stdin.setEncoding("utf8")
process.stdout.write(prompt)

process.stdin.on('data', function (str) {
    let client = net.connect({ port: 9000 }, function () {
        client.write(str.slice(0, str.length))
    })
    client.on('data', function (data) {
        console.log(data.toString());
        process.stdout.write(prompt)
    })
})