// No funciona

const zmq = require('zeromq')

if (process.argv.length < 3) {
    console.log("Two arguments, at least, needed: node publicador port numMessages topic1 topic2 ...")
    process.exit()
}

let pub = zmq.socket('pub')

pub.bind('tcp://*:' + process.argv[2])

let msg = process.argv.slice(4); // returns a copy of process.argv starting by 4

// let topicsCount = new Array(topics.length);
// tCount.fill(0);

let maximum = process.argv[3];
let firstParameter = process.argv[4];

let pos = maximum % msg.length;

let i = 0;
let numbers = 1;

function emit() {
    if (i == maximum) {
        pub.close();
        process.exit()
    }

    let m = msg[0];

    pub.send((i + 1).toString() + ': ' + m + ' ' + numbers.toString());

    // Rotatory
    msg.shift(); // deletes the first element of array and returns it

    msg.push(m); // adds to the end of array and returns new length of array

    if (firstParameter == msg[0]) {
        numbers++;
    }

    ++i;
}

setInterval(emit, 1000) // every second