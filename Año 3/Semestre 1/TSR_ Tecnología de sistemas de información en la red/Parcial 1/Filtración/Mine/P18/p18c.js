if (process.argv.length != 4) {
    process.exit()
}

let i = parseInt(process.argv[2])
let f = parseInt(process.argv[3])

if (i > f) {
    process.exit()
}

let client = require('net').connect({ port: 9000 }, function () {
    setInterval(function () {
        client.write('' + i++)
    }, 10)
})

client.on('data', function (data) {
    if (i > f) {
        console.log(data.toString());
        client.end();
        process.exit()
    }
})

require('net').createServer(function (c) {
    var sum = 0
    c.on('data', function (data) {
        c.write('' + (sum + parseInt(data)))
    })
}).listen(9000)