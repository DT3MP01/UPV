const zmq = require('zeromq');
const pub = zmq.socket('pub');

if (process.argv.length < 3) {
    console.log("Two arguments, at least, needed: node publicador port numMessages topic1 topic2 ...")
    process.exit()
}

let port = process.argv[2];
// let numMessages = process.argv[3];

let topics = process.argv.slice(4); // returns a copy of the array starting by index 4

let topicsCount = new Array(topics.length);
topicsCount.fill(0); // fills all the array elements to 0

pub.bind('tcp://*:' + port);

let count = 0;

setInterval(() => {
    /* if (numMessages == count) { // Esto es para que el programa acabe
        pub.close();
        process.exit();
    } */

    let pos = count % topics.length;

    pub.send(++count + ': ' + topics[pos] + ' ' + ++topicsCount[pos]);
    // pub.send(topics[pos]);
}, 1000);